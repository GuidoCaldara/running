var componentRequireContext = require.context("components", true)
var ReactRailsUJS = require("react_ujs")
ReactRailsUJS.useContext(componentRequireContext)

import flatpickr from 'flatpickr'
import typeahead from 'typeahead.js'
import {renderMap} from "packs/show-map.js"
import {imageSlide} from "packs/imageSlide.js"
import {updateIndex} from "packs/index_form.js"
// import {renderIndexMap} from "packs/indexMap.js"
// import {updateMap} from "packs/indexMap.js"
import {userAutocomplete} from "packs/autocomplete.js"
import {raceFormAutocomplete} from "packs/autocomplete.js"
import {animateTab} from "packs/new_race_form/tab.js"
import {raceTypeSelect} from "packs/new_race_form/race_type_select.js"
import {datesValidation} from "packs/new_race_form/dates_validation.js"
if (document.querySelector("#submit-photo-form") != null) {
  autoUpload()
}



window.updateMap = function(datas) {

  var markers = JSON.parse(datas.replace(/&quot;/g,'"'))
  markerArray.forEach(function(marker) {
      marker.setMap(null);
  });

  markers.forEach((e) => {
    var contentString = `<a href="races/${e.id}"><div id="content"><h5>${e.name}</h5><p>${e.type} / ${e.distance_km}km</p><p>${e.date}</p></div></a>`
   var marker = new google.maps.Marker({
     position: {lng: e.lng, lat: e.lat},
     map: indexMap,
   });
   var infowindow = new google.maps.InfoWindow({
content: contentString
});
  marker.addListener('click', function() {
  infowindow.open(indexMap, marker);
  });
  marker.addListener('mouseover', function() {
    console.log("im on it");
    document.querySelector(`#card-${e.id}`).classList.add("hilight-card")
  });
  marker.addListener('mouseout', function() {
    document.querySelector(`#card-${e.id}`).classList.remove("hilight-card")
  });


   bounds.extend(marker.position);
   markerArray.push(marker)
 })

 indexMap.fitBounds(bounds);
}


window.renderIndexMap = function(){
  window.bounds = new google.maps.LatLngBounds();
  window.markerArray = []
  var infowindow = new google.maps.InfoWindow();
  const mapContainer = document.querySelector("#index-map")
  if (mapContainer != null ){
    const markers = JSON.parse(mapContainer.dataset.markers)
    window.indexMap = new google.maps.Map(mapContainer, {
      zoom: 8
    });
    markers.forEach((e) => {
      var contentString = `<a href="races/${e.id}"><div id="content"><h5>${e.name}</h5><p>${e.type} / ${e.distance_km}km</p><p>${e.date}</p></div></a>`
      var marker = new google.maps.Marker({
        position: {lng: e.lng, lat: e.lat},
        map: indexMap,
      });
      var infowindow = new google.maps.InfoWindow({
   content: contentString
 });
 marker.addListener('click', function() {
   infowindow.open(indexMap, marker);
 });
 marker.addListener('mouseover', function() {
   console.log("im on it");
   document.querySelector(`#card-${e.id}`).classList.add("hilight-card")
 });
 marker.addListener('mouseout', function() {
   document.querySelector(`#card-${e.id}`).classList.remove("hilight-card")
 });

      markerArray.push(marker)
      bounds.extend(marker.position);
    })
    indexMap.fitBounds(bounds);
  }
}


flatpickr("#date-range", {
  mode: "range",
  minDate: "today",
  dateFormat: "d-m-Y"
});

renderMap()
imageSlide()
updateIndex()
renderIndexMap()
userAutocomplete()
raceFormAutocomplete()

raceTypeSelect()
animateTab()
datesValidation()
