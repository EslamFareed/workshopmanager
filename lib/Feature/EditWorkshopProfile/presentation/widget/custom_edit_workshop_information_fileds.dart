import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workshopmanager/Core/app/routes.dart';
import 'package:workshopmanager/Core/extensions/extensions.dart';
import 'package:workshopmanager/Feature/EditWorkshopProfile/presentation/cubit/edit_workshop_profile_cubit.dart';
import 'package:workshopmanager/Feature/EditWorkshopProfile/presentation/widget/custom_edit_working_days.dart';
import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widget/custom_app_text.dart';
import '../../../add_workshop/Presentation/widgets/custom_choose_brand.dart';
import '../../../add_workshop/Presentation/widgets/custom_selecet_goves_and_dristrice_row.dart';
import '../../../add_workshop/Presentation/widgets/custom_text_form_filed.dart';
import '../models/workshop_data_model.dart';
import 'custom_edit_phone_number.dart';

class CustomEditWorkshopInformationFileds extends StatelessWidget {
  const CustomEditWorkshopInformationFileds({super.key});
  // final WorkshopProfileModel data;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditWorkshopProfileCubit, EditWorkshopProfileState>(
      builder: (context, state) {
        final cubit = context.read<EditWorkshopProfileCubit>();
        return SingleChildScrollView(
          child: Form(
            key: cubit.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppText(
                  text: "اسم المركز*",
                  size: 14,
                  color: AppColors.black13,
                ),
                height(4),
                CustomTextFormFiled(
                  controller: cubit.workshopNameController,
                  hint: "فاست ريببر",
                ),
                height(16),
                const CustomSelecetGovesAndDristriceRow(),
                height(16),
                const CustomAppText(
                  text: "العنوان",
                  size: 14,
                  color: AppColors.black13,
                ),
                height(4),
                CustomTextFormFiled(
                  controller: cubit.addressController,
                  hint: "ادخل عنوان مركز الصيانة",
                ),
                height(16),
                const CustomAppText(
                  text: "الموقع",
                  size: 14,
                  color: AppColors.black13,
                ),
                height(4),
                CustomTextFormFiled(
                  controller: TextEditingController(),
                  hint: "20 شارع الرياض",
                  enabled: false,
                  prefixIcon: const Icon(
                    Icons.location_on,
                    color: AppColors.orange,
                  ),
                ).onTap(() {
                  context.push(Routes.locationOnMap);
                }),
                height(16),
                const CustomEditPhoneNumber(),
                height(16),
                const CustomEditWorkingDays(),
                height(16),
                const CustomAppText(
                  text: "التخصص",
                  size: 14,
                  color: AppColors.black13,
                ),
                height(4),
                const CustomChooseBrand(),
                height(16),
                const CustomAppText(
                  text: "عن المركز",
                  size: 14,
                  color: AppColors.black13,
                ),
                height(4),
                CustomTextFormFiled(
                  controller: cubit.arDescritptionController,
                  hint: "اضف تعرف عن المركز ",
                  maxLines: 5,
                ),
                height(16),
                const CustomAppText(
                  text: "about Workshop ",
                  size: 14,
                  color: AppColors.black13,
                ),
                height(4),
                CustomTextFormFiled(
                  controller: cubit.enDescritptionController,
                  hint: "Add Information about Workshop ",
                  maxLines: 5,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
