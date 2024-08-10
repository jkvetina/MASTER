// ----------------------------------------
// Page: 9999 - Login Page > Dynamic Action: SHOW_SUCCESS > Action: Execute JavaScript Code > Settings > Code

show_success(apex.item('P9999_SUCCESS_MESSAGE').getValue());

// remove message from browser address
let url = new URL(document.location);
if (url.searchParams.has('p9999_success')) {
    url.searchParams.delete('p9999_success');
    window.history.replaceState(null, null, url.toString().replaceAll('%3A', ':').replaceAll('%2C', ','));
}


// ----------------------------------------
// Page: 9999 - Login Page > Dynamic Action: SHOW_ERROR > Action: Execute JavaScript Code > Settings > Code

show_error(apex.item('P9999_ERROR_MESSAGE').getValue());

// remove message from browser address
let url = new URL(document.location);
if (url.searchParams.has('p9999_error')) {
    url.searchParams.delete('p9999_error');
    window.history.replaceState(null, null, url.toString().replaceAll('%3A', ':').replaceAll('%2C', ','));
}
else {
    // remove oldschool args
    window.history.replaceState(null, null, url.toString().split(':P9999_ERROR:')[0]);
}


