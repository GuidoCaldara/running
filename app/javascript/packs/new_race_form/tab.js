


const animateTab =() => {
  let tabs = document.querySelectorAll(".tab-box")
  let navTabs = document.querySelectorAll(".nav-tab")
  const clearTabs = () =>{
    tabs.forEach((tab) => {
      tab.style.display = "none"
    })
    navTabs.forEach((tab) => {
      tab.classList.remove("selected-tab")
    })
  }
  const showTab = (id) =>{
    document.querySelector(`#stepTab-${id}`).style.display= "block"
    document.querySelector(`#nav-tab-${id}`).classList.add("selected-tab")
  }

  if (navTabs != null) {
    let buttons  = document.querySelectorAll(".step-button")
    buttons.forEach((button) => {
      button.addEventListener("click", () => {
        clearTabs()
        showTab(button.dataset.step)
      })
    })
  }
}


export {animateTab}
