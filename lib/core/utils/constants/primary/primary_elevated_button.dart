import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/utils/constants/primary/conditional_builder.dart';
import 'package:flutter/material.dart';

class PrimaryElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double height;
  final double radius;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final Widget? icon;
  final double? width;

  const PrimaryElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.height = 52,
    this.radius = 30,
    this.backgroundColor = ColorsManager.primaryColor,
    this.textStyle,
    this.icon,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton.icon(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        icon: icon,
        label: ConditionalBuilder(
          loadingState: isLoading,
          successBuilder: (context) => Text(
            text,
            style:
                textStyle ??
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ),
    );
  }
}
