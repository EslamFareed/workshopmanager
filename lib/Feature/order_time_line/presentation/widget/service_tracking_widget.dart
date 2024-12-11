import 'package:flutter/material.dart';
import 'package:workshopmanager/Core/widget/custom_app_text.dart';
import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/utils/app_colors.dart';
import 'track_step_widget.dart';

class ServiceTrackingWidget extends StatelessWidget {
  final TrackingStep step;
  final bool isLast;

  const ServiceTrackingWidget(
      {super.key, required this.step, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppText(
                text: step.description,
              ),
              CustomAppText(
                text: step.time,
              ),
              height(16),
            ],
          ),
        ),
        Column(
          children: [
            const Icon(
              Icons.check_circle,
              color: AppColors.primary,
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 40,
                color: AppColors.primary,
              ),
          ],
        ),
        width(16),
      ],
    );
  }
}
