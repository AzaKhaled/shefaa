import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/assets_helper.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';
import 'package:shefaa/core/utils/constants/primary/primary_elevated_button.dart';

class PharmacyDetailsScreen extends StatelessWidget {
  const PharmacyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: true,
            backgroundColor: ColorsManager.surfacePrimary,
            leading: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                AssetsHelper.pharmacy,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          appTranslation().get('app_name') == 'شِفاء' ? 'صيدلية العزبي' : 'El Ezaby Pharmacy',
                          style: TextStylesManager.bold24,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: ColorsManager.primaryAction,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          appTranslation().get('open_now'),
                          style: TextStylesManager.bold14.copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace8,
                  Row(
                    children: [
                      Text(
                        '4.8',
                        style: TextStylesManager.bold16.copyWith(color: ColorsManager.primaryAction),
                      ),
                      horizontalSpace4,
                      Icon(Icons.star, color: ColorsManager.primaryAction, size: 18),
                      horizontalSpace8,
                      Text(
                        appTranslation().get('rating_count'),
                        style: TextStylesManager.regular14.copyWith(color: ColorsManager.textSecondary),
                      ),
                    ],
                  ),
                  verticalSpace24,
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                    decoration: BoxDecoration(
                      color: ColorsManager.primaryAction,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Text(
                            appTranslation().get('contact_info'),
                            style: TextStylesManager.bold16.copyWith(color: Colors.white),
                          ),
                        ),
                        verticalSpace16,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  appTranslation().get('working_hours'),
                                  style: TextStylesManager.regular12.copyWith(color: Colors.white70),
                                ),
                                verticalSpace4,
                                Text(
                                  appTranslation().get('daily_hours'),
                                  style: TextStylesManager.bold14.copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                            horizontalSpace16,
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: const BoxDecoration(
                                color: Colors.white24,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.access_time, color: Colors.white, size: 28),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  verticalSpace32,
                  Text(
                    appTranslation().get('about_pharmacy'),
                    style: TextStylesManager.bold18,
                  ),
                  verticalSpace16,
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          appTranslation().get('pharmacy_desc'),
                          style: TextStylesManager.regular14.copyWith(
                            height: 1.8,
                            color: ColorsManager.textPrimary,
                          ),
                        ),
                        verticalSpace24,
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                            _buildServiceChip(appTranslation().get('electronic_payment')),
                            _buildServiceChip(appTranslation().get('medical_insurance')),
                            _buildServiceChip(appTranslation().get('medication_exchange')),
                          ],
                        ),
                      ],
                    ),
                  ),
                  verticalSpace100, 
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.all(24.0),
        child: PrimaryElevatedButton(
          text: appTranslation().get('dispense_medication'),
          onPressed: () {},
          icon: const Icon(Icons.receipt_long, color: Colors.white),
          textStyle: TextStylesManager.bold16.copyWith(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildServiceChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: ColorsManager.primaryAction,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStylesManager.regular12.copyWith(color: Colors.white),
      ),
    );
  }
}
