import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../Core/app/routes.dart';
import '../../../../Core/widget/custom_app_button.dart';
import '../../../../Core/widget/custom_app_text.dart';

class CustomRowUpdateOrderStatus extends StatelessWidget {
  const CustomRowUpdateOrderStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomAppText(
          text: "الصيانة المطلوبة",
          fontWeight: FontWeight.w700,
          size: 16,
        ),
        CustomAppButton(
          height: 44,
          text: "تحديث حالة الطلب",
          onPressed: () {
            context.push(Routes.orderTimeLine);
          },
          radius: 24,
        )
      ],
    );
  }
}
