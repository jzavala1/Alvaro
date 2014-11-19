$( document ).ready(function() {

    $('.bind-show-products').click( function () {
        var id = $(this).data('retiro-id');
        $('#retiro-' + id).toggleClass('hide');
    });

});