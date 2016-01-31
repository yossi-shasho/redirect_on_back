(function () {
    function getCookie(c_name) {
        var c_value = document.cookie;
        var c_start = c_value.indexOf(" " + c_name + "=");
        if (c_start == -1) {
            c_start = c_value.indexOf(c_name + "=");
        }
        if (c_start == -1) {
            c_value = null;
        }
        else {
            c_start = c_value.indexOf("=", c_start) + 1;
            var c_end = c_value.indexOf(";", c_start);
            if (c_end == -1) {
                c_end = c_value.length;
            }
            c_value = unescape(c_value.substring(c_start, c_end));
        }
        return c_value;
    }

    var redirectIfNeeded = function() {
        $('input[name=_usec]').each(function () {
            var redirect_path, token;
            if (token = $(this).val()) {
                redirect_path = getCookie("redirect_" + token);
                if (redirect_path && redirect_path.length) {
                    $('body').hide();
                    return window.location.href = redirect_path;
                }
            }
        });
    };

    $(redirectIfNeeded);
    $(document).on('page:change', redirectIfNeeded); // turbolinks support
})();