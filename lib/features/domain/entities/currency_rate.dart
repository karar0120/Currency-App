class CurrencyRate {
  final String base;
  final num rate;
  final String? date;
  final String? currency;

  CurrencyRate({
    required this.base,
    required this.rate,
    this.date,
    this.currency,
  });
}
