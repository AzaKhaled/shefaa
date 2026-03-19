import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';

import 'package:shefaa/core/utils/constants/spacing.dart';

class BookingProgressWidget extends StatelessWidget {
  final String title;
  final String step;
  final double progress;

  const BookingProgressWidget({
    super.key,
    required this.title,
    required this.step,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStylesManager.bold12.copyWith(
                color: ColorsManager.textPrimary,
              ),
            ),
            Text(
              step,
              style: TextStylesManager.bold10.copyWith(
                color: ColorsManager.primaryAction,
              ),
            ),
          ],
        ),
        verticalSpace8,
        Container(
          height: 4,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorsManager.progressBackground,
            borderRadius: BorderRadius.circular(2),
          ),
          child: FractionallySizedBox(
            alignment: AlignmentDirectional.centerStart,
            widthFactor: progress,
            child: Container(
              decoration: BoxDecoration(
                color: ColorsManager.primaryAction,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
