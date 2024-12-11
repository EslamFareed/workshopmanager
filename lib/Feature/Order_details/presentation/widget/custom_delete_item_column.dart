import 'package:flutter/material.dart';
import 'package:workshopmanager/Core/extensions/extensions.dart';

import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widget/custom_app_text.dart';

class CustomDeleteItemColumn extends StatelessWidget {
  final void Function()? onTap;
  const CustomDeleteItemColumn({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Icon(
          Icons.delete,
          color: AppColors.redED,
        ),
        CustomAppText(
          text: "حذف",
          color: AppColors.redED,
          fontWeight: FontWeight.w400,
        ),
      ],
    ).onTap(onTap);
  }
}
