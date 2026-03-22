import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';
import 'package:shefaa/core/utils/constants/routes.dart';
import 'package:shefaa/core/utils/extensions/context_extension.dart';

class DoctorBottomNavigationBarWidget extends StatelessWidget {
  final Map<String, dynamic> doctor;

  const DoctorBottomNavigationBarWidget({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      decoration: BoxDecoration(
        color: ColorsManager.surfacePrimary,
        border: Border(top: BorderSide(color: ColorsManager.borderColor)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                appTranslation().get('consultation_fee'),
                style: TextStylesManager.regular12.copyWith(
                  color: ColorsManager.textSecondary,
                ),
              ),
              verticalSpace4,
              Text(
                '\$${doctor['fee'] ?? '120.00'}',
                style: TextStylesManager.bold20.copyWith(
                  color: ColorsManager.textPrimary,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              context.push(Routes.bookAppointment, arguments: doctor);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsManager.primaryAction,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 14,
              ),
              elevation: 0,
            ),
            child: Row(
              children: [
                Text(
                  appTranslation().get('book_appointment'),
                  style: TextStylesManager.bold14.copyWith(
                    color: Colors.white,
                  ),
                ),
                horizontalSpace8,
                const Icon(
                  Icons.calendar_today_outlined,
                  size: 16,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
