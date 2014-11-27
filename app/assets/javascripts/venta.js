$( document ).ready(function() {

    $('.bind-show-products-sold').click( function () {
        var id = $(this).data('ventum-id');
        $('#ventum-' + id).toggleClass('hide');
    });

});