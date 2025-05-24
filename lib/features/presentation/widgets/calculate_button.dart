
import 'package:flutter/material.dart';
import '../../../core/helper/strings_manger.dart';

class CalculateButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CalculateButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
        ),
        onPressed: onPressed,
        child: const Text(
          AppString.calcate,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}