import 'package:flutter/material.dart';
import 'package:tunyce/core/common/app_colors.dart';

Widget customLoader() {
  return const Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
    ),
  );
}
