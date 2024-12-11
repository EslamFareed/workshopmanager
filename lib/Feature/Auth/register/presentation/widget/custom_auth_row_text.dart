import 'package:flutter/material.dart';
import 'package:workshopmanager/Core/utils/app_colors.dart';
import 'package:workshopmanager/Core/widget/custom_app_text.dart';

import '../../../../../Core/constant/app_sized.dart';

class CustomAuthTextAccount extends StatelessWidget {
  final String haveAccount;
  final String textAuth;
  final Function() onTap;
  final MainAxisAlignment mainAxisAlignment;

  const CustomAuthTextAccount(
      {super.key,
      required this.haveAccount,
      required this.textAuth,
      required this.onTap,
      this.mainAxisAlignment = MainAxisAlignment.start});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        CustomAppText(
          text: haveAccount,
          fontWeight: FontWeight.w700,
        ),
        width(7),
        InkWell(
            onTap: onTap,
            child: CustomAppText(
              text: textAuth,
              color: AppColors.primary,
              fontWeight: FontWeight.w700,
            ))
      ],
    );
  }
}
