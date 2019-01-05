var componentRequireContext = require.context("components", true)
var ReactRailsUJS = require("react_ujs")
ReactRailsUJS.useContext(componentRequireContext)
import {renderMap} from "packs/show-map.js"
import {imageSlide} from "packs/imageSlide.js"
import {updateIndex} from "packs/index_form.js"
import {renderIndexMap} from "packs/indexMap.js"
import {updateMap} from "packs/indexMap.js"
import {userAutocomplete} from "packs/autocomplete.js"

if (document.querySelector("#submit-photo-form") != null) {
  autoUpload()
}

renderMap()
imageSlide()
updateIndex()
renderIndexMap()
userAutocomplete()
