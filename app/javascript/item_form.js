document.addEventListener('DOMContentLoaded', function() {
  const priceInput = document.getElementById('item-price');
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

  const form = document.querySelector(".items-sell-main form");
  const submitButton = document.querySelector(".sell-btn");

  if (form && submitButton) {
    function checkForm() {
      const allFieldsFilled = Array.from(form.elements).every(element => {
        if (element.hasAttribute('required') && element.value.trim() === '') {
          return false;
        }
        // additional checks for select boxes with specific options
        if (element.tagName === 'SELECT' && element.value === '1') {
          return false;
        }
        return true;
      });
      submitButton.disabled = !allFieldsFilled;
    }

    form.addEventListener("input", checkForm);
    form.addEventListener("change", checkForm);

    // Initial check to set the button status on page load
    checkForm();
  } else {
    console.error('フォームまたは出品ボタンの要素が見つかりません。');
  }
});