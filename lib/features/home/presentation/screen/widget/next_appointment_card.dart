import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';

class NextAppointmentCard extends StatelessWidget {
  final List<dynamic> appointments;
  const NextAppointmentCard({super.key, required this.appointments});

  @override
  Widget build(BuildContext context) {
    if (appointments.isEmpty) {
      return _buildEmptyState(context);
    }

    final appointment = appointments.first;
    // Assuming appointment structure based on consultation or similar
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ColorsManager.primaryColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                appTranslation().get('next_appointment').toUpperCase(),
                style: TextStylesManager.bold12.copyWith(color: Colors.white.withValues(alpha: 0.8)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'UPCOMING',
                  style: TextStylesManager.bold10.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
          verticalSpace16,
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.medical_services_outlined, color: Colors.white),
              ),
              horizontalSpace12,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appointment['doctor']['user']['name'] ?? 'Doctor',
                      style: TextStylesManager.bold16.copyWith(color: Colors.white),
                    ),
                    Text(
                      '${appointment['doctor']['specialty'] ?? ''} • ${appointment['appointment_time'] ?? ''}',
                      style: TextStylesManager.regular12.copyWith(color: Colors.white.withValues(alpha: 0.8)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          verticalSpace20,
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: ColorsManager.primaryColor,
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: Text(appTranslation().get('view_details'), style: TextStylesManager.bold14),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ColorsManager.primaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: ColorsManager.primaryColor.withValues(alpha: 0.2)),
      ),
      child: Column(
        children: [
          Icon(Icons.calendar_today_outlined, color: ColorsManager.primaryColor, size: 40),
          verticalSpace12,
          Text(
            'No Upcoming Appointments',
            style: TextStylesManager.bold16.copyWith(color: ColorsManager.primaryColor),
          ),
          verticalSpace4,
          Text(
            'Keep your health in check by booking a visit',
            textAlign: TextAlign.center,
            style: TextStylesManager.regular12.copyWith(color: ColorsManager.textSecondary),
          ),
          verticalSpace16,
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsManager.primaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: Text(appTranslation().get('book_now')),
          ),
        ],
      ),
    );
  }
}
