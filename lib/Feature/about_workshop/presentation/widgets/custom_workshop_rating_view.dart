import 'package:flutter/material.dart';
import 'package:workshopmanager/Core/widget/custom_app_text.dart';
import 'package:workshopmanager/Core/widget/custom_container_button.dart';
import 'package:workshopmanager/Feature/about_workshop/presentation/widgets/custom_rating_container_widget.dart';
import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../data/model/about_workshop_review.dart';

class CustomWorkshopRatingView extends StatelessWidget {
  // final String name;
  // final String maintainType;
  // final String pic;
  // final String date;
  // final String review;
  // final int? itemCount;
  const CustomWorkshopRatingView({
    super.key,
    // required this.name,
    // required this.maintainType,
    // required this.pic,
    // required this.date,
    // required this.review,
    // this.itemCount,
    required this.reviews,
  });

  final List<AboutWorkshopReview>? reviews;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const CustomAppText(
            text: "التقييمات",
            size: 18,
            fontWeight: FontWeight.w400,
            color: AppColors.primary,
          ),
          height(12),
          reviews!.isEmpty
              ? Container()
              : Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: reviews!.length,
                    itemBuilder: (context, index) {
                      final item = reviews![index];
                      return CustomRatingContainerWidget(
                          name: item.name ?? "",
                          rate: item.starRating ?? 0,
                          // maintainType: item.comment ?? "",
                          pic: item.avatar ?? "",
                          date: item.createdAt ?? "",
                          review: item.comment ?? "");
                    },
                  ),
                ),
          // const CustomContainerButton(
          //   text: 'احجز ',
          // )
          // WhiteContainer(
          //   widget: DefaultButton(
          //     width: MediaQuery.sizeOf(context).width * 0.9,
          //     height: MediaQuery.sizeOf(context).height * 0.06,
          //     containerColor: AppColors.primary,
          //     title: ,
          //     onPressed: () {
          //       context.push(Routes.orderSummary);
          //     },
          //   ),
          // ),
        ],
      ),
    ));
  }
}
