class ConversionRequestModel {
  final String from;
  final String to;
  final num amount;

  ConversionRequestModel({
    required this.from,
    required this.to,
    required this.amount,
  });

  Map<String, dynamic> toQueryParameters() {
    return {
      'from': from,
      'to': to,
      'amount': amount,
    };
  }
}
