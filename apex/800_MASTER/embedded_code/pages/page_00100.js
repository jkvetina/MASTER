// ----------------------------------------
// Page: 100 - #fa-navicon > JavaScript > Function and Global Variable Declaration

const favorite_switch = function(el) {
    $el = $(el);
    apex.server.process (
        'FAVORITE_SWITCH',
        {
            x01: $el.data('app-id')
        },
        {
            async       : false,
            dataType    : 'json',
            success     : function(data) {
                // switch current icon
                // @TODO: it would be better to get new icon from server process
                var $icon = $el.find('span.fa');
                if ($icon.hasClass('fa-heart')) {
                    $icon.removeClass('fa-heart');
                    $icon.removeClass('RED');
                    $icon.addClass('fa-heart-o');
                }
                else {
                    $icon.removeClass('fa-heart-o');
                    $icon.addClass('fa-heart');
                    $icon.addClass('RED');
                }

                // show result
                show_message(data);
            }
        }
    );
};


// ----------------------------------------
// Page: 100 - #fa-navicon > Dynamic Action: TEST_MESSAGE_ON_LOAD > Action: Execute JavaScript Code > Settings > Code

show_success('Success Message');
//show_warning('Warning Message');
//show_error('Error Message');

