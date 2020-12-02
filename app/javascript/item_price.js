window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price"); /*入力場所*/
  const addTaxPrice = document.getElementById("add-tax-price"); /*手数料表示*/
  const profit = document.getElementById("profit"); /*利益表示*/

  priceInput.addEventListener('input', () => {
    const inputValue = priceInput.value
    const tax = Math.floor(inputValue * 0.1);
    addTaxPrice.innerHTML = tax;
    profit.innerHTML = inputValue - tax;
  });
});