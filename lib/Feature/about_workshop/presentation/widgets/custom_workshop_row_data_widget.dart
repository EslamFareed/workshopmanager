import 'package:flutter/material.dart';
import 'package:workshopmanager/Core/widget/custom_app_text.dart';

import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/utils/app_colors.dart';

class CustomWorkshopRowDataWidget extends StatelessWidget {
  final String rating;
  final String reviewCount;
  final String category;
  final String workshopName;
  final String location;
  final String district;
  const CustomWorkshopRowDataWidget(
      {super.key,
      required this.rating,
      required this.reviewCount,
      required this.category,
      required this.workshopName,
      required this.location,
      required this.district});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: CustomAppText(
                    overflow: TextOverflow.ellipsis,
                    size: 14,
                    text: category,
                    color: Colors.blue,
                    fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: AppColors.orange),
                  width(8),
                  CustomAppText(text: rating, color: AppColors.black13),
                  width(8),
                  CustomAppText(
                      text: '($reviewCount تقييم)', color: AppColors.grey4B)
                ],
              ),
            ],
          ),
          height(8),
          CustomAppText(
            text: workshopName,
            size: 16,
            color: AppColors.black13,
          ),
          height(8),
          Row(
            children: [
              Flexible(
                child: CustomAppText(
                  overflow: TextOverflow.ellipsis,
                  text: location,
                  size: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey9,
                ),
              ),
              const CustomAppText(text: ","),
              Flexible(
                child: CustomAppText(
                  overflow: TextOverflow.ellipsis,
                  text: district,
                  size: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey9,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
