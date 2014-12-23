# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  showLocation = (elm, loc, marker) ->
    elm.gmap 'search', { location: loc }, (results, status) ->
      if status == 'OK'
        marker.setTitle results[0].formatted_address
        console.log results[0].formatted_address
        $.each results[0].address_components, (i, v) ->
          console.log v
        elm.gmap 'openInfoWindow', { content: marker.getTitle() }, marker
  addMarker = (elm, latlng, draggable) ->
    elm.gmap 'addMarker', {
        position: latlng,
        draggable: elm.hasClass('editable'),
        bounds: false,
      }, (map, marker) ->
        console.log('marker added')
        console.log marker
        showLocation elm, marker.getPosition(), marker
      .dragend (event) ->
        console.log 'drag end'
        console.log event
        latLng = this.getPosition()
        $('#restaurant_latitude').val(latLng.lat())
        $('#restaurant_longitude').val(latLng.lng())
        showLocation elm, this.getPosition(), this
      .click (event) ->
        console.log 'click'
        console.log event
        showLocation elm, this.getPosition(), this

  $('#map-canvas').gmap({zoom: 17}).bind 'init', (event, map) ->
    self = $(this)
    data = self.data()
    latlng = new google.maps.LatLng(data.lat, data.lng)
    addMarker self, latlng, true
    map.setCenter latlng

$(document).ready(ready)
$(document).on('page:load', ready)
