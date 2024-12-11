import 'package:flutter/material.dart';

import '../../../../Core/utils/app_colors.dart';

class CustomIconWithContainer extends StatelessWidget {
  final IconData icon;
  final void Function() onPressed;
  const CustomIconWithContainer(
      {super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle, border: Border.all(color: AppColors.primary)),
      child: IconButton(
          onPressed: onPressed, icon: Icon(icon, color: AppColors.primary)),
    );
  }
}
