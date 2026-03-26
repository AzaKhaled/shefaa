import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/assets_helper.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';

class NearbyPharmaciesList extends StatelessWidget {
  const NearbyPharmaciesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              appTranslation().get('nearby_pharmacies'),
              style: TextStylesManager.bold18.copyWith(color: ColorsManager.textPrimary),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                appTranslation().get('see_all'),
                style: TextStylesManager.bold14.copyWith(color: ColorsManager.primaryColor),
              ),
            ),
          ],
        ),
        verticalSpace8,
        SizedBox(
          height: 220,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            separatorBuilder: (context, index) => horizontalSpace16,
            itemBuilder: (context, index) {
              return Container(
                width: 240,
                decoration: BoxDecoration(
                  color: ColorsManager.surfacePrimary,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: ColorsManager.borderColor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                          child: Image.asset(
                            AssetsHelper.pharmacy,
                            height: 120,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'OPEN',
                              style: TextStylesManager.bold10.copyWith(color: ColorsManager.primaryColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'HealthFirst Pharmacy',
                            style: TextStylesManager.bold14.copyWith(color: ColorsManager.textPrimary),
                          ),
                          verticalSpace4,
                          Row(
                            children: [
                              Icon(Icons.location_on_outlined, color: ColorsManager.textSecondary, size: 14),
                              horizontalSpace4,
                              Text(
                                '1.2 km',
                                style: TextStylesManager.regular12.copyWith(color: ColorsManager.textSecondary),
                              ),
                              const Spacer(),
                              const Icon(Icons.star, color: Colors.orange, size: 14),
                              horizontalSpace4,
                              Text(
                                '4.7',
                                style: TextStylesManager.bold12.copyWith(color: ColorsManager.textPrimary),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
