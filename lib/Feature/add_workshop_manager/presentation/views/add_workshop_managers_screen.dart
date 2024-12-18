import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:workshopmanager/Core/app/routes.dart';
import 'package:workshopmanager/Core/constant/app_sized.dart';
import 'package:workshopmanager/Core/extensions/extensions.dart';
import 'package:workshopmanager/Core/func/show_toast.dart';
import 'package:workshopmanager/Core/func/validation.dart';
import 'package:workshopmanager/Core/utils/app_imgaes.dart';
import 'package:workshopmanager/Core/widget/custom_container_button.dart';
import 'package:workshopmanager/Feature/Home/Presentation/cubit/home_cubit.dart';
import 'package:workshopmanager/Feature/add_workshop_manager/presentation/cubit/add_workshop_manager_cubit.dart';
import 'package:workshopmanager/Feature/add_workshop_manager/presentation/widget/custom_workshop_list_view_body_in_dialog.dart';
import 'package:workshopmanager/di.dart';
import '../../../../Core/constant/constant.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widget/custom_app_text.dart';
import '../../../../Core/widget/custom_arrow_back.dart';
import '../../../../Core/widget/custom_loader_widget.dart';
import '../widget/custom_employer_text_form_filed.dart';

class AddWorkshopManagersScreen extends StatelessWidget {
  const AddWorkshopManagersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddWorkshopManagerCubit(getIt()),
      child: BlocConsumer<AddWorkshopManagerCubit, AddWorkshopManagerState>(
        listener: (context, state) {
          if (state is AddWorkshopManagerSuccessState) {
            showSuccessToast(message: "Add Manager Successfully");
            context.push(Routes.managersAccount);
          } else if (state is AddWorkshopManagerFailureState) {
            showErrorToast(message: state.message);
          } else if (state is AddWorkshopManagerLoadingState) {
            const Center(
              child: CustomLoaderWidget(),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<AddWorkshopManagerCubit>();
          return Scaffold(
              body: state is AddWorkshopManagerLoadingState
                  ? const Center(
                      child: CustomLoaderWidget(),
                    )
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
                                  text: "اضافة موظف جديد",
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
                          height(40),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Form(
                                  key: cubit.formKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //! Job Title
                                      const CustomAppText(
                                        text: "المسمى الوظيفى",
                                        fontWeight: FontWeight.w700,
                                      ),
                                      height(4),
                                      CustomEmployerTextFormFiled(
                                        controller: cubit.jobTitleController,
                                        hint: "المسمى الوظيفى",
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
                                        hint: "اسم الموظف",
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
                                        validator: (val) => AppValidation
                                            .confirmPasswordVaildtor(
                                                value: cubit
                                                    .passwordController.text,
                                                password: cubit
                                                    .confirmPasswordController
                                                    .text),
                                      ),
                                      height(16),
                                      const CustomAppText(
                                        text: "اضف مركز الصيانه",
                                        fontWeight: FontWeight.w700,
                                      ),
                                      Container(
                                        height: 80,
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: AppColors.greyEE,
                                        ),
                                        child: const Center(
                                          child: CustomAppText(
                                              text: "اختار مركز الصيانه"),
                                        ),
                                      ).onTap(() {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return BlocProvider(
                                              create: (context) =>
                                                  HomeCubit(getIt())
                                                    ..workshops(),
                                              child: BlocBuilder<HomeCubit,
                                                  HomeState>(
                                                builder: (context, state) {
                                                  final cubit =
                                                      context.read<HomeCubit>();
                                                  return Column(
                                                    children: [
                                                      Container(
                                                        width: double.infinity,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        decoration:
                                                            const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          12),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          12)),
                                                          color:
                                                              AppColors.primary,
                                                        ),
                                                        child: const Center(
                                                          child: CustomAppText(
                                                            text:
                                                                "اختار مركز الخدمة",
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color:
                                                                AppColors.white,
                                                          ),
                                                        ),
                                                      ),
                                                      state is HomeGetWorkshopsSuccessState
                                                          ? Expanded(
                                                              child: Padding(
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        16,
                                                                    vertical:
                                                                        8),
                                                                child: ListView
                                                                    .separated(
                                                                  itemBuilder:
                                                                      (context,
                                                                          index) {
                                                                    return CustomWorkshopListViewBodyInDialog(
                                                                      onChanged:
                                                                          (val) {
                                                                        cubit
                                                                            .toggleServiceSelection(
                                                                          state.workhops[
                                                                              index],
                                                                        );
                                                                      },
                                                                      value: cubit
                                                                          .filteredWorkshops
                                                                          .contains(
                                                                        state.workhops[
                                                                            index],
                                                                      ),
                                                                      image: state
                                                                              .workhops[index]
                                                                              .logo ??
                                                                          image,
                                                                      workshopName: state
                                                                          .workhops[
                                                                              index]
                                                                          .name!,
                                                                      govesName: state
                                                                          .workhops[
                                                                              index]
                                                                          .government!
                                                                          .arName!,
                                                                      districtName: state
                                                                          .workhops[
                                                                              index]
                                                                          .center!
                                                                          .arName!,
                                                                    );
                                                                  },
                                                                  separatorBuilder:
                                                                      (context,
                                                                              index) =>
                                                                          height(
                                                                              16),
                                                                  itemCount: state
                                                                      .workhops
                                                                      .length,
                                                                ),
                                                              ),
                                                            )
                                                          : const Center(
                                                              child:
                                                                  CustomLoaderWidget(),
                                                            ),
                                                      CustomContainerButton(
                                                        text: "موافق",
                                                        onPressed: () {
                                                          context.pop();
                                                        },
                                                      )
                                                    ],
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        );
                                      }),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          CustomContainerButton(
                            text: "اضافة",
                            onPressed: () {
                              cubit.addWorkshopManager();
                            },
                          )
                        ],
                      ),
                    ));
        },
      ),
    );
  }
}
