import 'package:flutter/material.dart';

import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/widget/custom_app_text.dart';

class CustomCarInfo extends StatelessWidget {
  final String carLogo;
  final String transmissionType;
  final String modelYear;

  const CustomCarInfo(
      {super.key,
      required this.carLogo,
      required this.transmissionType,
      required this.modelYear});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(carLogo),
            )
          ],
        ),
        height(8),
        CustomAppText(
          text: "الجير- $transmissionType",
        ),
        CustomAppText(
          text: "سنة التصنيع - $modelYear",
        )
      ],
    );
  }
}
