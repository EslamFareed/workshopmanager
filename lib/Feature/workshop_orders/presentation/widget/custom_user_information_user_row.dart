import 'package:flutter/material.dart';
import 'package:workshopmanager/Core/widget/custom_app_text.dart';
import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/utils/app_colors.dart';

class CustomUserInformationUserRow extends StatelessWidget {
  final String url;
  final String text;
  final String id;
  const CustomUserInformationUserRow(
      {super.key, required this.url, required this.text, required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            color: AppColors.grey66,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  url,
                ),
              ),
              width(8),
              CustomAppText(
                fontWeight: FontWeight.w700,
                color: AppColors.white,
                text: text,
              )
            ],
          ),
          CustomAppText(fontWeight: FontWeight.w700, text: id)
        ],
      ),
    );
  }
}
