import 'package:flutter/material.dart';
import 'package:tunyce/core/common/app_colors.dart';

class PrimaryButtonWidget extends StatelessWidget {
  const PrimaryButtonWidget({
    super.key,
    required this.label,
    this.onTap,
    this.borderRadius,
    this.width,
    this.height,
    this.labelColor,
    this.bgColor,
    this.isLoading,
  });

  final String label;
  final VoidCallback? onTap;
  final double? borderRadius;
  final double? width;
  final double? height;
  final Color? labelColor;
  final Color? bgColor;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor ?? AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
          ),
          minimumSize: Size(
            width ?? double.infinity,
            height ?? 45,
          ),
        ),
        child: (isLoading == true)
            ? const CircularProgressIndicator.adaptive(
                strokeWidth: 2,
                valueColor:
                    AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
                backgroundColor: Colors.white,
              )
            : Text(
                label,
                style: TextStyle(
                  color: labelColor ?? Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ));
  }
}
