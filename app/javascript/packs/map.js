import 'mapbox-gl/dist/mapbox-gl.css'
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css'
import mapboxgl from 'mapbox-gl/dist/mapbox-gl.js';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const mapElement = document.getElementById('map');

if (mapElement) { // only build a map if there's a div#map to inject into
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
  const markers = JSON.parse(mapElement.dataset.markers);
  // Add all markers to the map except for the last one, which is the users destination
  markers.slice(0, -1).forEach((marker) => {
    new mapboxgl.Marker()
      .setLngLat([marker.lng, marker.lat])
      .addTo(map);
  })

  // Add the users marker to the map
  new mapboxgl.Marker()
   .setLngLat(markers[markers.length - 1])
   .addTo(map);

   // Target the last marker that was added to the map
  const svg = map
    .getContainer()
    .querySelectorAll('.mapboxgl-marker')[markers.length - 1]
    .childNodes[0]
  // Apply a class to the users' marker
  svg.classList.add("user-marker");


      // .setPopup(new mapboxgl.Popup({ offset: 25 }) // add popups
      // .setHTML(marker.infoWindow.content))

  if (markers.length === 0) {
    map.setZoom(1);
  } else if (markers.length === 1) {
    map.setZoom(14);
    map.setCenter([markers[0].lng, markers[0].lat]);
  } else {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach((marker) => {
      bounds.extend([marker.lng, marker.lat]);
    });
    map.fitBounds(bounds, { duration: 0, padding: 75 })
  }
}


const addressInput = document.getElementById('query_destination');

if (addressInput) {
  const places = require('places.js');
  const placesAutocomplete = places({
    container: addressInput
  });
}
