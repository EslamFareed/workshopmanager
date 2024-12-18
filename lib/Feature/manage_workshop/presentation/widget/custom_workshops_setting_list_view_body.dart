import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workshopmanager/Core/extensions/extensions.dart';
import 'package:workshopmanager/Core/utils/app_imgaes.dart';
import 'package:workshopmanager/Core/widget/custom_switch_button.dart';
import 'package:workshopmanager/Feature/manage_workshop/presentation/cubit/manage_workshops_cubit.dart';
import 'package:workshopmanager/di.dart';

import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/func/show_toast.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widget/custom_app_button.dart';
import '../../../../Core/widget/custom_app_text.dart';

class CustomWorkshopsSettingListViewBody extends StatelessWidget {
  final String image;
  final String workshopName;
  final String govesName;
  final String districtName;
  final String orderNumber;
  final String workshopId;
  final void Function()? onTap;
  final Function()? settingPressed;
  final Function()? servicePressed;

  const CustomWorkshopsSettingListViewBody({
    super.key,
    required this.image,
    required this.workshopName,
    required this.govesName,
    required this.districtName,
    required this.orderNumber,
    this.onTap,
    this.settingPressed,
    this.servicePressed,
    required this.workshopId,
  });

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
                  height: heightSize(context) * 0.1,
                  fit: BoxFit.fill,
                ),
                height(4),
                BlocProvider(
                  create: (context) => ManageWorkshopsCubit(getIt()),
                  child:
                      BlocConsumer<ManageWorkshopsCubit, ManageWorkshopsState>(
                    listener: (context, state) {
                      if (state is ManageWorkshopsSuccessState) {
                        showSuccessToast(message: state.message);
                      } else if (state is ManageWorkshopsFailureState) {
                        showErrorToast(message: state.message);
                      }
                    },
                    builder: (context, state) {
                      final cubit = context.read<ManageWorkshopsCubit>();
                      return CustomSwitchButton(
                          controller: cubit.value,
                          onChanged: (val) {
                            cubit.activeWorkshops(workshopId, value: val);
                          });
                    },
                  ),
                ),
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
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey9,
                        ),
                      ),
                    ),
                    width(16),
                    Flexible(
                      child: FittedBox(
                        child: CustomAppText(
                          text: districtName,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey9,
                        ),
                      ),
                    ),
                  ],
                ),
                height(16),
                Row(
                  children: [
                    Flexible(
                      child: CustomAppButton(
                        containerColor: AppColors.white,
                        height: 34,
                        onPressed: settingPressed,
                        child: Row(
                          children: [
                            const Icon(Icons.settings,
                                color: AppColors.primary),
                            width(4),
                            const CustomAppText(
                              text: "تعديل بيانات",
                              color: AppColors.primary,
                            )
                          ],
                        ),
                      ),
                    ),
                    width(16),
                    Flexible(
                      child: CustomAppButton(
                        onPressed: servicePressed,
                        height: 34,
                        textColor: AppColors.primary,
                        containerColor: AppColors.white,
                        child: Row(
                          children: [
                            SvgPicture.asset(AppImages.setting),
                            width(4),
                            const CustomAppText(
                              text: "خدمات المركز ",
                              color: AppColors.primary,
                            )
                          ],
                        ),
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
