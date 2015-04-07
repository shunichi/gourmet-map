layout = ->
  ajustMapHeight()
  fitToWindowHeight($('.restaurants__sidebar'))
  fitToWindowHeight($('.restaurants__detail'))

ajustMapHeight = ->
  if $('#map-canvas-index').length
    h = $(window).height() - $('#map-canvas-index').offset().top
    $('#map-canvas-index').height(h * 0.5)

fitToWindowHeight = ($elem) ->
  if $elem.length > 0
    h = $(window).height() - $elem.offset().top
    $elem.height(h)

$(window).resize ->
  layout()

$(document).ready(layout)
$(document).on('page:load', layout)
