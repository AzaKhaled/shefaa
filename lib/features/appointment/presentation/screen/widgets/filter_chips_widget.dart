import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';

class FilterChipsWidget extends StatefulWidget {
  const FilterChipsWidget({super.key});

  @override
  State<FilterChipsWidget> createState() => _FilterChipsWidgetState();
}

class _FilterChipsWidgetState extends State<FilterChipsWidget> {
  int _selectedChipIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          _buildChip(
            0,
            appTranslation().get('available_today'),
            hasIcon: false,
          ),
          horizontalSpace10,
          _buildChip(1, appTranslation().get('top_rated'), hasIcon: true),
          horizontalSpace10,
          _buildChip(2, appTranslation().get('fee'), hasIcon: true),
        ],
      ),
    );
  }

  Widget _buildChip(int index, String label, {bool hasIcon = false}) {
    bool isSelected = _selectedChipIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedChipIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? ColorsManager.primaryAction
              : ColorsManager.surfacePrimary,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? ColorsManager.primaryAction
                : ColorsManager.borderColor,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: TextStylesManager.regular12.copyWith(
                color: isSelected ? Colors.white : ColorsManager.textPrimary,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
            if (hasIcon) ...[
              horizontalSpace4,
              Icon(
                Icons.keyboard_arrow_down,
                size: 16,
                color: isSelected ? Colors.white : ColorsManager.textPrimary,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
