import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';

class TermsAndConditionsCheckbox extends StatefulWidget {
  final Function(bool?) onSelected;

  const TermsAndConditionsCheckbox({super.key, required this.onSelected});

  @override
  State<TermsAndConditionsCheckbox> createState() => _TermsAndConditionsCheckboxState();
}

class _TermsAndConditionsCheckboxState extends State<TermsAndConditionsCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Checkbox(
            value: isChecked,
            activeColor: ColorsManager.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            side: const BorderSide(color: Colors.grey),
            onChanged: (value) {
              setState(() {
                isChecked = value ?? false;
              });
              widget.onSelected(value);
            },
          ),
        ),
        horizontalSpace10,
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: appTranslation().get('agree_to_the'),
                  style: TextStylesManager.bold12.copyWith(color: Colors.grey),
                ),
                const TextSpan(text: ' '),
                TextSpan(
                  text: appTranslation().get('terms_of_service'),
                  style: TextStylesManager.bold12.copyWith(
                    color: ColorsManager.primaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const TextSpan(text: ' '),
                TextSpan(
                  text: appTranslation().get('and'),
                  style: TextStylesManager.bold12.copyWith(color: Colors.grey),
                ),
                const TextSpan(text: ' '),
                TextSpan(
                  text: appTranslation().get('privacy_policy'),
                  style: TextStylesManager.bold12.copyWith(
                    color: ColorsManager.primaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}