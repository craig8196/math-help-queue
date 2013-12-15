# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.edit_admin').change (e) ->
    checkbox = $(this)
    user_id = checkbox.val()
    $.ajax
      url: '/admin/edit_admin'
      method: 'POST'
      dataType: 'json'
      data:
        user_id: user_id
      success: (data) ->
        $("span#privilege_#{user_id}").html(data['privilege'])
        checkbox.attr 'disabled', false

$ ->
  $('.edit_ta').change (e) ->
    checkbox = $(this)
    user_id = checkbox.val()
    $.ajax
      url: '/admin/edit_ta'
      method: 'POST'
      dataType: 'json'
      data:
        user_id: user_id
      success: (data) ->
        $("span#privilege_#{user_id}").html(data['privilege'])
        checkbox.attr 'disabled', false

$ ->
  $('.edit_student').change (e) ->
    checkbox = $(this)
    user_id = checkbox.val()
    $.ajax
      url: '/admin/edit_student'
      method: 'POST'
      dataType: 'json'
      data:
        user_id: user_id
      success: (data) ->
        $("span#privilege_#{user_id}").html(data['privilege'])
        checkbox.attr 'disabled', false