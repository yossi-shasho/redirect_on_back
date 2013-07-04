$(function() {
    return $('input[name=_usec]').each(function() {
        var redirect_path, token;
        if (token = $(this).val()) {
            redirect_path = $.cookie("redirect_" + token);
            if (redirect_path) {
                $('body').hide();
                return window.location.href = redirect_path;
            }
        }
    });
});