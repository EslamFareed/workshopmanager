import 'package:flutter/material.dart';

import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/widget/custom_app_text.dart';

class CustomUserRowInfo extends StatelessWidget {
  final String userImage;
  final String userName;
  final String userId;
  const CustomUserRowInfo(
      {super.key,
      required this.userImage,
      required this.userName,
      required this.userId});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(userImage),
            ),
            width(4),
            CustomAppText(
              text: userName,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
        CustomAppText(
          text: "id#$userId",
        )
      ],
    );
  }
}
