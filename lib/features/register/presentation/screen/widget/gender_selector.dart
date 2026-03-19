import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/primary/primary_text_field.dart';

class GenderSelector extends StatelessWidget {
  final int selectedGender;
  final Function(int) onChanged;

  const GenderSelector({
    super.key,
    required this.selectedGender,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [_genderOption("Male", 0), _genderOption("Female", 1)],
      ),
    );
  }

  Widget _genderOption(String title, int index) {
    final isSelected = selectedGender == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => onChanged(index),
        child: Container(
          margin: const EdgeInsets.all(4),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected
                ? ColorsManager.primaryAction
                : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            title,
            style: TextStylesManager.bold16.copyWith(
              color: isSelected ? Colors.white : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}

class DateField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onTap;

  const DateField({super.key, required this.controller, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return PrimaryTextField(
      controller: controller,
      hint: 'mm/dd/yyyy',
      fillColor: Colors.white,
      readOnly: true,
      onTap: onTap,
    );
  }
}
