import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/assets_helper.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';
import 'package:shefaa/core/utils/constants/routes.dart';
import 'package:shefaa/core/utils/extensions/context_extension.dart';

class PharmacyCardWidget extends StatelessWidget {
  const PharmacyCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.surfacePrimary,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 100,
              height: 120,
              color: Colors.grey.shade200,
              child: Image.asset(AssetsHelper.pharmacy, fit: BoxFit.cover),
            ),
          ),
          horizontalSpace12,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        appTranslation().get('app_name') == 'شِفاء'
                            ? 'صيدليه العزبى'
                            : 'El Ezaby Pharmacy',
                        style: TextStylesManager.bold16,
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
                        color: Colors.amber.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Text('4.8', style: TextStylesManager.bold12),
                          horizontalSpace4,
                          const Icon(Icons.star, color: Colors.amber, size: 14),
                        ],
                      ),
                    ),
                  ],
                ),
                verticalSpace8,
                Row(
                  children: [
                    Icon(
                      Icons.near_me_outlined,
                      size: 16,
                      color: ColorsManager.primaryAction,
                    ),
                    horizontalSpace4,
                    Text(
                      '500 ${appTranslation().get('meters')}',
                      style: TextStylesManager.regular12.copyWith(
                        color: ColorsManager.primaryAction,
                      ),
                    ),
                    horizontalSpace16,
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorsManager.primaryAction,
                      ),
                    ),
                    horizontalSpace4,
                    Text(
                      appTranslation().get('open_now'),
                      style: TextStylesManager.regular12.copyWith(
                        color: ColorsManager.primaryAction,
                      ),
                    ),
                  ],
                ),
                verticalSpace12,
                SizedBox(
                  width: double.infinity,
                  height: 38,
                  child: ElevatedButton(
                    onPressed: () {
                      context.push(Routes.pharmacyDetails);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsManager.primaryAction,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          appTranslation().get('view_details'),
                          style: TextStylesManager.bold14.copyWith(
                            color: ColorsManager.surfacePrimary,
                          ),
                        ),
                        horizontalSpace8,
                        Icon(
                          Icons.chevron_left,
                          size: 18,
                          color: ColorsManager.surfacePrimary,
                        ),
                      ],
                    ),
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
