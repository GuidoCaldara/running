function renderMap() {
  const mapContainer = document.querySelector("#show-map")
  if (mapContainer != null ){
    const m = JSON.parse(mapContainer.dataset.markers)
    var myLatLng = m
    var map = new google.maps.Map(mapContainer, {
      zoom: 8,
      center: myLatLng
    });

    var marker = new google.maps.Marker({
      position: myLatLng,
      map: map,
    });
  }
}


export { renderMap }
