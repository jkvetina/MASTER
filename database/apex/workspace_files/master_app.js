//
// WAIT FOR ELEMENT TO EXIST
//
const wait_for_element = function(search, start, fn, disconnect) {
    var ob  = new MutationObserver(function(mutations) {
        if ($(search).length) {
            fn(search, start);
            if (disconnect) {
                observer.disconnect();  // keep observing
            }
        }
    });
    //
    ob.observe(document.getElementById(start), {
        childList: true,
        subtree: true
    });
};



//
// COPY TO CLIPBOARD
//
const copy_to_clipboard = function (text) {
    var dummy = document.createElement('textarea');
    document.body.appendChild(dummy);
    dummy.value = text;
    dummy.select();
    document.execCommand('copy');
    document.body.removeChild(dummy);
}



//
// COPY GRID CELL - ATTACH ONLY TO GRIDS
//
/*
const attach_copy_to_grid = function (el) {
    console.log('ADDING...', el);
    $(el).one('copy', (event) => {
        console.log('ATTACHED');
        event.clipboardData.setData('text/plain', $(document.activeElement)[0].innerText || window.getSelection());
        event.preventDefault();
    });
};
//
wait_for_element('.a-GV-cell', 'main', attach_copy_to_grid);
*/



//
// CREATE COLORFUL IG/IR CELLS
//
const color_cell = function (options, value, title, color_bg, color_text) {
    if (value && value.length && ((color_bg && color_bg.length) || (color_text && color_text.length))) {
        options.defaultGridColumnOptions = {
            cellTemplate: '<div style="background: ' + color_bg + '; color: ' + color_text + ';" title="' + title + '">' + value + '</div>'
        };
    }
    else {
        options.defaultGridColumnOptions = {
            cellTemplate: '<span title="' + title + '">' + value + '</span>'
        };
    }
    return options;
}



//
// WHEN PAGE LOADS
//
var init_page = function() {
    // autohide success messages, but this is actually ignoring AJAX messages
    apex.theme42.util.configAPEXMsgs({
        autoDismiss : true,
        duration    : 2500
    });

    // catch message event
    apex.message.setThemeHooks({
        beforeShow: function(pMsgType, pElement$) {  // beforeShow, beforeHide
            //console.log('MESSAGE:', pMsgType, pElement$);

            // unescape HTML in error message
            var $err = $('#APEX_ERROR_MESSAGE');
            $err.html($('<textarea />').html($err.html()).text());

            // this message can be from AJAX call (AJAX_PING process) and then it wont be autoclosed
            if (pMsgType === apex.message.TYPE.SUCCESS) {
                setTimeout(() => {
                    apex.message.hidePageSuccess();
                }, 2500);
            }
        },
        beforeHide: function(pMsgType, pElement$) {  // beforeShow, beforeHide
            //if (pMsgType === apex.message.TYPE.ERROR) {  // SUCCESS, ERROR
            //}
            // hide from url so user can refresh the page without the message
            const url = new URL(location);
            url.searchParams.set('success_msg', '');
            history.pushState({}, '', url);
        }
    });

    //
    // ADJUST GRIDS
    //
    fix_grid_toolbars();
    fix_grid_save_button();

    //
    // PING FOR LOGGED USERS
    //
    const ping_interval = parseInt(apex.item('P0_AJAX_PING_INTERVAL').getValue());
    if (apex.item('P0_AJAX_PING_INTERVAL').node && ping_interval > 0) {
        (function loop(i) {
            setTimeout(function() {
                console.log('CALL AJAX_PING');
                apex.server.process (
                    'AJAX_PING',
                    {
                        //x01: 1,
                        //x02: 2,
                        //x03: 3,
                        //p_arg_names   : [''],     // set items?
                        //p_arg_values  : [''],
                    },  // params
                    {
                        async       : true,
                        dataType    : 'json',
                        success     : function(data) {
                            if (data.message) {
                                if (data.status == 'SUCCESS') {
                                    apex.message.showPageSuccess(data.message);
                                }
                                else if (data.status == 'WARNING' || data.status == 'ERROR') {
                                    apex.message.showErrors([{
                                        type:       apex.message.TYPE.ERROR,
                                        location:   ['page'],
                                        message:    data.message,
                                        unsafe:     false
                                    }]);
                                }
                            }
                        }
                    }
                );
                loop(i);
            }, ping_interval * 1000);  // interval in miliseconds
        })();
    }
};



//
// COMMON TOOLBAR FOR ALL GRIDS
//
var fix_grid_toolbars = function () {
    $('.a-IG').each(function() {
        var $parent = $(this).parent();
        var id      = $parent.attr('id');
        //
        if (!$parent.hasClass('ORIGINAL')) {
            //console.log('GRID MODIFIED', id);
            fix_grid_toolbar(id);
        }
    })
};
//
var fix_grid_toolbar = function (region_id) {
    console.group('FIX_GRID_TOOLBAR', region_id);
    //
    var $region     = $('#' + region_id);
    var widget      = apex.region(region_id).widget();
    var actions     = widget.interactiveGrid('getActions');
    var toolbar     = widget.interactiveGrid('getToolbar');
    var config      = $.apex.interactiveGrid.copyDefaultToolbar();
    var action1     = config.toolbarFind('actions1');
    var action2     = config.toolbarFind('actions2');
    var action3     = config.toolbarFind('actions3');
    var action4     = config.toolbarFind('actions4');
    //
    //console.log('TOOLBAR DATA - ORIGINAL', config_bak.data);
    //console.log('ACTIONS', widget.interactiveGrid('getActions').list());

    // manipulate buttons
    // https://docs.oracle.com/en/database/oracle/application-express/20.1/aexjs/interactiveGrid.html#actions-section
    //
    // grid actions
    // widget.interactiveGrid('getActions').list()
    //console.log('ACTIONS', widget.interactiveGrid('getActions').list());
    //
    // row actions
    // widget.interactiveGrid('getViews').grid.rowActionMenu$.menu('option')
    //

    // hide some buttons
    actions.hide('reset-report');
    actions.show('change-rows-per-page');

    // modify add row button as a plus sign without text
    for (var i = 0; i < action3.controls.length; i++) {
        var button = action3.controls[i];
        if (button.action == 'selection-add-row') {
            button.icon         = 'fa fa-plus';
            button.iconOnly     = true;
            button.label        = ' ';
            break;
        }
    }

    // add action to save all rows in grid
    if ($region.hasClass('SAVE_ALL')) {
        actions.add({
            name    : 'SAVE_ALL',
            action  : function(event, element) {
                var region_id   = event.delegateTarget.id.replace('_ig', '');
                var grid        = apex.region(region_id).widget();
                var model       = grid.interactiveGrid('getViews', 'grid').model;
                console.log('CALL SAVE_ALL', region_id, grid, model);
                //
                model.forEach(function(r) {
                    try {
                        if (!model.getValue(r, 'ITEM_NAME').endsWith('?')) {
                            model.setValue(r, 'ITEM_TYPE', model.getValue(r, 'ITEM_TYPE') + ' ');  // fake change
                            console.log('CHANGED ROW', model.getValue(r, 'ITEM_NAME'), model.getValue(r, 'ITEM_TYPE'));
                        }
                    }
                    catch(err) {  // deleted rows cant be changed
                    }
                });
                grid.interactiveGrid('getActions').invoke('save');
                grid.interactiveGrid('getCurrentView').model.fetch();
            }
        });
        //
        action2.controls.push({
            type        : 'BUTTON',
            label       : 'Save All Rows',
            id          : 'save_all_rows',
            icon        : '',
            action      : 'SAVE_ALL'
        });
    }

    // add action to save all selected and changed rows
    if ($region.hasClass('SAVE_SELECTED')) {
        actions.add({
            name    : 'SAVE_SELECTED',
            action  : function(event, element) {
                var region_id   = event.delegateTarget.id.replace('_ig', '');
                var grid        = apex.region(region_id).widget();
                var model       = grid.interactiveGrid('getViews', 'grid').model;
                var gridview    = grid.interactiveGrid('getViews').grid;
                var selected    = grid.interactiveGrid('getViews').grid.getSelectedRecords();
                var id;
                var changed = [];
                console.log('CALL SAVE_SELECTED', region_id, grid, model);
                //
                for (var i = 0; i < selected.length; i++ ) {
                    id = gridview.model.getRecordId(selected[i]);
                    changed.push(id);
                };
                //
                model.forEach(function(r) {
                    for (var i = 0; i < changed.length; i++ ) {
                        if (changed[i] == gridview.model.getRecordId(r)) {
                            try {
                                model.setValue(r, 'ITEM_TYPE', model.getValue(r, 'ITEM_TYPE') + ' ');  // fake change
                                console.log('CHANGED ROW', model.getValue(r, 'ITEM_TYPE'));
                            }
                            catch(err) {  // deleted rows cant be changed
                            }
                        }
                    }
                });
                //
                grid.interactiveGrid('getActions').invoke('save');

                // refresh grid after save
                //grid.interactiveGrid('getViews', 'grid').model.clearChanges();
                //grid.interactiveGrid('getActions').invoke('refresh');
                grid.interactiveGrid('getCurrentView').model.fetch();
            }
        });
        //
        action2.controls.push({
            type        : 'BUTTON',
            label       : 'Save Selected',
            id          : 'save_all_rows',
            icon        : '',
            action      : 'SAVE_SELECTED',
        });
    }

    action4.controls.unshift({
        type    : 'SELECT',
        action  : 'change-rows-per-page'
    });

    // show refresh button before save button
    action4.controls.push({
        type            : 'BUTTON',
        action          : 'refresh',
        label           : 'Refresh',
        icon            : '',
        iconBeforeLabel : true
    });

    // only for developers
    if ($('#apexDevToolbar.a-DevToolbar')) {
        // add a filter button after the actions menu
        action4.controls.push({
            type        : 'BUTTON',
            action      : 'save-report',
            label       : 'Save as Default',
            icon        : ''  // no icon
        });
    }

    // update toolbar
    //actions.set('edit', true);
    toolbar.toolbar('option', 'data', config);
    toolbar.toolbar('refresh');
    console.groupEnd();
};



//
// FIX GRID SAVE BUTTON - look for css change on Edit button and apply it to Save button
//
var fix_grid_save_button = function () {
    var observer = new MutationObserver(function(mutations) {
        mutations.forEach(function(mutation) {
            var $target = $(mutation.target);
            if ($target.hasClass('is-active')) {
                var $save = $target.parent().parent().find('button.a-Button.a-Toolbar-item.js-actionButton[data-action="save"]');
                $save.addClass('is-active');
                //observer.disconnect();  // remove observer when fired
            }
        });
    });
    //
    $.each($('div.a-Toolbar-toggleButton.js-actionCheckbox.a-Toolbar-item[data-action="edit"] > label'), function(i, el) {
        // assign unique ID + apply tracker/observer
        $el = $(el);
        $el.attr('id', 'OBSERVE_' + $el.attr('for'));
        console.log('TRACKING GRID', $el, $el.attr('for'));
        observer.observe($el[0], {
            attributes: true
        });
    });
};



//
// FIX GRID FOLDING - fold (hide) requested group (Control Break)
//
var fold_grid_group = function(grid_id, group_name, group_value) {
    (function loop(i) {
        setTimeout(function() {
            var $x = $('#' + grid_id + ' table tbody tr:first button');
            if ($x) {
                var $b = $x.parent().find('.a-GV-controlBreakLabel');
                if ($b.find('.a-GV-breakLabel').text().includes(group_name) && $b.find('.a-GV-breakValue').text().includes(group_value)) {
                    $x.click();
                    $x.blur();
                    $(window).scrollTop(0);
                    return;
                }
            }
            if (--i) loop(i);
        }, 1000)
    })(10);
};

