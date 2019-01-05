const userAutocomplete = () => {
  let input = document.getElementById('user_location');
  if (input != null){
    let options = {
    types: ['(cities)'],
    };
    let autocomplete = new google.maps.places.Autocomplete(input, options);
  }
}


export { userAutocomplete }
