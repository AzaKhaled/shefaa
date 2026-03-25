import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';

class PharmacyFilterChipsWidget extends StatefulWidget {
  const PharmacyFilterChipsWidget({super.key});

  @override
  State<PharmacyFilterChipsWidget> createState() => _PharmacyFilterChipsWidgetState();
}

class _PharmacyFilterChipsWidgetState extends State<PharmacyFilterChipsWidget> {
  int _selectedChipIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          _buildChip(0, appTranslation().get('all')),
          horizontalSpace10,
          _buildChip(1, appTranslation().get('open_now')),
          horizontalSpace10,
          _buildChip(2, appTranslation().get('nearest')),
        ],
      ),
    );
  }

  Widget _buildChip(int index, String label) {
    bool isSelected = _selectedChipIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedChipIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? ColorsManager.primaryAction
              : ColorsManager.surfacePrimary,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: isSelected
                ? ColorsManager.primaryAction
                : ColorsManager.borderColor,
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: TextStylesManager.regular14.copyWith(
            color: isSelected ? ColorsManager.surfacePrimary : ColorsManager.textPrimary,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
