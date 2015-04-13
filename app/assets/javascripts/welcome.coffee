# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  # Search form.
  $('#ajax_search').on 'submit', ->
    $.get @action, $(this).serialize(), null, 'script'
    false
