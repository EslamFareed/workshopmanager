import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workshopmanager/Core/app/routes.dart';
import 'package:workshopmanager/Core/utils/app_colors.dart';
import 'package:workshopmanager/Core/widget/custom_container_button.dart';
import 'package:workshopmanager/Feature/add_service/presentation/cubit/add_service_cubit.dart';
import 'package:workshopmanager/Feature/add_workshop_manager/presentation/widget/custom_employer_text_form_filed.dart';
import 'package:workshopmanager/di.dart';
import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/func/show_toast.dart';
import '../../../../Core/widget/custom_app_text.dart';
import '../../../../Core/widget/custom_arrow_back.dart';
import '../../../add_workshop/Presentation/widgets/custom_wokshop_services.dart';

class CustomAddServiceFileds extends StatelessWidget {
  final int id;
  const CustomAddServiceFileds({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddServiceCubit(getIt()),
      child: BlocConsumer<AddServiceCubit, AddServiceState>(
        listener: (context, state) {
          if (state is AddServiceSuccessState) {
            showToast(message: "تم اضافة خدمة بنجاح");
            context.pushNamed(Routes.addService, pathParameters: {
              "id": id.toString(),
            });
          } else if (state is AddServiceFailureState) {
            showToast(message: state.message);
          }
        },
        builder: (context, state) {
          final cubit = context.read<AddServiceCubit>();
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(color: AppColors.primary),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomArrowBack(),
                        const CustomAppText(
                          text: "اضافة خدمات المركز",
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                        width(1),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 24,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomAppText(
                            text: "اسم الخدمة",
                            fontWeight: FontWeight.w700,
                          ),
                          height(4),
                          const CustomWokshopServices(),
                          height(16),
                          Row(
                            children: [
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const CustomAppText(
                                      text: "مدة التنفيذ",
                                      fontWeight: FontWeight.w700,
                                    ),
                                    height(4),
                                    CustomEmployerTextFormFiled(
                                      hint: "2 ساعات",
                                      controller: cubit.timeController,
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
                                      text: "التكلفة",
                                      fontWeight: FontWeight.w700,
                                    ),
                                    height(4),
                                    CustomEmployerTextFormFiled(
                                      hint: "1000 ريال",
                                      controller: cubit.costController,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  CustomContainerButton(
                    onPressed: () {
                      cubit.addService(id.toString());
                    },
                    text: "اضافة",
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
