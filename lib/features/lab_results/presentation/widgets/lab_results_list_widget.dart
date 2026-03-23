import 'package:flutter/material.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';
import 'package:shefaa/features/lab_results/presentation/widgets/lab_result_card_widget.dart';

class LabResultsListWidget extends StatelessWidget {
  const LabResultsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LabResultCardWidget(
          title: "فحص كوليسترول (LLPID)",
          date: "١٤ أكتوبر ٢٠٢٣",
          labName: appTranslation().get('nile_lab'),
          resultValue: "185 mg/dL",
          isNormal: true,
        ),
        verticalSpace16,
        LabResultCardWidget(
          title: "فحص كوليسترول (LLPID)",
          date: "١٤ أكتوبر ٢٠٢٣",
          labName: appTranslation().get('nile_lab'),
          resultValue: "185 mg/dL",
          isNormal: true,
        ),
        verticalSpace16,
        LabResultCardWidget(
          title: "فحص كوليسترول (LLPID)",
          date: "١٤ أكتوبر ٢٠٢٣",
          labName: appTranslation().get('nile_lab'),
          resultValue: "185 mg/dL",
          isNormal: false,
        ),
      ],
    );
  }
}
