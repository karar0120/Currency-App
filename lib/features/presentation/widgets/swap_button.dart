import 'package:currency_app/core/helper/values_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwapButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SwapButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(AppPadding.p8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s30.r)),
            color: Colors.blue,
          ),
          child: const Icon(
            Icons.swap_vert,
            color: Colors.white,
            size: AppSize.s40,
          ),
        ),
      ),
    );
  }
}
