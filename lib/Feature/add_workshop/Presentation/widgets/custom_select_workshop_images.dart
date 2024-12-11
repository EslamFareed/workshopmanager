import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workshopmanager/Core/constant/app_sized.dart';
import 'package:workshopmanager/Core/extensions/extensions.dart';
import 'package:workshopmanager/Core/widget/custom_app_text.dart';

import '../../../../Core/app/routes.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widget/custom_drop_down_container.dart';

class CustomSelectWorkshopImages extends StatelessWidget {
  const CustomSelectWorkshopImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomAppText(text: "صور مركز الصيانة"),
        height(4),
        const CustomDropDownContainer(
          hint: "صور مركز الصيانة",
          icon: Icon(
            Icons.arrow_forward_ios,
            size: 25,
            color: AppColors.grey41,
          ),
        ).onTap(() {
          context.push(Routes.selectWorkshopImages);
        }),
      ],
    );
  }
}
