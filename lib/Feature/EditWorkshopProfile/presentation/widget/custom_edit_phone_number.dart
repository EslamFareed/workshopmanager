import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshopmanager/Core/constant/app_sized.dart';
import 'package:workshopmanager/Feature/EditWorkshopProfile/presentation/cubit/edit_workshop_profile_cubit.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widget/custom_app_text.dart';
import '../../../add_workshop/Presentation/widgets/custom_text_form_filed.dart';

class CustomEditPhoneNumber extends StatelessWidget {
  const CustomEditPhoneNumber({super.key});

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
                    text: "رقم الهاتف 1 *",
                    size: 14,
                    color: AppColors.black13,
                  ),
                  height(4),
                  CustomTextFormFiled(
                    controller: cubit.phoneOneController,
                    hint: "01026984562",
                  ),
                  height(4),
                  const CustomAppText(
                    text: "اجبارى*",
                    size: 14,
                    color: AppColors.black13,
                  ),
                ],
              ),
            ),
            width(16),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppText(
                    text: "رقم الهاتف 2 ",
                    size: 14,
                    color: AppColors.black13,
                  ),
                  height(4),
                  CustomTextFormFiled(
                    controller: TextEditingController(),
                    hint: "01026984562",
                  ),
                  height(4),
                  const CustomAppText(
                    text: "اختيارى*",
                    size: 14,
                    color: AppColors.black13,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
