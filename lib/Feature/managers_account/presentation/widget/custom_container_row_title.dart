import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/utils/app_imgaes.dart';
import '../../../../Core/widget/custom_app_text.dart';
import '../../../../Core/widget/custom_arrow_back.dart';

class CustomContainerRowTitle extends StatelessWidget {
  const CustomContainerRowTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: AppColors.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CustomArrowBack(),
          const CustomAppText(
            text: " ادارة مشرفيين الفروع",
            fontWeight: FontWeight.w700,
            size: 18,
            color: AppColors.white,
          ),
          SvgPicture.asset(
            AppImages.edit,
            colorFilter: const ColorFilter.mode(
              AppColors.white,
              BlendMode.srcIn,
            ),
          )
        ],
      ),
    );
  }
}
