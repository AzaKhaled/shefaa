import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';

class PrescriptionsHeaderWidget extends StatelessWidget {
  const PrescriptionsHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFE2EBE8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                hintText: appTranslation().get('search_prescription'),
                hintStyle: TextStylesManager.regular14.copyWith(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
            ),
          ),
        ),
        horizontalSpace12,
        Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            color: const Color(0xFFE2EBE8),
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            icon: const Icon(Icons.filter_list),
            color: ColorsManager.primaryColor,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
