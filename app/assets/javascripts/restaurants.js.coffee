# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
    showLocation = (loc, marker) ->
        $('#map-canvas').gmap 'search', { location: loc }, (results, status) ->
            if status == 'OK'
                marker.setTitle results[0].formatted_address
                console.log results[0].formatted_address
                $.each results[0].address_components, (i, v) ->
                    console.log v
                $('#map-canvas').gmap 'openInfoWindow', { content: marker.getTitle() }, marker
    addMarker = (gmap, latlng) ->
        $('#map-canvas').gmap 'addMarker', {
                position: latlng,
                draggable: true,
                bounds: false,
            }, (map, marker) ->
                console.log('marker added')
                console.log marker
                showLocation marker.getPosition(), marker
            .dragend (event) ->
                console.log 'drag end'
                console.log event
                latLng = this.getPosition()
                $('#restaurant_latitude').val(latLng.lat())
                $('#restaurant_longitude').val(latLng.lng())
                showLocation this.getPosition(), this
            .click (event) ->
                console.log 'click'
                console.log event
                showLocation this.getPosition(), this

    $('#map-canvas').gmap({zoom: 17}).bind 'init', (event, map) ->
        data = $(this).data()
        latlng = new google.maps.LatLng(data.lat, data.lng)
        addMarker $('#map-canvas'), latlng
        map.setCenter latlng

$(document).ready(ready)
$(document).on('page:load', ready)