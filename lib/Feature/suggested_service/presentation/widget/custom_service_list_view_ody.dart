import 'package:flutter/material.dart';
import 'package:workshopmanager/Core/constant/app_sized.dart';

import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widget/custom_app_text.dart';

class CustomServiceListViewOdy extends StatelessWidget {
  final String serviceName;
  final String price;
  final bool isChecked;
  final ValueChanged<bool?>? onChanged;
  const CustomServiceListViewOdy(
      {super.key,
      required this.serviceName,
      required this.price,
      required this.isChecked,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.greyEE,
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: CustomAppText(
              text: serviceName,
              fontWeight: FontWeight.w700,
            ),
          ),
          width(16),
          Expanded(
            child: CustomAppText(
              text: "$priceريال",
              fontWeight: FontWeight.w700,
            ),
          ),
          Checkbox(
            checkColor: AppColors.white,
            activeColor: AppColors.primary,
            value: isChecked,
            onChanged: onChanged,
          )
        ],
      ),
    );
  }
}
