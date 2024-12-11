import 'package:flutter/material.dart';
import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widget/custom_app_text.dart';
import '../../../../Core/widget/custom_switch_button.dart';

class CustomMangersInfoContainer extends StatelessWidget {
  final String image;
  final String name;
  final ValueNotifier<bool>? controller;
  final void Function(dynamic)? onChanged;
  const CustomMangersInfoContainer(
      {super.key,
      required this.image,
      required this.name,
      this.controller,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(image),
            ),
            width(4),
            CustomAppText(
              text: name,
              color: AppColors.white,
              fontWeight: FontWeight.w700,
            )
          ],
        ),
        CustomSwitchButton(
          controller: controller,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
