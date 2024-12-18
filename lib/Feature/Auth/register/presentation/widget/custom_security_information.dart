import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:workshopmanager/Core/utils/app_imgaes.dart';
import 'package:workshopmanager/Feature/Auth/register/presentation/cubit/register_cubit.dart';
import '../../../../../Core/constant/app_sized.dart';
import '../../../../../Core/func/validation.dart';
import '../../../../../Core/utils/app_colors.dart';
import '../../../../../Core/widget/custom_app_text.dart';
import '../../../../../Core/widget/custom_arrow_back.dart';
import '../../../../add_workshop/Presentation/widgets/custom_text_form_filed.dart';
import 'custom_add_image.dart';
import 'custom_pick_image_row.dart';

Widget securityInfromationWidget(BuildContext context) {
  return BlocBuilder<RegisterCubit, RegisterState>(
    builder: (context, state) {
      final cubit = context.read<RegisterCubit>();

      return Form(
        key: cubit.companyInfoFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 26),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomArrowBack(
                  onTap: () {
                    cubit.pageDecrement();
                  },
                ),
                const CustomAppText(
                  text: "بدء الاستخدام",
                  color: AppColors.primary,
                  size: 16,
                  fontWeight: FontWeight.w700,
                ),
                width(5)
              ],
            ),
            const SizedBox(
              height: 28,
            ),
            const CustomAppText(
              text: "انشاء حساب مدير مركز",
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
              size: 32,
            ),
            height(8),
            const CustomAppText(
              text: "اضف بياناتك لتسجيل الدخول فى التطبيق",
              fontWeight: FontWeight.w400,
              color: AppColors.grey66,
              size: 14,
            ),
            height(16),
            //! Company Name Filed
            const CustomAppText(text: "اسم الشركة*"),
            height(4),
            CustomTextFormFiled(
              hint: "اوتو كار",
              textInputAction: TextInputAction.next,
              controller: cubit.companyNameController,
              validator: (value) {
                return AppValidation.companyNameValidator(
                    cubit.nameController.text);
              },
            ),
            height(16),
            //! web site Filed
            const CustomAppText(text: "الموقع الالكترونى"),
            height(4),
            CustomTextFormFiled(
              hint: "اوتو كار",
              textInputAction: TextInputAction.next,
              controller: cubit.webSiteController,
              validator: (value) {
                return AppValidation.displayNameValidator(
                    cubit.nameController.text);
              },
            ),

            height(4),
            const CustomAppText(
              text: "اختيارى*",
              size: 14,
              color: AppColors.black13,
            ),
            height(16),
            //! Company Registeration Image
            CustomPickImageRow(
              text: "السجل التجارى",
              uploadText: "ارفع صورة السجل التجارى",
              imageWidget: CustomAddProfileStack(
                  peaperText: "صورة السجل التجارى",
                  image: cubit.companyRegisteration,
                  galleryOnTap: () {
                    cubit.companyRegisterationPicker(ImageSource.gallery);
                    context.pop();
                  },
                  cameraOnTap: () {
                    cubit.companyRegisterationPicker(ImageSource.camera);
                    context.pop();
                  }),
              widget: cubit.companyRegisteration == null
                  ? SvgPicture.asset(
                      AppImages.exclamation,
                      height: 28,
                      width: 28,
                    )
                  : Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary,
                      ),
                      child: const Icon(
                        Icons.done,
                        color: AppColors.white,
                      ),
                    ),
            ),
            //! Tax File Image
            height(16),
            CustomPickImageRow(
              text: "البطاقة الضريبية",
              uploadText: "ارفع صورة للبطاقة الضريبية",
              imageWidget: CustomAddProfileStack(
                  peaperText: "صورة البطاقة الضريبية",
                  image: cubit.taxFile,
                  galleryOnTap: () {
                    cubit.taximagePicker(ImageSource.gallery);
                    context.pop();
                  },
                  cameraOnTap: () {
                    cubit.taximagePicker(ImageSource.camera);
                    context.pop();
                  }),
              widget: cubit.taxFile == null
                  ? SvgPicture.asset(
                      AppImages.exclamation,
                      height: 28,
                      width: 28,
                    )
                  : Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary,
                      ),
                      child: const Icon(
                        Icons.done,
                        color: AppColors.white,
                      ),
                    ),
            ),
            height(16),
            const CustomAppText(
              text: "عن المركز",
              size: 14,
              color: AppColors.black13,
            ),
            height(4),
            CustomTextFormFiled(
              controller: TextEditingController(),
              hint: "اضف تعرف عن المركز ",
              maxLines: 5,
            ),
            height(16),
          ],
        ),
      );
    },
  );
}
