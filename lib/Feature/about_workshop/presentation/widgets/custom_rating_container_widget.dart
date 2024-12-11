import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workshopmanager/Core/constant/app_sized.dart';
import 'package:workshopmanager/Core/widget/custom_app_text.dart';

import '../../../../Core/utils/app_colors.dart';

class CustomRatingContainerWidget extends StatelessWidget {
  final String name;
  // final String maintainType;
  final String pic;
  final String date;
  final String review;
  int rate;
  CustomRatingContainerWidget({
    super.key,
    required this.name,
    // required this.maintainType,
    required this.pic,
    required this.date,
    required this.review,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.grey4B, width: 1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // CustomAppText(
              //   text: maintainType,
              //   size: 16,
              //   fontWeight: FontWeight.w700,
              //   color: AppColors.grey4B,
              // ),

              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      pic,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  width(6),
                  CustomAppText(
                    text: name,
                    size: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.grey4B,
                  ),
                ],
              ),
              Row(
                children: [
                  rate == 5
                      ? const SizedBox(width: 1)
                      : Row(
                          children: List.generate(
                            5 - rate,
                            (index) => const Icon(
                              Icons.star_border,
                              color: Colors.yellow,
                            ),
                          ),
                        ),
                  Row(
                    children: List.generate(
                      rate,
                      (index) => const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          height(12),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CustomAppText(
                  text: review,
                  size: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey4B,
                ),
              ),
              const SizedBox(width: 10),
              CustomAppText(
                text: DateFormat.yMMMEd().format(DateTime.parse(date)),
                size: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.grey9C,
              ),
            ],
          )
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Row(children: [
          //       ...List.generate(rate,
          //           (index) => const Icon(Icons.star, color: AppColors.orange))
          //     ]

          //         //  [
          //         //   Icon(Icons.star, color: AppColors.orange),
          //         //   Icon(Icons.star, color: AppColors.orange),
          //         //   Icon(Icons.star, color: AppColors.orange),
          //         //   Icon(Icons.star, color: AppColors.orange),
          //         // ],
          //         ),
          //     CustomAppText(
          //       text: review,
          //       size: 16,
          //       fontWeight: FontWeight.w500,
          //       color: AppColors.grey4B,
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}
