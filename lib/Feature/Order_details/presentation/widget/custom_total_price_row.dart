import 'package:flutter/material.dart';

import '../../../../Core/widget/custom_app_text.dart';

class CustomTotalPriceRow extends StatelessWidget {
  final String totalPrice;
  const CustomTotalPriceRow({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomAppText(
          text: "المجموع :",
          size: 16,
          fontWeight: FontWeight.w700,
        ),
        CustomAppText(
          text: "$totalPrice ريال",
          size: 16,
          fontWeight: FontWeight.w700,
        )
      ],
    );
  }
}
