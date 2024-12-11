import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workshopmanager/Core/app/routes.dart';
import 'package:workshopmanager/Core/extensions/extensions.dart';
import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widget/custom_app_button.dart';
import '../../../../Core/widget/custom_app_text.dart';

class CustomWorkshopsListViewBody extends StatelessWidget {
  final String image;
  final String workshopName;
  final String govesName;
  final String districtName;
  final String orderNumber;
  final void Function()? onTap;
  final Function()? aboutworkshopOnPressed;
  final Function()? ordersOnPressed;

  const CustomWorkshopsListViewBody(
      {super.key,
      required this.image,
      required this.workshopName,
      required this.govesName,
      required this.districtName,
      required this.orderNumber,
      this.onTap,
      this.aboutworkshopOnPressed,
      this.ordersOnPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 3,
            child: Column(
              children: [
                Image.network(
                  image,
                  height: heightSize(context) * 0.05,
                  width: widthSize(context) * 0.15,
                ),
                height(16),
                const Icon(Icons.settings_outlined),
                const CustomAppText(text: "الاعدادات").onTap(() {
                  context.push(Routes.manageWorkshops);
                }),
              ],
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
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: AppColors.orange,
                        shape: BoxShape.circle,
                      ),
                    ),
                    width(8),
                    CustomAppText(
                      text: "يوجد لديك $orderNumber طلبات صيانة",
                      fontWeight: FontWeight.w700,
                    )
                  ],
                ),
                height(8),
                Row(
                  children: [
                    Flexible(
                      child: CustomAppButton(
                          height: 44,
                          text: "صفحة المركز",
                          onPressed: aboutworkshopOnPressed),
                    ),
                    width(16),
                    Flexible(
                      child: CustomAppButton(
                        onPressed: ordersOnPressed,
                        height: 44,
                        text: "صفحة الطلبات",
                        textColor: AppColors.primary,
                        containerColor: AppColors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          width(16),
          const Column(
            children: [
              Icon(
                Icons.delete,
                color: AppColors.redED,
              ),
              CustomAppText(
                text: "حذف",
                color: AppColors.redED,
              )
            ],
          ).onTap(onTap)
        ],
      ),
    );
  }
}
