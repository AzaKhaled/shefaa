import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';
import 'package:shefaa/features/home/data/models/patient_home_model.dart';

class PatientStats extends StatelessWidget {
  final Stats stats;
  const PatientStats({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ColorsManager.surfacePrimary,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: ColorsManager.borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStatItem(stats.appointmentsTotal.toString(), 'Appointments', Colors.blue),
            _buildDivider(),
            _buildStatItem(stats.consultationsTotal.toString(), 'Consultations', Colors.green),
            _buildDivider(),
            _buildStatItem(stats.prescriptionsActive.toString(), 'Prescriptions', Colors.orange),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStylesManager.bold24.copyWith(color: ColorsManager.primaryColor),
        ),
        verticalSpace4,
        Text(
          label,
          style: TextStylesManager.regular12.copyWith(color: ColorsManager.textSecondary),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return VerticalDivider(
      color: ColorsManager.borderColor,
      thickness: 1,
      indent: 5,
      endIndent: 5,
    );
  }
}
