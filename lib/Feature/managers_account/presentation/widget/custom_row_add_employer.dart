import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:workshopmanager/Core/app/routes.dart';
import 'package:workshopmanager/Core/extensions/extensions.dart';
import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/utils/app_imgaes.dart';
import '../../../../Core/widget/custom_app_text.dart';

class CustomRowAddEmployer extends StatelessWidget {
  const CustomRowAddEmployer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomAppText(
          text: "مشرف مراكز الصيانة",
          fontWeight: FontWeight.w700,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey9),
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              const CustomAppText(text: "اضافة موظف"),
              width(8),
              SvgPicture.asset(AppImages.add),
            ],
          ),
        ).onTap(() {
          context.push(Routes.addWorkshopManagers);
        })
      ],
    );
  }
}
