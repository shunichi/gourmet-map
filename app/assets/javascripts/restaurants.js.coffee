window.GRM ?= {}

GRM.showInfo = (markerId) ->
  markers = $('#map-canvas-index').gmap 'get', 'markers'
  marker = markers[markerId]
  $(marker).triggerEvent 'click' if marker?

showLocation = (elm, loc, marker) ->
  elm.gmap 'search', { location: loc }, (results, status) ->
    if status == 'OK'
      marker.setTitle results[0].formatted_address
      elm.gmap 'openInfoWindow', { content: marker.getTitle() }, marker

addMarker = (elm, latlng, name, id, bounds = false) ->
  m = elm.gmap 'addMarker',
    id: id
    position: latlng
    draggable: elm.hasClass('editable')
    bounds: bounds
  .dragend (event) ->
    latLng = this.getPosition()
    $('#restaurant_latitude').val(latLng.lat())
    $('#restaurant_longitude').val(latLng.lng())

loadRestaurantDetail = (url)->
  $('.js-restaurant-detail').remove()
  $.ajax
    dataType: 'script'
    url: url

$(document).on 'click', '.restaurants-list__item-link', ->
  id = $(this).closest('.restaurants-list__item').data().id
  GRM.showInfo(id)
  $('.js-restaurant-loading').show()
  false

ready = ->
  $('#map-canvas').gmap({zoom: 17, scrollwheel: false}).bind 'init', (event, map) ->
    self = $(this)
    data = self.data()
    latlng = new google.maps.LatLng(data.lat, data.lng)
    addMarker self, latlng, data.name, data.id
    map.setCenter latlng

  $('#map-canvas-index').gmap({scrollwheel: false}).bind 'init', (event, map) ->
    self = $(this)
    $('#restaurants-data').data().restaurants.forEach (r,i) ->
      latlng = new google.maps.LatLng  r.latitude, r.longitude
      content = $('<a>').attr( 'href', r.url ).addClass('js-marker-link').text(r.name)[0]
      marker = addMarker self, latlng, content, r.id, true
      marker.click (event) ->
        self.gmap 'openInfoWindow', { content: content }, marker
        loadRestaurantDetail(r.url)
    map.setZoom(17)

$(document).ready(ready)
$(document).on('page:load', ready)
