window.addEventListener('load', () => {

  const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price");
  const addTax = (Math.floor(inputValue * 0.1));
    addTaxDom.innerHTML = addTax
  const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = (Math.floor(inputValue - addTax));


})
});