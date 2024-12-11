import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:workshopmanager/Core/app/routes.dart';
import 'package:workshopmanager/Core/constant/app_sized.dart';
import 'package:workshopmanager/Core/extensions/extensions.dart';
import 'package:workshopmanager/Core/utils/app_imgaes.dart';
import 'package:workshopmanager/Core/widget/custom_app_button.dart';
import 'package:workshopmanager/Core/widget/custom_app_text.dart';
import '../../../Core/utils/app_colors.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 34),
        child: Column(
          children: [
            Container(
              height: 44,
              alignment: AlignmentDirectional.centerStart,
              width: double.infinity,
              decoration: const BoxDecoration(color: AppColors.primary),
              padding: const EdgeInsets.all(4),
              child: const Icon(
                Icons.arrow_back,
                color: AppColors.white,
              ).onTap(() {
                context.pop();
              }),
            ),
            height(70),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        SvgPicture.asset(AppImages.done),
                        height(16),
                        const CustomAppText(
                          text: "تم قبول الطلب بنجاح",
                          size: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ],
                    ),
                  ),
                  height(heightSize(context) * 0.2),
                  CustomAppButton(
                    text: "العودة للصفحة الرئيسية",
                    width: double.maxFinite,
                    radius: 24,
                    onPressed: () => context.push(Routes.navbar),
                  ),
                  height(32),
                  CustomAppButton(
                    text: "عرض تفاصيل الحجز",
                    width: double.maxFinite,
                    radius: 24,
                    onPressed: () {},
                    containerColor: AppColors.white,
                    textColor: AppColors.primary,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
