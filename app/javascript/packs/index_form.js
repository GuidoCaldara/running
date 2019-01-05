let form = document.getElementById('race_filter');

const AutocompleteSubmit = () => {
  let input = document.getElementById('race_location_filter');
  let options = {
  types: ['(cities)'],
  }
  let autocomplete = new google.maps.places.Autocomplete(input, options);
  autocomplete.addListener('place_changed', function(){
    console.log("hello")
    Rails.fire(form, 'submit')
  })

}



const checkboxesSubmit = () => {
  let checkboxes = document.querySelectorAll("input[type=checkbox]");
  for (let i = 0; i < checkboxes.length; i++) {
    checkboxes[i].addEventListener('change', function () {
      Rails.fire(form, 'submit');
    });
  }
}

const rangeDateSubmit = () => {
  document.querySelector("#date-range").addEventListener('change', function () {
    console.log("hklkòlkò");
    let form = document.getElementById('race_filter');
    Rails.fire(form, 'submit');
  });
}

const updateIndex = () => {
  document.addEventListener("DOMContentLoaded", function () {
    if (form != null) {
      rangeDateSubmit()
      checkboxesSubmit()
      AutocompleteSubmit()
    }
  })
}

export { updateIndex }
