var componentRequireContext = require.context("components", true)
var ReactRailsUJS = require("react_ujs")
ReactRailsUJS.useContext(componentRequireContext)
import flatpickr from 'flatpickr'

import {renderMap} from "packs/show-map.js"
import {imageSlide} from "packs/imageSlide.js"
import {updateIndex} from "packs/index_form.js"
import {renderIndexMap} from "packs/indexMap.js"
import {updateMap} from "packs/indexMap.js"
import {userAutocomplete} from "packs/autocomplete.js"
import {raceFormAutocomplete} from "packs/autocomplete.js"

if (document.querySelector("#submit-photo-form") != null) {
  autoUpload()
}



flatpickr("#date-range", {
  mode: "range",
  minDate: "today",
  dateFormat: "Y-m-d"
});

renderMap()
imageSlide()
updateIndex()
renderIndexMap()
userAutocomplete()
raceFormAutocomplete()
