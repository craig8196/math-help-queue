# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



$ ->
    $('.edit_admin').change (e) ->
        checkbox = $(this)
        user_id = checkbox.val()
        $.ajax
          url: '/sessions/edit_admin'
          method: 'POST'
          dataType: 'json'
          data:
            user_id: user_id
            privilege_id: 1
          success: (data) ->
            $("span#privilege_#{user_id}").html(data['privilege'])
            checkbox.attr 'disabled', false

$ ->
  $('input[type="checkbox"].edit_ta').change (e) ->
    checkbox = $(this)
    user_id = checkbox.val()
    $.ajax
      method: 'POST'
      dataType: 'json'
      data:
        user_id: user_id
        privilege_id: 2
      success: (data) ->
        $("span#privilege_#{user_id}").html(data['privilege'])
        checkbox.attr 'disabled', false

$ ->
  $('input[type="checkbox"].edit_student').change (e) ->
    checkbox = $(this)
    user_id = checkbox.val()
    $.ajax
      method: 'POST'
      dataType: 'json'
      data:
        user_id: user_id
        privilege_id: 3
      success: (data) ->
        $("span#privilege_#{user_id}").html(data['privilege'])
        checkbox.attr 'disabled', false