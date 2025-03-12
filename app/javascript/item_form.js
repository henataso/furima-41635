window.addEventListener("turbo:load", setupPriceListener);
window.addEventListener("turbo:render", setupPriceListener);

function setupPriceListener() {
  const priceInput = document.getElementById('number-form');
  const taxPriceField = document.getElementById('expiry-form');
  const profitField = document.getElementById('cvc-form');

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