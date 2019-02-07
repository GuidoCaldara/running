const datesValidation = () => {

  let subStart = document.querySelector("#race_subscription_start")
  let subEnd = document.querySelector("#race_subscription_end")
  let firstStart = document.querySelector("#race_first_price_start")
  let firstEnd = document.querySelector("#race_first_price_end")
  let secondStart = document.querySelector("#race_second_price_start")
  let secondEnd = document.querySelector("#race_second_price_end")
  let firstPrice = document.querySelector("#race_first_price")
  let second_price = document.querySelector("#race_second_price")

  const AddDateMessage = (a) => {
    if (document.querySelector(`.date-${a.id}`) != null) document.querySelector(`.date-${a.id}`).remove()
    a.insertAdjacentHTML("afterend", `<p class="date-${a.id}" style='color: red'><strong>La data iniziale deve essere precedente<strong></p>`)
  }

  const removeDateMessage = (a) => {
    if (document.querySelector(`.date-${a.id}`) != null) document.querySelector(`.date-${a.id}`).remove()
  }



  const hilightBoarder = (a, b) => {
      a.style.border = "2px solid red";
      b.style.border = "2px solid red";
    }


  const clearBorder = (a, b) =>{
    a.style.border = "1px solid #ced4da";
    b.style.border = "1px solid #ced4da";
  }


  const checkDate = (a, b, element_a, element_b) => {
    if (a !== "" && b !== "") {
      let initial = Date.parse(a)
      let final = Date.parse(b)
      if (initial > final) {
        console.log("bigger");
        hilightBoarder(element_a, element_b)
        AddDateMessage(element_a)
      } else{
        console.log("smaller");
        clearBorder(element_a, element_b)
        removeDateMessage(element_a)
    }
  }
  }

  if (subStart) {
      subStart.addEventListener("change", (e)=>{
    checkDate(e.target.value, subEnd.value, subStart, subEnd);
  })
  subEnd.addEventListener("change", (e)=>{
    checkDate(subStart.value, e.value, subStart, subEnd)
  })
  firstStart.addEventListener("change", (e)=>{
    checkDate(e.target.value, firstEnd.value, firstStart, firstEnd);
  })
  firstEnd.addEventListener("change", (e)=>{
    checkDate(firstStart.value, e.value, firstStart, firstEnd)
  })
  secondStart.addEventListener("change", (e)=>{
    checkDate(e.target.value, secondEnd.value, secondStart, secondEnd);
  })
  secondEnd.addEventListener("change", (e)=>{
    checkDate(secondStart.value, e.value, secondStart, secondEnd)
  })

}

}


export { datesValidation }
