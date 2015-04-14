# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  # Search form.
  $('#ajax_search').on 'submit', ->
    $.get @action, $(this).serialize(), null, 'script'
    false
  $('.typist').typist(text: 'Free to post.').typistPause(1000).typistRemove(5).typistAdd('search.').typistPause(1000).typistRemove(16).typistAdd('Putting St. Pete back to work.').typistStop()
