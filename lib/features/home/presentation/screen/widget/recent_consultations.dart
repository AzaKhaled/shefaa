import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';
import 'package:shefaa/features/home/data/models/patient_home_model.dart';

class RecentConsultations extends StatelessWidget {
  final List<Consultation> consultations;
  const RecentConsultations({super.key, required this.consultations});

  @override
  Widget build(BuildContext context) {
    if (consultations.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Consultations',
              style: TextStylesManager.bold18.copyWith(color: ColorsManager.textPrimary),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'View All',
                style: TextStylesManager.bold14.copyWith(color: ColorsManager.primaryColor),
              ),
            ),
          ],
        ),
        verticalSpace8,
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: consultations.length > 3 ? 3 : consultations.length,
          separatorBuilder: (context, index) => verticalSpace12,
          itemBuilder: (context, index) {
            final consultation = consultations[index];
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
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ColorsManager.primaryColor.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.person_outline, color: ColorsManager.primaryColor),
                  ),
                  horizontalSpace12,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          consultation.doctor.user.name,
                          style: TextStylesManager.bold14.copyWith(color: ColorsManager.textPrimary),
                        ),
                        Text(
                          consultation.diagnosis ?? 'General Consultation',
                          style: TextStylesManager.regular12.copyWith(color: ColorsManager.textSecondary),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        _formatDate(consultation.startedAt),
                        style: TextStylesManager.regular10.copyWith(color: ColorsManager.textSecondary),
                      ),
                      verticalSpace4,
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: _getStatusColor(consultation.status).withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          consultation.status?.toUpperCase() ?? 'COMPLETED',
                          style: TextStylesManager.bold10.copyWith(
                            color: _getStatusColor(consultation.status),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  String _formatDate(String? dateStr) {
    if (dateStr == null) return '';
    try {
      final date = DateTime.parse(dateStr);
      return '${date.day}/${date.month}/${date.year}';
    } catch (e) {
      return dateStr.split('T').first;
    }
  }

  Color _getStatusColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'completed':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'cancelled':
        return Colors.red;
      default:
        return ColorsManager.primaryColor;
    }
  }
}
