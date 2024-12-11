import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:workshopmanager/Core/extensions/extensions.dart';
import 'package:workshopmanager/Core/utils/app_imgaes.dart';

import '../../../../Core/app/routes.dart';
import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widget/custom_app_text.dart';

class CustomAddWorkshopConatinerButton extends StatelessWidget {
  final void Function()? onTap;
  const CustomAddWorkshopConatinerButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthSize(context) * 0.3,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primary),
      ),
      child: Row(
        children: [
          const Flexible(
            child: FittedBox(
              child: CustomAppText(
                text: "اضافة مركز",
                color: AppColors.primary,
              ),
            ),
          ),
          width(16),
          SvgPicture.asset(AppImages.add),
        ],
      ),
    ).onTap(onTap ??
        () {
          context.push(Routes.addWorkShop);
        });
  }
}
