import 'package:shefaa/core/theme/colors.dart';
import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String hint;
  final bool isPassword;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool enabled;
  final Color? fillColor;
   final bool readOnly;
  final VoidCallback? onTap;
  const PrimaryTextField({
    super.key,
    required this.controller,
    this.label,
    required this.hint,
    this.isPassword = false,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.enabled = true,
    this.fillColor,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      style: TextStyle(color: ColorsManager.textPrimary),
      enabled: enabled,
       readOnly: readOnly,
      onTap: onTap,
      decoration: InputDecoration(
        filled: fillColor != null,
        fillColor: fillColor,

        labelText: label,
        labelStyle: TextStyle(color: ColorsManager.textPrimary),
        hintText: hint,
        hintStyle: TextStyle(color: ColorsManager.textPrimary),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        suffixIconColor: ColorsManager.textPrimary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Color(0xFF1D4481)),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
    );
  }
}
