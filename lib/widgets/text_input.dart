import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tunyce/core/common/app_colors.dart';

class TextInputWidget extends StatelessWidget {
  const TextInputWidget({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.keyboardType,
    this.textInputAction,
    this.obscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.prefix,
    this.maxLines,
    this.constraints,
    this.validator,
    this.onFieldSubmitted,
    this.isReadOnly,
    this.onTap,
    this.textCapitalization,
    this.errorText,
    this.fillColor,
    this.onChanged,
  });

  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? prefix;
  final int? maxLines;
  final BoxConstraints? constraints;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final bool? isReadOnly;
  final Function()? onTap;
  final TextCapitalization? textCapitalization;
  final String? errorText;
  final Color? fillColor;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null && labelText!.isNotEmpty)
          Text(
            '$labelText',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType ?? TextInputType.text,
          maxLines: maxLines ?? 1,
          textInputAction: textInputAction ?? TextInputAction.next,
          obscureText: obscureText ?? false,
          readOnly: isReadOnly ?? false,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          onTap: onTap,
          decoration: InputDecoration(
            hintText: hintText,
            isDense: true,
            filled: true,
            fillColor: fillColor,
            prefixIcon: prefixIcon,
            hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: AppColors.borderColor,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: AppColors.primaryColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: AppColors.borderColor.withOpacity(0.5),
              ),
            ),
            suffixIcon: suffixIcon,
          ),
          onChanged: onChanged,
          validator: validator ??
              (value) {
                if (value == null || value.isEmpty) {
                  if (labelText == null || labelText!.isEmpty) {
                    return 'This field is required';
                  } else {
                    return '$labelText is required';
                  }
                } else if (labelText!.toLowerCase().contains("email")) {
                  if (!GetUtils.isEmail(value)) {
                    return 'Please enter a valid email address';
                  }
                } else if (labelText!.toLowerCase().contains("phone")) {
                  if (!GetUtils.isPhoneNumber(value)) {
                    return 'Please enter a valid phone number';
                  }
                } else if (labelText!.toLowerCase().contains("password")) {
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                }
                return null;
              },
          onFieldSubmitted: onFieldSubmitted,
        ),
      ],
    );
  }
}
