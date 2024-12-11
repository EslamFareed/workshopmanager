import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workshopmanager/Core/extensions/extensions.dart';

import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/utils/app_imgaes.dart';
import '../../../../Core/widget/custom_app_text.dart';

class CustomRowAddService extends StatelessWidget {
  final void Function()? onTap;
  const CustomRowAddService({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomAppText(text: "اضافة خدمات المركز"),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey9),
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              const CustomAppText(
                text: "اضافة خدمة",
                color: AppColors.primary,
              ),
              width(8),
              SvgPicture.asset(AppImages.add),
            ],
          ),
        ).onTap(onTap),
      ],
    );
  }
}
