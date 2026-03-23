import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';

class VitalsGridWidget extends StatelessWidget {
  const VitalsGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              appTranslation().get('real_time_vitals'),
              style: TextStylesManager.bold12.copyWith(
                color: ColorsManager.textSecondary,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                appTranslation().get('live_update'),
                style: TextStylesManager.bold12.copyWith(
                  color: ColorsManager.primaryColor,
                ),
              ),
            ),
          ],
        ),
        verticalSpace8,
        _buildBloodPressureCard(),
        verticalSpace16,
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.2,
          children: [
            _buildVitalCard(
              title: appTranslation().get('pulse'),
              value: '72',
              unit: 'bpm',
              icon: Icons.favorite,
              iconColor: Colors.deepOrange.shade300,
              backgroundColor: ColorsManager.primaryColor,
              badge: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.deepOrange.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Normal',
                  style: TextStylesManager.regular10.copyWith(
                    color: Colors.deepOrange.shade800,
                  ),
                ),
              ),
            ),
            _buildVitalCard(
              title: appTranslation().get('temp'),
              value: '36.6',
              unit: '°C',
              icon: Icons.thermostat,
              iconColor: ColorsManager.primaryColor,
            ),
            _buildVitalCard(
              title: appTranslation().get('height'),
              value: '172',
              unit: appTranslation().get('cm'),
              icon: Icons.straighten,
              iconColor: ColorsManager.primaryColor,
            ),
            _buildVitalCard(
              title: appTranslation().get('glucose'),
              value: '94',
              unit: 'mg/dL',
              icon: Icons.water_drop,
              backgroundColor: ColorsManager.primaryColor,

              iconColor: ColorsManager.secondaryColor,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBloodPressureCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorsManager.surfacePrimary,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorsManager.borderColor),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: ColorsManager.primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.monitor_heart,
              color: ColorsManager.primaryColor,
            ),
          ),
          horizontalSpace16,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appTranslation().get('blood_pressure'),
                  style: TextStylesManager.bold10.copyWith(
                    color: ColorsManager.textSecondary,
                  ),
                ),
                verticalSpace4,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '120/80',
                      style: TextStylesManager.bold20.copyWith(
                        color: ColorsManager.textPrimary,
                      ),
                    ),
                    horizontalSpace4,
                    Text(
                      'mmHg',
                      style: TextStylesManager.regular12.copyWith(
                        color: ColorsManager.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: 0.7,
                backgroundColor: ColorsManager.primaryColor.withValues(
                  alpha: 0.2,
                ),
                valueColor: AlwaysStoppedAnimation<Color>(
                  ColorsManager.primaryColor,
                ),
                minHeight: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVitalCard({
    required String title,
    required String value,
    required String unit,
    required IconData icon,
    required Color iconColor,
    Color? backgroundColor,
    Widget? badge,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor ?? ColorsManager.secondaryColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorsManager.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: iconColor, size: 24),
              if (badge != null) badge,
            ],
          ),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: TextStylesManager.bold24.copyWith(
                  color: ColorsManager.textPrimary,
                ),
              ),
              horizontalSpace4,
              Text(
                unit,
                style: TextStylesManager.regular12.copyWith(
                  color: ColorsManager.textSecondary,
                ),
              ),
            ],
          ),
          verticalSpace4,
          Text(
            title,
            style: TextStylesManager.bold10.copyWith(
              color: ColorsManager.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
