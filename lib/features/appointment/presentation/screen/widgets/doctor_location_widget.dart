import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';

class DoctorLocationWidget extends StatelessWidget {
  final Map<String, dynamic> doctor;

  const DoctorLocationWidget({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            appTranslation().get('location').isNotEmpty
                ? appTranslation().get('location')
                : 'Location',
            style: TextStylesManager.bold16.copyWith(
              color: ColorsManager.textPrimary,
            ),
          ),
          verticalSpace12,
          Container(
            decoration: BoxDecoration(
              color: ColorsManager.surfacePrimary,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: ColorsManager.borderColor),
            ),
            child: Column(
              children: [
                Container(
                  height: 120,
                  decoration: const BoxDecoration(
                    color: Color(0xFF81BCAE),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.business_outlined,
                        color: ColorsManager.primaryAction,
                      ),
                      horizontalSpace12,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              doctor['clinic_name'] ??
                                  'HeartCare Specialty Center',
                              style: TextStylesManager.bold14.copyWith(
                                color: ColorsManager.textPrimary,
                              ),
                            ),
                            verticalSpace4,
                            Text(
                              doctor['address'] ??
                                  '123 Medical Plaza, Suite 400, San Francisco, CA 94107',
                              style: TextStylesManager.regular12
                                  .copyWith(
                                    color: ColorsManager.textSecondary,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
