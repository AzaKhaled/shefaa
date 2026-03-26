import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';
import 'package:shefaa/features/home/data/models/patient_home_model.dart';

class ActivePrescriptions extends StatelessWidget {
  final List<Prescription> prescriptions;
  const ActivePrescriptions({super.key, required this.prescriptions});

  @override
  Widget build(BuildContext context) {
    if (prescriptions.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Active Prescriptions',
              style: TextStylesManager.bold18.copyWith(color: ColorsManager.textPrimary),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'See All',
                style: TextStylesManager.bold14.copyWith(color: ColorsManager.primaryColor),
              ),
            ),
          ],
        ),
        verticalSpace8,
        SizedBox(
          height: 140,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: prescriptions.length,
            separatorBuilder: (context, index) => horizontalSpace16,
            itemBuilder: (context, index) {
              final prescription = prescriptions[index];
              return Container(
                width: 200,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [ColorsManager.primaryColor, ColorsManager.primaryColor.withValues(alpha: 0.8)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.receipt_long_outlined, color: Colors.white, size: 20),
                        horizontalSpace8,
                        Expanded(
                          child: Text(
                            prescription.prescriptionNumber,
                            style: TextStylesManager.bold12.copyWith(color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      prescription.diagnosis ?? 'General',
                      style: TextStylesManager.bold14.copyWith(color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Dr. ${prescription.doctor.user.name}',
                      style: TextStylesManager.regular10.copyWith(color: Colors.white.withValues(alpha: 0.8)),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    verticalSpace8,
                    Text(
                      _formatDate(prescription.issuedAt),
                      style: TextStylesManager.bold10.copyWith(color: Colors.white.withValues(alpha: 0.6)),
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

  String _formatDate(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      return '${date.day}/${date.month}/${date.year}';
    } catch (e) {
      return dateStr.split('T').first;
    }
  }
}
