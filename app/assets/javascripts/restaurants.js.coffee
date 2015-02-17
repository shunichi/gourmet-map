# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  showLocation = (elm, loc, marker) ->
    elm.gmap 'search', { location: loc }, (results, status) ->
      if status == 'OK'
        marker.setTitle results[0].formatted_address
        elm.gmap 'openInfoWindow', { content: marker.getTitle() }, marker
  addMarker = (elm, latlng, name, bounds = false) ->
    elm.gmap 'addMarker', {
        position: latlng,
        draggable: elm.hasClass('editable'),
        bounds: bounds,
      }
      .dragend (event) ->
        latLng = this.getPosition()
        $('#restaurant_latitude').val(latLng.lat())
        $('#restaurant_longitude').val(latLng.lng())
      .click (event) ->
        elm.gmap 'openInfoWindow', { content: name }, this if name?

  $('#map-canvas').gmap({zoom: 17}).bind 'init', (event, map) ->
    self = $(this)
    data = self.data()
    latlng = new google.maps.LatLng(data.lat, data.lng)
    addMarker self, latlng, data.name
    map.setCenter latlng

  $('#map-canvas-index').gmap().bind 'init', (event, map) ->
    self = $(this)
    $('#restaurants-data').data().restaurants.forEach (r,i) ->
      latlng = new google.maps.LatLng  r.latitude, r.longitude
      addMarker self, latlng, $('<a>').attr( 'href', r.url ).text(r.name)[0], true

$(document).ready(ready)
$(document).on('page:load', ready)
