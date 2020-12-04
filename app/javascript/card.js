const pay = () => {
  Payjp.setPublicKey("pk_test_d1c3f7e6afdbb5b20a8f548e");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formInput = document.getElementById("charge-form");
    const formData = new FormData(formInput);

    const card = {
      number: formData.get("purchase_address[number]"),
      exp_month: formData.get("purchase_address[exp_month]"),
      exp_year: `20${formData.get("purchase_address[exp_year]")}`,
      cvc: formData.get("purchase_address[cvc]"),
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const submitServer = document.getElementById("charge-form");
        const submitToken = `<input value=${token} name="token" type="hidden">`;
        submitServer.insertAdjacentHTML("beforeend", submitToken);
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener('load', pay);