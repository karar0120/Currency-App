class CurrencyHistory {
  final String date;
  final String base;
  final List<CurrencyRate> rates;

  CurrencyHistory({required this.date, required this.base, required this.rates});
}

class CurrencyRate {
  final String currencyCode;
  final double rate;

  CurrencyRate({required this.currencyCode, required this.rate});
}
