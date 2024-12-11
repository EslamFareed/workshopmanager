import 'package:flutter/material.dart';
import 'package:workshopmanager/Core/constant/app_sized.dart';
import 'package:workshopmanager/Core/extensions/extensions.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widget/custom_app_text.dart';
import 'custom_mangers_info_container.dart';

class CustomManagerListViewBody extends StatelessWidget {
  final String managerImage;
  final String managerName;
  final void Function()? onTap;
  final String phone;
  final String email;
  final String jobTitle;
  final void Function()? navigator;
  final ValueNotifier<bool>? controller;
  final void Function(dynamic)? onChanged;
  const CustomManagerListViewBody(
      {super.key,
      required this.managerImage,
      required this.managerName,
      this.onTap,
      required this.phone,
      required this.email,
      required this.jobTitle,
      this.navigator,
      this.controller,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primary),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: AppColors.primary,
            ),
            child: CustomMangersInfoContainer(
              image: managerImage,
              name: managerName,
              controller: controller,
              onChanged: onChanged,
            ),
          ),
          height(8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppText(text: jobTitle),
                    height(8),
                    CustomAppText(text: phone),
                    height(8),
                    CustomAppText(text: email)
                  ],
                ),
                const Column(
                  children: [
                    Icon(
                      Icons.delete,
                      color: AppColors.redED,
                    ),
                    CustomAppText(
                      text: "حذف",
                      color: AppColors.redED,
                    )
                  ],
                ).onTap(onTap)
              ],
            ),
          )
        ],
      ),
    ).onTap(navigator);
  }
}
