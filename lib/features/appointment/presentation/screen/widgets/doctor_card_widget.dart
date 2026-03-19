import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/assets_helper.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/routes.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';
import 'package:shefaa/core/utils/extensions/context_extension.dart';

class DoctorCardWidget extends StatelessWidget {
  final Map<String, dynamic> doctor;

  const DoctorCardWidget({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(Routes.doctorDetails, arguments: doctor);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: ColorsManager.surfacePrimary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: ColorsManager.primaryAction.withValues(alpha: 0.1),
            backgroundImage: AssetImage(AssetsHelper.doctor),
          ),
          horizontalSpace16,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        doctor['name'],
                        style: TextStylesManager.bold16.copyWith(
                          color: ColorsManager.textPrimary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    horizontalSpace4,
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: ColorsManager.ratingBackground,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.star,
                            color: ColorsManager.ratingIcon,
                            size: 12,
                          ),
                          horizontalSpace4,
                          Text(
                            doctor['rating'].toString(),
                            style: TextStylesManager.bold12.copyWith(
                              color: ColorsManager.ratingText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                verticalSpace4,
                Text(
                  '${doctor['specialty']} • ${doctor['exp']} ${appTranslation().get('years_exp')}',
                  style: TextStylesManager.regular12.copyWith(
                    color: ColorsManager.textSecondary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          appTranslation()
                              .get('consultation_fee')
                              .toUpperCase(),
                          style: TextStylesManager.bold10.copyWith(
                            fontSize: 10,
                            color: ColorsManager.textSecondary,
                            letterSpacing: 0.5,
                          ),
                        ),
                        verticalSpace4,
                        Text(
                          '\$${doctor['fee']}',
                          style: TextStylesManager.bold18.copyWith(
                            color: ColorsManager.primaryAction,
                          ),
                        ),
                      ],
                    ),
                   
                    ElevatedButton(
                      onPressed: () {
                        context.push(Routes.doctorDetails, arguments: doctor);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsManager.primaryAction,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                      child: Text(
                        appTranslation().get('book_now'),
                        style: TextStylesManager.bold12.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
