
const raceTypeSelect = () => {
  const boxes = document.querySelectorAll(".race-type-box")
  if (boxes != null) {
    boxes.forEach((e) => {
      e.addEventListener("click", (c) =>{
        boxes.forEach(e => e.classList.remove("race-type-box-selected"))
        c.target.classList.add("race-type-box-selected")
        document.querySelector("#race_race_type").value = c.target.dataset.value
      })
    })
  }
}


export { raceTypeSelect }
