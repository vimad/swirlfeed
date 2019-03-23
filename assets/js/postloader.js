$(document).ready(function () {
    $('#loading').show();

    $.ajax({
        url: "includes/handlers/ajax_load_posts.php",
        type: "POST",
        data: "page=1&userLoggedIn=" + userLoggedIn,
        cache: false,

        success: function (data) {
            $('#loading').hide();
            $('.posts_area').html(data);
        }
    });

    $(window).scroll(function () {
        var height = $('.posts_area').height();
        var scroll_top = $(this).scrollTop();
        var page = $('.nextPage').last().val();
        var noMorePosts = $('.noMorePosts').last().val();

        if (($(document).height()== $(window).scrollTop() + $(window).height()) && noMorePosts == 'false') {
            $('#loading').show();

            var ajaxReq = $.ajax({
                url: "includes/handlers/ajax_load_posts.php",
                type: "POST",
                data: "page=" + page + "&userLoggedIn=" + userLoggedIn,
                cache: false,

                success: function (response) {
                    $('.post_area').find('.nextPage').remove();
                    $('.post_area').find('.noMorePosts').remove();
                    
                    $('#loading').hide();
                    $('.posts_area').append(response);
                }
            });
        } //end if
        
        return false;
    }); //(window).scroll(function ()
}); //(document).ready(function ()
