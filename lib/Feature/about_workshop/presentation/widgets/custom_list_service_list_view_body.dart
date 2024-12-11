import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workshopmanager/Core/constant/app_sized.dart';
import 'package:workshopmanager/Core/widget/custom_app_text.dart';
import '../../../../Core/utils/app_colors.dart';

class CustomListServiceListViewBody extends StatelessWidget {
  final String title;
  final String pic;
  const CustomListServiceListViewBody({
    super.key,
    required this.title,
    required this.pic,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.greyD9),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SvgPicture.network(
              pic,
              height: 50,
              width: 50,
            ),
            width(8),
            CustomAppText(text: title),
          ],
        ));
  }
}
