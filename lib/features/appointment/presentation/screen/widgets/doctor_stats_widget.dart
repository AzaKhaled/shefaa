import 'package:flutter/material.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/features/appointment/presentation/screen/widgets/stat_card_widget.dart';
import 'package:shefaa/features/appointment/presentation/screen/widgets/stat_card_with_icon_widget.dart';

class DoctorStatsWidget extends StatelessWidget {
  const DoctorStatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StatCardWidget(
            value: '1000+',
            label: appTranslation().get('patients').isNotEmpty
                ? appTranslation().get('patients').toUpperCase()
                : 'PATIENTS',
          ),
          StatCardWidget(
            value: '450+',
            label: appTranslation().get('reviews').isNotEmpty
                ? appTranslation().get('reviews').toUpperCase()
                : 'REVIEWS',
          ),
          StatCardWithIconWidget(
            icon: Icons.verified_outlined,
            label: appTranslation().get('certified').isNotEmpty
                ? appTranslation().get('certified').toUpperCase()
                : 'CERTIFIED',
          ),
        ],
      ),
    );
  }
}
