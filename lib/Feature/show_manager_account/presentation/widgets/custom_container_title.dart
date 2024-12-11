import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/utils/app_imgaes.dart';
import '../../../../Core/widget/custom_app_text.dart';
import '../../../../Core/widget/custom_arrow_back.dart';

class CustomContainerTitle extends StatelessWidget {
  const CustomContainerTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.primary),
      padding: const EdgeInsets.all(8),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const CustomArrowBack(),
        const CustomAppText(
          text: "اضافة موظف جديد",
          size: 18,
          fontWeight: FontWeight.w700,
          color: AppColors.white,
        ),
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white,
              ),
              child: SvgPicture.asset(AppImages.edit),
            ),
            const CustomAppText(
              text: "تعديل",
              fontWeight: FontWeight.w700,
              color: AppColors.white,
              size: 12,
            ),
          ],
        ),
      ]),
    );
  }
}
