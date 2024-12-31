import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:workshopmanager/Core/widget/custom_app_text.dart';
import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/utils/app_colors.dart';

class CustomGallaryWorkshopView extends StatelessWidget {
  final List<String> pics;
  const CustomGallaryWorkshopView({
    super.key,
    required this.pics,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            height(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomAppText(
                  text: "معرض الصور",
                  color: AppColors.grey4B,
                  fontWeight: FontWeight.bold,
                  size: 17,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      const CustomAppText(
                        text: "صورة",
                        fontWeight: FontWeight.bold,
                        size: 18,
                        color: AppColors.grey4B,
                      ),
                      CustomAppText(
                        text: " (${pics.length})",
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        size: 18,
                      ),
                    ])
                  ],
                ),
              ],
            ),
            Expanded(
              child: AlignedGridView.count(
                itemCount: pics.length,
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                itemBuilder: (context, index) {
                  return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        pics[index],
                      ));
                },
              ),
            ),
            // const CustomContainerButton(
            //   text: 'احجز ',
            // )
          ],
        ),
      ),
    );
  }
}
