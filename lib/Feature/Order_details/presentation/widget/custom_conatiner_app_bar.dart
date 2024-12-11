import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:workshopmanager/Core/extensions/extensions.dart';

import '../../../../Core/app/routes.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/utils/app_imgaes.dart';
import '../../../../Core/widget/custom_app_text.dart';

class CustomConatinerAppBar extends StatelessWidget {
  const CustomConatinerAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.primary),
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.arrow_back,
            color: AppColors.white,
          ).onTap(() {
            context.pop();
          }),
          const CustomAppText(
            text: "تفاصيل الحجز",
            fontWeight: FontWeight.w700,
            color: AppColors.white,
            size: 18,
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 4,
                      color: AppColors.grey66,
                      offset: Offset(0, 4),
                    ),
                    BoxShadow(
                      blurRadius: 4,
                      color: AppColors.grey66,
                      offset: Offset(1, 0),
                    )
                  ],
                  color: AppColors.white,
                ),
                child: SvgPicture.asset(
                  AppImages.filter,
                ),
              ),
              const CustomAppText(
                text: "QR Code",
                size: 12,
                color: AppColors.white,
              )
            ],
          ).onTap(() {
            context.push(Routes.scanner);
          }),
        ],
      ),
    );
  }
}
