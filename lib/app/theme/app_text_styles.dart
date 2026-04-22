import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  const AppTextStyles._();

  static const headline = TextStyle(
    color: AppColors.text,
    fontSize: 26,
    fontWeight: FontWeight.w700,
  );

  static const title = TextStyle(
    color: AppColors.text,
    fontSize: 17,
    fontWeight: FontWeight.w700,
  );

  static const body = TextStyle(
    color: AppColors.text,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const caption = TextStyle(
    color: AppColors.mutedText,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
}
