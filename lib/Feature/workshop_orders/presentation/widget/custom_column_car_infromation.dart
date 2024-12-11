import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/utils/app_imgaes.dart';
import '../../../../Core/widget/custom_app_text.dart';

class CustomColumnCarInfromation extends StatelessWidget {
  final String carLogo;
  final String carName;
  final String date;
  final String transmissionType;
  final String modelYear;
  final Color calenderColor;
  const CustomColumnCarInfromation(
      {super.key,
      required this.carLogo,
      required this.carName,
      required this.date,
      required this.transmissionType,
      required this.modelYear,
      required this.calenderColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(carLogo),
                  ),
                  width(8),
                  CustomAppText(fontWeight: FontWeight.w700, text: carName)
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    AppImages.calendar,
                    colorFilter:
                        ColorFilter.mode(calenderColor, BlendMode.srcIn),
                  ),
                  width(8),
                  CustomAppText(text: date),
                ],
              ),
            ],
          ),
          height(8),
          CustomAppText(text: transmissionType),
          height(8),
          CustomAppText(text: "سنة التصنيع-$modelYear"),
        ],
      ),
    );
  }
}
