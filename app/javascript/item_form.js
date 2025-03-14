const setupPriceListener = () => {

  const priceInput = document.getElementById('price-input');
  const taxPriceField = document.getElementById('add-tax-price');
  const profitField = document.getElementById('profit');

  if (priceInput && taxPriceField && profitField) {
    priceInput.addEventListener('input', function() {
      const inputValue = parseFloat(priceInput.value);

      if (isNaN(inputValue) || inputValue < 300 || inputValue > 9999999) {
        taxPriceField.textContent = '';
        profitField.textContent = '';
        return;
      }

      const tax = Math.floor(inputValue * 0.10);
      const profit = inputValue - tax;

      taxPriceField.textContent = tax.toLocaleString();
      profitField.textContent = profit.toLocaleString();
    });
  } else {
    console.error('必要な要素が見つかりません。');
  }
}

window.addEventListener("turbo:load", setupPriceListener);
window.addEventListener("turbo:render", setupPriceListener);