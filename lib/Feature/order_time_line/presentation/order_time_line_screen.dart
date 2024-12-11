import 'package:flutter/material.dart';
import 'package:workshopmanager/Core/constant/app_sized.dart';
import 'package:workshopmanager/Core/widget/custom_app_text.dart';
import 'package:workshopmanager/Core/widget/custom_container_button.dart';
import 'package:workshopmanager/Feature/order_time_line/presentation/widget/service_tracking_widget.dart';
import 'widget/custom_app_title_and_arrowback.dart';
import 'widget/track_step_widget.dart';

class OrderTimeLineScreen extends StatelessWidget {
  const OrderTimeLineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 34, horizontal: 16),
        child: Column(
          children: [
            const CustomAppTitleAndArrowback(),
            height(32),
            Row(
              children: [
                const CustomAppText(
                  text: 'رقم الطلب',
                  size: 16,
                  fontWeight: FontWeight.w600,
                ),
                width(16),
                const CustomAppText(
                  text: " #crr0215aa1",
                  size: 16,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            height(16),
            Expanded(
              child: ListView.builder(
                itemCount: trackingSteps.length,
                itemBuilder: (context, index) {
                  return ServiceTrackingWidget(
                    step: trackingSteps[index],
                    isLast: index == trackingSteps.length - 1,
                  );
                },
              ),
            ),
            const CustomContainerButton(
              text: "تحديث التتبع",
            )
          ],
        ),
      ),
    );
  }
}
