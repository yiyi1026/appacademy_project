const selectCurrency = (baseCurrency) => {
  return {
    type: 'SWITCH_CURRENCY',
    baseCurrency: baseCurrency,
    rates: rates
  }
};


export default selectCurrency;
