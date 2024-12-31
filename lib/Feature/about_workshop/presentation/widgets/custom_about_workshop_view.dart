import 'package:flutter/material.dart';
import 'package:workshopmanager/Core/constant/app_sized.dart';
import 'package:workshopmanager/Core/utils/app_colors.dart';
import 'package:workshopmanager/Core/widget/custom_app_text.dart';

class CustomAboutWorkshopView extends StatelessWidget {
  final String description;
  const CustomAboutWorkshopView({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const CustomAppText(
            text: "عن المركز",
            size: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.grey4B,
          ),
          height(12),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width,
            ),
            child: CustomAppText(
              text: description,
              size: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.grey4B,
            ),
          ),
          height(30),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     CustomIconWithContainer(
          //       icon: Icons.messenger_sharp,
          //       onPressed: () {},
          //     ),
          //     const SizedBox(
          //       width: 10,
          //     ),
          //     CustomIconWithContainer(
          //       icon: Icons.call,
          //       onPressed: () {},
          //     )
          //   ],
          // ),
          // const Spacer(),
          // CustomContainerButton(
          //   text: 'احجز ',
          //   onPressed: () {
          //     //   context.push(Routes.orderSummary);
          //   },
          // )
        ],
      ),
    );
  }
}
