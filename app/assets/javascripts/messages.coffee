# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  setInterval (->
    element = document.getElementsByClassName('messages')[0];
    element.scrollTop = element.scrollHeight;
  ), 1000

  $(document.body).on 'click', '.enter', () ->
      $('.overlay').addClass('entered')
    return

  return
