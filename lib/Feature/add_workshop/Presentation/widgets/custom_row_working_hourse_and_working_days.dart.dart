import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workshopmanager/Core/constant/app_sized.dart';
import 'package:workshopmanager/Core/extensions/extensions.dart';
import 'package:workshopmanager/Core/widget/custom_drop_down_container.dart';
import 'package:workshopmanager/Core/widget/custom_pop_dislog.dart';
import 'package:workshopmanager/Feature/add_workshop/Presentation/cubit/add_work_shop_cubit.dart';

import '../../../../Core/app/routes.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widget/custom_app_text.dart';
import 'custom_text_form_filed.dart';

class CustomRowWorkingHourseAndWorkingDays extends StatefulWidget {
  const CustomRowWorkingHourseAndWorkingDays({super.key});

  @override
  State<CustomRowWorkingHourseAndWorkingDays> createState() =>
      _CustomRowWorkingHourseAndWorkingDaysState();
}

class _CustomRowWorkingHourseAndWorkingDaysState
    extends State<CustomRowWorkingHourseAndWorkingDays> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddWorkShopCubit, AddWorkShopState>(
      builder: (context, state) {
        final cubit = context.read<AddWorkShopCubit>();
        return Row(
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppText(
                    text: "مواعيد العمل ",
                    size: 14,
                    color: AppColors.black13,
                  ),
                  height(4),
                  CustomTextFormFiled(
                    controller: TextEditingController(),
                    hint: "اختار مواعيد العمل ",
                    enabled: false,
                  ).onTap(() {
                    context.push(Routes.workshopWorkingTime, extra: false);
                  }),
                ],
              ),
            ),
            width(16),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppText(
                    text: "القدرة الاستيعابية ",
                    size: 14,
                    color: AppColors.black13,
                  ),
                  height(4),
                  CustomDropDownContainer(
                    hint: cubit.capacityNumber,
                    borderRadius: BorderRadius.circular(8),
                  ).onTap(() {
                    popupDropDownDialogs(
                      context: context,
                      children:
                          List.generate(10, (index) => (index + 1).toString())
                              .map((String capacity) {
                        return DropdownMenuItem<String>(
                          value: capacity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomAppText(text: capacity),
                              const Divider(
                                color: AppColors.primary,
                              )
                            ],
                          ).onTap(() {
                            setState(() {
                              cubit.capacityNumber = capacity;
                            });
                            context.pop();
                          }),
                        );
                      }).toList(),
                      controller: TextEditingController(),
                    );
                  })
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
