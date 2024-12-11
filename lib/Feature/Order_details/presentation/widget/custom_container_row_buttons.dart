import 'package:flutter/material.dart';

import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widget/custom_app_button.dart';
import '../../../../Core/widget/custom_container_button.dart';

class CustomContainerRowButtons extends StatelessWidget {
  final String textone;
  final String texttwo;
  final void Function()? onPressedOne;
  final void Function()? onPressedTwo;

  const CustomContainerRowButtons({
    super.key,
    required this.textone,
    required this.texttwo,
    this.onPressedOne,
    this.onPressedTwo,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainerButton(
      child: Row(
        children: [
          Flexible(
            child: CustomAppButton(
                text: textone,
                radius: 24,
                width: double.maxFinite,
                onPressed: onPressedOne),
          ),
          width(16),
          Flexible(
            child: CustomAppButton(
              text: texttwo,
              radius: 24,
              containerColor: AppColors.white,
              textColor: AppColors.primary,
              width: double.maxFinite,
              onPressed: onPressedTwo,
            ),
          )
        ],
      ),
    );
  }
}
