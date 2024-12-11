import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workshopmanager/Core/app/routes.dart';
import 'package:workshopmanager/Core/utils/app_colors.dart';
import 'package:workshopmanager/Core/utils/app_imgaes.dart';
import 'package:workshopmanager/Core/widget/custom_app_text.dart';
import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/widget/custom_app_button.dart';
import '../widgets/Custom_row_items.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              AppImages.intro,
              fit: BoxFit.fill,
              width: double.maxFinite,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: const CustomRowItems(),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppText(
                text: "مرحبا بك في",
                size: 20,
                fontWeight: FontWeight.w400,
              ),
              height(12),
              const CustomAppText(
                text: "تطبيق خدمات الصيانة",
                size: 24,
                fontWeight: FontWeight.w700,
              ),
              height(heightSize(context) * 0.2),
              CustomAppButton(
                text: "إنشاء حساب",
                width: double.maxFinite,
                radius: 24,
                onPressed: () {
                  context.push(Routes.register);
                },
              ),
              height(36),
              CustomAppButton(
                text: "تسجيل دخول",
                width: double.maxFinite,
                radius: 24,
                onPressed: () {
                  context.push(Routes.login);
                },
                containerColor: AppColors.white,
                textColor: AppColors.primary,
              ),
            ],
          ),
        )
      ],
    ));
  }
}
