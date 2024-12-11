import 'package:flutter/material.dart';

import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widget/custom_app_text.dart';

class CustomContainerWorkshopInformationAndLocation extends StatelessWidget {
  final String workshopImage;
  final String workshopname;
  final String gove;
  final String city;
  const CustomContainerWorkshopInformationAndLocation(
      {super.key,
      required this.gove,
      required this.city,
      required this.workshopImage,
      required this.workshopname});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            blurRadius: 4,
            color: AppColors.grey66,
            offset: Offset(0, 4),
          ),
        ],
        color: AppColors.white,
        border: Border.all(
          color: AppColors.primary,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppText(
            text: "مركز الصيانة",
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
          ),
          height(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(workshopImage),
                  ),
                  width(8),
                  CustomAppText(
                    text: workshopname,
                    fontWeight: FontWeight.w700,
                  )
                ],
              ),
              Row(
                children: [
                  CustomAppText(
                    text: gove,
                    fontWeight: FontWeight.w500,
                  ),
                  width(8),
                  CustomAppText(
                    text: city,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
            ],
          ),
          height(16),
          Row(
            children: [
              const Icon(
                Icons.location_on,
                color: AppColors.orange,
              ),
              width(8),
              Row(
                children: [
                  CustomAppText(
                    text: gove,
                    fontWeight: FontWeight.w500,
                  ),
                  width(8),
                  CustomAppText(
                    text: city,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
