import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:workshopmanager/Core/func/show_toast.dart';
import 'package:workshopmanager/Core/utils/app_imgaes.dart';
import 'package:workshopmanager/Feature/manage_profile/presentation/cubit/manage_profile_cubit.dart';
import '../../../../Core/app/routes.dart';
import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/func/validation.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widget/custom_app_text.dart';
import '../../../../Core/widget/custom_arrow_back.dart';
import '../../../../Core/widget/custom_container_button.dart';
import '../../../../di.dart';
import '../../../add_workshop_manager/presentation/widget/custom_employer_text_form_filed.dart';
import '../widget/custom_files_container.dart';

class ManageProfileScreen extends StatelessWidget {
  const ManageProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ManageProfileCubit(getIt())..getProfile(),
      child: BlocConsumer<ManageProfileCubit, ManageProfileState>(
        listener: (context, state) {
          if (state is ManageProfileSuccessState) {
            showToast(message: "Updated Successflly");
            context.push(Routes.navbar);
          } else if (state is ManageProfileFailureState) {
            showToast(message: state.message);
          }
        },
        builder: (context, state) {
          final cubit = context.read<ManageProfileCubit>();

          return Scaffold(
            body: state is LoadingProfileState
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 34),
                    child: Column(
                      children: [
                        Container(
                          decoration:
                              const BoxDecoration(color: AppColors.primary),
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CustomArrowBack(),
                              const CustomAppText(
                                text: "ادارة البيانات الشخصية",
                                size: 18,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white,
                              ),
                              Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.white,
                                    ),
                                    child: SvgPicture.asset(AppImages.edit),
                                  ),
                                  const CustomAppText(
                                    text: "تعديل",
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.white,
                                    size: 12,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        height(16),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Form(
                                key: cubit.formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Center(
                                        child: CustomAppText(
                                      text: "تعديل البيانات الشخصية",
                                      fontWeight: FontWeight.w700,
                                    )),
                                    height(32),
                                    //! Name
                                    const CustomAppText(
                                      text: "الاسم",
                                      fontWeight: FontWeight.w700,
                                    ),
                                    height(4),
                                    CustomEmployerTextFormFiled(
                                      controller: cubit.nameController,
                                      hint: "الاسم",
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
                                      hint: "رقم الهاتف",
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
                                      hint: "البريد الالكترونى",
                                      validator: (val) =>
                                          AppValidation.emailValidator(
                                              cubit.emailController.text),
                                    ),
                                    height(16),
                                    //!Password
                                    // const CustomAppText(
                                    //   text: "الرقم السري",
                                    //   fontWeight: FontWeight.w700,
                                    // ),
                                    // height(4),
                                    // CustomEmployerTextFormFiled(
                                    //   controller: TextEditingController(),
                                    //   hint: "الرقم السري",
                                    // ),
                                    // height(16),
                                    // //!Company Name
                                    const CustomAppText(
                                      text: "اسم الشركة",
                                      fontWeight: FontWeight.w700,
                                    ),
                                    height(4),
                                    CustomEmployerTextFormFiled(
                                      controller: cubit.companyNameController,
                                      hint: "اسم الشركة",
                                      validator: (val) =>
                                          AppValidation.companyNameValidator(
                                              cubit.companyNameController.text),
                                    ),
                                    height(16),
                                    //!  WebSite
                                    // const CustomAppText(
                                    //   text: "الموقع الالكترونى",
                                    //   fontWeight: FontWeight.w700,
                                    // ),
                                    // height(4),
                                    // CustomEmployerTextFormFiled(
                                    //   controller: TextEditingController(),
                                    //   hint: "الموقع الالكترونى",
                                    // ),
                                    // height(16),
                                    const CustomFilesContainer(
                                      fileText: "السجل التجارى",
                                    ),
                                    height(16),
                                    const CustomFilesContainer(
                                      fileText: "البطاقة الضريبية",
                                    ),
                                    height(16),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        CustomContainerButton(
                          text: "حفظ التغييرات",
                          onPressed: () {
                            cubit.update();
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
