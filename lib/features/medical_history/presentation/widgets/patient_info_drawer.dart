import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';
import 'package:shefaa/core/utils/extensions/context_extension.dart';

class PatientInfoDrawer extends StatelessWidget {
  const PatientInfoDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorsManager.surfacePrimary,
      surfaceTintColor: ColorsManager.surfacePrimary,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        "ميار محمد",
                        style: TextStylesManager.bold16.copyWith(
                          color: ColorsManager.textPrimary,
                        ),
                      ),
                      horizontalSpace12,
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: ColorsManager.primaryColor,
                                width: 2,
                              ),
                            ),
                            child: const CircleAvatar(
                              radius: 24,
                              backgroundImage: AssetImage(
                                'assets/images/person.png',
                              ),
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.all(2),
                              child: const Icon(
                                Icons.verified,
                                color: ColorsManager.primaryColor,
                                size: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              verticalSpace24,

              // Title
              Text(
                appTranslation().get('personal_information'),
                style: TextStylesManager.bold16.copyWith(
                  color: ColorsManager.primaryColor,
                ),
                textAlign: TextAlign.end,
              ),
              verticalSpace24,

              // Info Items
              _buildInfoItem(
                label: appTranslation().get('medical_file_number'),
                value: "123-456-789",
                icon: Icons.assignment_ind_outlined,
              ),
              verticalSpace16,
              _buildInfoItem(
                label: appTranslation().get('date_of_birth'),
                value: "14/05/1995",
                icon: Icons.calendar_today_outlined,
              ),
              verticalSpace16,
              _buildInfoItem(
                label: appTranslation().get('gender'),
                value: appTranslation().get('female'),
                icon: Icons.person_outline,
              ),
              verticalSpace16,
              _buildInfoItem(
                label: appTranslation().get('blood_type'),
                value: "O+",
                icon: Icons.water_drop_outlined,
              ),

              verticalSpace32,

              // Action Button
              ElevatedButton(
                onPressed: () => context.pop,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  appTranslation().get('medical_history'),
                  style: TextStylesManager.bold14.copyWith(color: Colors.white),
                ),
              ),

              verticalSpace24,
              const Divider(height: 1),
              verticalSpace24,

              // Emergency Contact
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        appTranslation().get('emergency_contact'),
                        style: TextStylesManager.regular12.copyWith(
                          color: ColorsManager.textSecondary,
                        ),
                      ),
                      verticalSpace4,
                      Text(
                        "+1 234 567 890",
                        style: TextStylesManager.bold14.copyWith(
                          color: ColorsManager.textPrimary,
                        ),
                        textDirection: TextDirection.ltr,
                      ),
                    ],
                  ),
                  horizontalSpace12,
                  Icon(
                    Icons.contact_phone_outlined,
                    color: ColorsManager.textSecondary,
                    size: 28,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem({
    required String label,
    required String value,
    required IconData icon,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              label,
              style: TextStylesManager.regular12.copyWith(
                color: ColorsManager.textSecondary,
              ),
            ),
            verticalSpace4,
            Text(
              value,
              style: TextStylesManager.bold14.copyWith(
                color: ColorsManager.textPrimary,
              ),
            ),
          ],
        ),
        horizontalSpace12,
        Icon(icon, color: ColorsManager.textSecondary, size: 20),
      ],
    );
  }
}
