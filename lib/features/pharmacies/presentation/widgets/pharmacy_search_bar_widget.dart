import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/primary/primary_text_field.dart';

class PharmacySearchBarWidget extends StatelessWidget {
  final TextEditingController controller;

  const PharmacySearchBarWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return PrimaryTextField(
      controller: controller,
      hint: appTranslation().get('search_pharmacy'),
      prefixIcon: Icon(Icons.search, color: ColorsManager.textPrimary),
      // fillColor: ColorsManager.primaryAction.withValues(alpha: 0.1),
    );
  }
}
