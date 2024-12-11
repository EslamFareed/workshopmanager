import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/utils/app_imgaes.dart';
import '../../../../Core/widget/custom_app_text.dart';

class CustomDateRow extends StatelessWidget {
  final String date;
  final String status;
  final Color calenderColor;
  final Color statusColor;
  const CustomDateRow(
      {super.key,
      required this.date,
      required this.status,
      required this.calenderColor,
      required this.statusColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              AppImages.calendar,
              colorFilter: ColorFilter.mode(calenderColor, BlendMode.srcIn),
            ),
            width(4),
            CustomAppText(
              text: date,
            )
          ],
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: statusColor,
                shape: BoxShape.circle,
              ),
            ),
            width(4),
            CustomAppText(
              text: status,
            )
          ],
        )
      ],
    );
  }
}
