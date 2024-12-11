import 'package:flutter/material.dart';

import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widget/custom_app_text.dart';

class CustomWorkshopsList extends StatelessWidget {
  final String image;
  final String workshopName;
  final String govesName;
  final String districtName;

  const CustomWorkshopsList({
    super.key,
    required this.image,
    required this.workshopName,
    required this.govesName,
    required this.districtName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey9),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 3,
            child: Image.network(
              image,
              fit: BoxFit.fill,
              height: heightSize(context) * 0.1,
              width: widthSize(context) * 0.15,
            ),
          ),
          width(16),
          Flexible(
            flex: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppText(
                  text: workshopName,
                  fontWeight: FontWeight.w700,
                ),
                height(8),
                Row(
                  children: [
                    Flexible(
                      child: FittedBox(
                        child: CustomAppText(
                          text: govesName,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    width(16),
                    Flexible(
                      child: FittedBox(
                        child: CustomAppText(
                          text: districtName,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
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
                          text: govesName,
                          fontWeight: FontWeight.w700,
                        ),
                        width(16),
                        CustomAppText(
                          text: districtName,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          width(16),
          const Icon(Icons.delete, color: AppColors.redED),
        ],
      ),
    );
  }
}
