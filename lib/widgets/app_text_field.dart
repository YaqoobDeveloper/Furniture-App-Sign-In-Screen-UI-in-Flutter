import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Pill-shaped input with its leading icon set in a soft round tile.
class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.hint,
    required this.icon,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.autofillHints,
    this.obscureText = false,
    this.suffix,
    this.validator,
    this.onSubmitted,
  });

  final String hint;
  final IconData icon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final bool obscureText;
  final Widget? suffix;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      autofillHints: autofillHints,
      obscureText: obscureText,
      validator: validator,
      onFieldSubmitted: onSubmitted,
      style: const TextStyle(fontSize: 15, color: AppColors.textPrimary),
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: suffix,
        prefixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(10, 8, 12, 8),
          child: Container(
            width: 38,
            decoration: const BoxDecoration(
              color: AppColors.tile,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 18, color: AppColors.green),
          ),
        ),
      ),
    );
  }
}
