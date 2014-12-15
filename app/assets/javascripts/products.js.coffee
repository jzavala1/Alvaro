# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $('.bindInformation').click ->
    $('#basicInformation').removeClass('hidden')
    $('.bindInformation').addClass('active')
    $('#category').addClass('hidden')
    $('#price').addClass('hidden')
    $('.bindPrice').removeClass('active')
    $('.bindCategory').removeClass('active')

  $('.bindPrice').click ->
    $('#price').removeClass('hidden')
    $('.bindPrice').addClass('active')
    $('#basicInformation').addClass('hidden')
    $('#category').addClass('hidden')
    $('.bindInformation').removeClass('active')
    $('.bindCategory').removeClass('active')

  $('.bindCategory').click ->
    $('#category').removeClass('hidden')
    $('.bindCategory').addClass('active')
    $('#price').addClass('hidden')
    $('#basicInformation').addClass('hidden')
    $('.bindInformation').removeClass('active')
    $('.bindPrice').removeClass('active')

$(document).ready(ready)
$(document).on('page:load', ready)