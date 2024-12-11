import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workshopmanager/Core/constant/app_sized.dart';
import 'package:workshopmanager/Core/utils/app_colors.dart';
import '../../../../Core/widget/custom_app_text.dart';

class CustomContainerListViewBody extends StatelessWidget {
  final String title;
  final String assetName;
  final Color? borderColor;
  final Color? textColor;
  final Color svgColor;
  final Function()? onTap;

  const CustomContainerListViewBody(
      {super.key,
      required this.title,
      required this.assetName,
      this.borderColor,
      this.textColor,
      this.onTap,
      required this.svgColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 150,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                blurRadius: 2,
                color: AppColors.grey66,
                offset: Offset(0, 4),
              )
            ],
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: borderColor ?? AppColors.primary),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              CustomAppText(
                text: title,
                color: textColor,
                fontWeight: FontWeight.w700,
              ),
              height(8),
              SvgPicture.asset(
                assetName,
                colorFilter: ColorFilter.mode(svgColor, BlendMode.srcIn),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
