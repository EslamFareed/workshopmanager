import 'package:flutter/material.dart';

import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widget/custom_app_text.dart';

class CustomListTileBody extends StatelessWidget {
  final Widget? leading;
  final String text;
  final Function()? onTap;
  const CustomListTileBody(
      {super.key, this.leading, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: CustomAppText(
        text: text,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}
