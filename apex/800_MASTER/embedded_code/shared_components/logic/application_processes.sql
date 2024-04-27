-- ----------------------------------------
-- Application Process: AJAX_PING > Source > PL/SQL Code

app.ajax_ping();

-- ----------------------------------------
-- Application Process: FIX_FIRST_MESSAGE > Source > PL/SQL Code

-- intercept message injected on page (typically after page submit)
APEX_JAVASCRIPT.ADD_INLINE_CODE (
    p_code => '
var message = $("#APEX_SUCCESS_MESSAGE .t-Alert-content h2.t-Alert-title").text();
console.log("MESSAGE INTERCEPTED", message);
$("#APEX_SUCCESS_MESSAGE").html("");
apex.jQuery(window).on("theme42ready", function() {
    show_message(message);
});'
);

-- ----------------------------------------
-- Application Process: GET_AVATAR > Source > PL/SQL Code

app.download_avatar();

-- ----------------------------------------
-- Application Process: INIT_DEFAULTS > Source > PL/SQL Code

app.init_defaults();

