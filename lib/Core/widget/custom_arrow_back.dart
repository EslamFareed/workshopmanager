import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workshopmanager/Core/extensions/extensions.dart';
import '../utils/app_colors.dart';

class CustomArrowBack extends StatelessWidget {
  const CustomArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            color: AppColors.grey66,
            offset: Offset(0, 4),
          )
        ],
        color: AppColors.white,
      ),
      child: const Icon(
        Icons.arrow_back,
        color: AppColors.primary,
      ),
    ).onTap(() {
      context.pop();
    });
  }
}
