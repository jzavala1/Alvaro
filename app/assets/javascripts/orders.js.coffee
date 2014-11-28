# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $('.bind-show-products').click ->
    id = $(this).data('order-id')
    $('#order-' + id).toggleClass('hide')

$(document).ready(ready)
$(document).on('page:load', ready)