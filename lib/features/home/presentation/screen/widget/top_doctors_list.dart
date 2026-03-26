import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/assets_helper.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';
import 'package:shefaa/features/home/data/models/patient_home_model.dart' as model;

class TopDoctorsList extends StatelessWidget {
  final List<model.Consultation> consultations;
  const TopDoctorsList({super.key, required this.consultations});

  @override
  Widget build(BuildContext context) {
    if (consultations.isEmpty) return const SizedBox.shrink();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              appTranslation().get('top_doctors'),
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
          height: 180,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: consultations.length,
            separatorBuilder: (context, index) => horizontalSpace16,
            itemBuilder: (context, index) {
              final doctor = consultations[index].doctor;
              return Container(
                width: 280,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: ColorsManager.surfacePrimary,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: ColorsManager.borderColor),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            AssetsHelper.doctor,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        horizontalSpace12,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                doctor.user.name,
                                style: TextStylesManager.bold16.copyWith(color: ColorsManager.textPrimary),
                              ),
                              Text(
                                doctor.bio ?? 'Medical Specialist',
                                style: TextStylesManager.regular12.copyWith(color: ColorsManager.textSecondary),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              verticalSpace8,
                              Row(
                                children: [
                                  const Icon(Icons.star, color: Colors.orange, size: 16),
                                  horizontalSpace4,
                                  Text(
                                    '${doctor.yearsOfExperience ?? 5}+ exp',
                                    style: TextStylesManager.bold12.copyWith(color: ColorsManager.textPrimary),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsManager.primaryColor.withValues(alpha: 0.1),
                          foregroundColor: ColorsManager.primaryColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: Text(
                          appTranslation().get('book_appointment_short'),
                          style: TextStylesManager.bold14,
                        ),
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
