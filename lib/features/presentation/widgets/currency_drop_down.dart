import 'package:flutter/material.dart';
import '../../domain/entities/currency.dart';

class CurrencySelector extends StatelessWidget {
  final List<Currency> currencies;
  final String? selectedCurrency;
  final String label;
  final ValueChanged<String?> onChanged;

  const CurrencySelector({
    super.key,
    required this.currencies,
    required this.label,
    required this.onChanged,
    this.selectedCurrency,
  });

  @override
  Widget build(BuildContext context) {
    if (currencies.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return DropdownButtonFormField<String>(
      isExpanded: true,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      value: currencies.any((c) => c.id == selectedCurrency)
          ? selectedCurrency
          : null,
      items: currencies.map((currency) {
        return DropdownMenuItem<String>(
          value: currency.id,
          child: Text(currency.name),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
