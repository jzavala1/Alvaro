# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

clearTabs = () ->
  $('#basicInformation').addClass('hidden')
  $('.bindInformation').removeClass('active')
  $('#price').addClass('hidden')
  $('.bindPrice').removeClass('active')
  $('#category').addClass('hidden')
  $('.bindCategory').removeClass('active')
  $('#sale').addClass('hidden')
  $('.bindSale').removeClass('active')

ready = ->
  $('.bindInformation').click ->
    clearTabs()
    $('#basicInformation').removeClass('hidden')
    $('.bindInformation').addClass('active')

  $('.bindPrice').click ->
    clearTabs()
    $('#price').removeClass('hidden')
    $('.bindPrice').addClass('active')

  $('.bindCategory').click ->
    clearTabs()
    $('#category').removeClass('hidden')
    $('.bindCategory').addClass('active')

  $('.bindSale').click ->
    clearTabs()
    $('#sale').removeClass('hidden')
    $('.bindSale').addClass('active')

$(document).ready(ready)
$(document).on('page:load', ready)