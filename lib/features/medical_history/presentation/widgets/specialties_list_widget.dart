import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';

class SpecialtiesListWidget extends StatelessWidget {
  const SpecialtiesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          appTranslation().get('specialties'),
          style: TextStylesManager.bold14.copyWith(color: ColorsManager.textSecondary),
        ),
        verticalSpace12,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,

          child: Row(
            children: [
              _buildChip('القلب', isSelected: true),
              horizontalSpace8,
              _buildChip('العظام', isSelected: false),
              horizontalSpace8,
              _buildChip('مخ واعصاب', isSelected: false),
              horizontalSpace8,
              _buildChip('القلب', isSelected: true),
              horizontalSpace8,
              _buildChip('العظام', isSelected: false),
              horizontalSpace8,
              _buildChip('مخ واعصاب', isSelected: false),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildChip(String label, {required bool isSelected}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? ColorsManager.primaryColor : ColorsManager.surfacePrimary,
        borderRadius: BorderRadius.circular(20),
        border: isSelected ? null : Border.all(color: ColorsManager.borderColor),
      ),
      child: Text(
        label,
        style: TextStylesManager.bold14.copyWith(
          color: isSelected ? Colors.white : ColorsManager.textPrimary,
        ),
      ),
    );
  }
}
