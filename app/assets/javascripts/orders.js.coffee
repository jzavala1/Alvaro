# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

skuName = (category, subCategory, section, id) ->
  skuInput = $('#product_sku')
  skuInput.val((if category then category.substr(0,3) else '') + '-' + (if subCategory then subCategory.substr(0,3) else '') + '-' + (if section then section.substr(0,3) else '') + '-' + (if id then id else ''))

ready = ->
  $('.bind-show-products').click ->
    id = $(this).data('order-id')
    $('#order-' + id).toggleClass('hide')

  $('.bind-order-id').click ->
    id = $(this).data('order-id')
    $('#product_order_id').val(id)

  $('#product_category_id').change ->
    id = $(this).val()
    name = $('#product_category_id option:selected').text().toUpperCase()
    sku = $('#product_sku').val().split('-')
    skuName(name, null, null, null)

    $.ajax '/categories/' + id + '/sub_categories',
      type: 'GET'
      error: (jqXHR, textStatus, errorThrown) ->
        console.log('Error')
      success: (data, textStatus, jqXHR) ->
        $('#product_sub_category_id').empty()
        $('#product_section_id').empty()
        $('#product_sub_category_id').append('<option value></option>')
        for d in data
          do ->
          $('#product_sub_category_id').append('<option value="' + d.id + '">' + d.name + '</option>')
        $('#product_sub_category_id').prop('disabled', false)

  $('#product_sub_category_id').change ->
    id = $(this).val()
    name = $('#product_sub_category_id option:selected').text().toUpperCase()
    sku = $('#product_sku').val().split('-')
    skuName(sku[0], name, null, null)

    $.ajax '/sub_categories/' + id + '/sections',
      type: 'GET'
      error: (jqXHR, textStatus, errorThrown) ->
        console.log('Error')
      success: (data, textStatus, jqXHR) ->
        $('#product_section_id').empty()
        $('#product_section_id').append('<option value></option>')
        for d in data
          do ->
          $('#product_section_id').append('<option value="' + d.id + '">' + d.name + '</option>')
        $('#product_section_id').prop('disabled', false)

  $('#product_section_id').change ->
    id = $(this).val()
    name = $('#product_section_id option:selected').text().toUpperCase()
    sku = $('#product_sku').val().split('-')
    skuName(sku[0], sku[1], name, sku[3])

    sku = $('#product_sku').val()
    $.ajax '/products/sku',
      type: 'GET'
      data: 'sku': sku
      error: (jqXHR, textStatus, errorThrown) ->
        console.log('Error')
      success: (data, textStatus, jqXHR) ->
        sku = $('#product_sku').val().split('-')
        skuName(sku[0], sku[1], sku[2], data.id)


$(document).ready(ready)
$(document).on('page:load', ready)