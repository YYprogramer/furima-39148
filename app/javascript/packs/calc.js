document.addEventListener("DOMContentLoaded", function() {
  const priceInput = document.getElementById('item-price');
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  priceInput.addEventListener('input', function() {
    const price = parseFloat(priceInput.value);
    if (!isNaN(price)) {
      const tax = Math.floor(price * 0.1);
      const profitAmount = price - tax;

      addTaxPrice.textContent = tax.toFixed(0);
      profit.textContent = profitAmount.toFixed(0);
    } else {
      addTaxPrice.textContent = '';
      profit.textContent = '';
    }
  });
});
