import 'package:flutter/material.dart';
import 'package:workshopmanager/Core/constant/app_sized.dart';
import '../../../../Core/utils/app_imgaes.dart';
import '../../../../Core/widget/custom_laguage_button.dart';

class CustomRowItems extends StatelessWidget {
  const CustomRowItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        width(1),
        const SizedBox(),
        Image.asset(AppImages.logo),
        const CustomLaguageButton(),
      ],
    );
  }
}
