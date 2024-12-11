import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workshopmanager/Core/constant/app_sized.dart';
import 'package:workshopmanager/Core/extensions/extensions.dart';
import 'package:workshopmanager/Core/widget/custom_drop_down_container.dart';
import 'package:workshopmanager/Core/widget/custom_pop_dislog.dart';
import 'package:workshopmanager/Feature/EditWorkshopProfile/presentation/cubit/edit_workshop_profile_cubit.dart';
import '../../../../Core/app/routes.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widget/custom_app_text.dart';
import '../../../add_workshop/Presentation/widgets/custom_text_form_filed.dart';

class CustomEditWorkingDays extends StatefulWidget {
  const CustomEditWorkingDays({super.key});

  @override
  State<CustomEditWorkingDays> createState() => _CustomEditWorkingDaysState();
}

class _CustomEditWorkingDaysState extends State<CustomEditWorkingDays> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditWorkshopProfileCubit, EditWorkshopProfileState>(
      builder: (context, state) {
        final cubit = context.read<EditWorkshopProfileCubit>();
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
                    context.push(Routes.workshopWorkingTime, extra: true);
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
