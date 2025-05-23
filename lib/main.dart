import 'package:currency_app/core/di/dependency_injection.dart';
import 'package:currency_app/currency_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
// To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();
  setupGetIt();
  runApp(const CurrencyApp());
}
