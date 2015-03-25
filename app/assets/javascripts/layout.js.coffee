layout = ->
  fitToWindowHeight($('.restaurants__sidebar'))
  fitToWindowHeight($('.restaurants__detail'))

fitToWindowHeight = ($elem) ->
  if $elem.length > 0
    h = $(window).height() - $elem.offset().top
    $elem.height(h)

$(window).resize ->
  layout()

$(document).ready(layout)
$(document).on('page:load', layout)
