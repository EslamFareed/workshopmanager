import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workshopmanager/Core/app/routes.dart';
import 'package:workshopmanager/Core/widget/custom_loader_widget.dart';
import 'package:workshopmanager/Feature/show_manager_account/presentation/cubit/show_manager_info_cubit.dart';

import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/constant/constant.dart';
import '../../../../Core/func/show_toast.dart';
import '../../../../Core/func/validation.dart';
import '../../../../Core/widget/custom_app_text.dart';
import '../../../../Core/widget/custom_container_button.dart';
import '../../../../Core/widget/custom_model_sheet_list_workshops.dart';
import '../../../../di.dart';
import '../../../add_workshop_manager/presentation/widget/custom_employer_text_form_filed.dart';
import '../../../settings/presentation/widget/custom_add_workshop_conatiner_button.dart';
import '../widgets/custom_container_title.dart';
import '../widgets/custom_workshops_list.dart';

class ShowManagerInfoScreen extends StatelessWidget {
  final int id;
  const ShowManagerInfoScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ShowManagerInfoCubit(getIt())..showManager(id.toString()),
      child: BlocConsumer<ShowManagerInfoCubit, ShowManagerInfoState>(
        listener: (context, state) {
          if (state is UpdateManagerSuccessState) {
            showToast(message: "Updated Successfully");
            context.push(Routes.managersAccount);
          } else if (state is UpdateManagerFailureState) {
            showToast(message: state.message);
          }
        },
        builder: (context, state) {
          final cubit = context.read<ShowManagerInfoCubit>();
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 34),
              child: Column(
                children: [
                  const CustomContainerTitle(),
                  state is ShowManagerSuccessState
                      ? Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 24),
                            child: SingleChildScrollView(
                              child: Form(
                                key: cubit.formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //! Job Title
                                    const CustomAppText(
                                      text: "المسمى الوظيفى",
                                      fontWeight: FontWeight.w700,
                                    ),
                                    height(4),
                                    CustomEmployerTextFormFiled(
                                      controller: cubit.jobTitleController,
                                      hint: state.manager.employer!.jobTitle!,
                                      validator: (val) =>
                                          AppValidation.displayNameValidator(
                                              cubit.jobTitleController.text),
                                    ),
                                    height(16),
                                    //! Employer Name
                                    const CustomAppText(
                                      text: "اسم الموظف",
                                      fontWeight: FontWeight.w700,
                                    ),
                                    height(4),
                                    CustomEmployerTextFormFiled(
                                      controller: cubit.nameController,
                                      hint: state.manager.name,
                                      validator: (val) =>
                                          AppValidation.displayNameValidator(
                                              cubit.nameController.text),
                                    ),
                                    height(16),
                                    //! Phone Number
                                    const CustomAppText(
                                      text: "رقم الهاتف",
                                      fontWeight: FontWeight.w700,
                                    ),
                                    height(4),
                                    CustomEmployerTextFormFiled(
                                      controller: cubit.phoneController,
                                      hint: state.manager.phone,
                                      validator: (val) =>
                                          AppValidation.phoneNumberVaildtor(
                                              cubit.phoneController.text),
                                    ),
                                    height(16),
                                    //! Email
                                    const CustomAppText(
                                      text: "البريد الالكترونى",
                                      fontWeight: FontWeight.w700,
                                    ),
                                    height(4),
                                    CustomEmployerTextFormFiled(
                                      controller: cubit.emailController,
                                      hint: state.manager.email!,
                                      validator: (val) =>
                                          AppValidation.emailValidator(
                                              cubit.emailController.text),
                                    ),
                                    height(16),
                                    //!Password
                                    const CustomAppText(
                                      text: "الرقم السري",
                                      fontWeight: FontWeight.w700,
                                    ),
                                    height(4),
                                    CustomEmployerTextFormFiled(
                                      controller: cubit.passwordController,
                                      hint: "الرقم السري",
                                      validator: (val) =>
                                          AppValidation.passwordVaildtor(
                                              cubit.passwordController.text),
                                    ),
                                    height(16),
                                    //!Confirm Password
                                    const CustomAppText(
                                      text: "تأكيد الرقم السري",
                                      fontWeight: FontWeight.w700,
                                    ),
                                    height(4),
                                    CustomEmployerTextFormFiled(
                                      controller:
                                          cubit.confirmPasswordController,
                                      hint: "تأكيد الرقم السري",
                                      validator: (val) =>
                                          AppValidation.confirmPasswordVaildtor(
                                              value:
                                                  cubit.passwordController.text,
                                              password: cubit
                                                  .confirmPasswordController
                                                  .text),
                                    ),
                                    height(16),
                                    const CustomAppText(
                                      text: " مركز الصيانة",
                                      fontWeight: FontWeight.w700,
                                    ),
                                    Column(
                                      children: [
                                        ...List.generate(
                                            state.manager.employer!.workshops!
                                                .length, (index) {
                                          return Column(
                                            children: [
                                              CustomWorkshopsList(
                                                image: state
                                                        .manager
                                                        .employer!
                                                        .workshops![index]
                                                        .logo ??
                                                    image,
                                                workshopName: state
                                                    .manager
                                                    .employer!
                                                    .workshops![index]
                                                    .name!,
                                                govesName: state
                                                    .manager
                                                    .employer!
                                                    .workshops![index]
                                                    .government!
                                                    .arName!,
                                                districtName: state
                                                    .manager
                                                    .employer!
                                                    .workshops![index]
                                                    .center!
                                                    .arName!,
                                              ),
                                              if (index <
                                                  state.manager.employer!
                                                          .workshops!.length -
                                                      1) // Prevents extra space after last item
                                                height(8), // Separator
                                            ],
                                          );
                                        }),
                                      ],
                                    ),
                                    height(8), // S

                                    CustomAddWorkshopConatinerButton(
                                      onTap: () {
                                        workshopmodelButtomSheet(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : const Center(
                          child: CustomLoaderWidget(),
                        ),
                  CustomContainerButton(
                    text: "حفظ التغييرات",
                    onPressed: () {
                      cubit.updateManger(id.toString());
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
