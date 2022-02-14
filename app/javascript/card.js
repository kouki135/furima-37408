const pay = () => {
  Payjp.setPublicKey("pk_test_645030ea614e360eba33b2e5")
  const submit = document.getElementById("button")
  submit.addEventListener("click", (e) => {
    e.preventDefault()

    const formResult = document.getElementById("charge-form")
    const formData = new FormData(formResult)

    const card = {
      number: formData.get("order_address[number]"),
      exp_month: formData.get("order_address[exp_month]"),
      exp_year: `20${formData.get("order_address[exp_year]")}`,
      cvc: formData.get("order_address[cvc]"),
    }

    Payjp.createToken(card, (status, response) => {
      if (status == 200){
        const token = response.id;
        const renderDom = document.getElementById("charge-form")
        const tokenOjt = `<input value=${token} name='token' type="hidden">`
        renderDom.insertAdjacentHTML("beforeend", tokenOjt)
      }
      
      document.getElementById("order_address[number]").removeAttribute("name")
      document.getElementById("order_address[exp_month]").removeAttribute("name")
      document.getElementById("order_address[exp_year]").removeAttribute("name")
      document.getElementById("order_address[cvc]").removeAttribute("name")

      document.getElementById("charge-form").submit();
    })
  })
}

window.addEventListener("load", pay)