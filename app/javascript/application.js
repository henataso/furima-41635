// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener('DOMContentLoaded', function() {
  const priceInput = document.getElementById('item-price');
  const taxPriceField = document.getElementById('add-tax-price');
  const profitField = document.getElementById('profit');

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
});