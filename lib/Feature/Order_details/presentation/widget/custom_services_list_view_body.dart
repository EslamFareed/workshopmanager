import 'package:flutter/material.dart';

import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/widget/custom_app_text.dart';

class CustomServicesListViewBody extends StatelessWidget {
  final String serviceName;
  final String price;
  //final Widget widget;
  const CustomServicesListViewBody({
    super.key,
    required this.serviceName,
    required this.price,
    // required this.widget
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomAppText(
          text: "-$serviceName",
          fontWeight: FontWeight.w700,
        ),
        width(16),
        CustomAppText(
          text: "$price ريال",
          fontWeight: FontWeight.w700,
        ),
        //  widget
      ],
    );
  }
}
