import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:workshopmanager/Core/constant/app_sized.dart';
import 'package:workshopmanager/Core/widget/custom_arrow_back.dart';
import 'package:workshopmanager/Core/widget/custom_container_button.dart';
import 'package:workshopmanager/di.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/utils/app_imgaes.dart';
import '../../../../Core/widget/custom_app_text.dart';
import '../../../workshop_working_time/presentation/cubit/workshop_working_time_cubit.dart';
import '../cubit/add_work_shop_cubit.dart';

class CustomSelectedWorkImagesGrideView extends StatelessWidget {
  const CustomSelectedWorkImagesGrideView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddWorkShopCubit(getIt(), WorkshopWorkingTimeCubit()),
      child: BlocBuilder<AddWorkShopCubit, AddWorkShopState>(
        builder: (context, state) {
          final cubit = context.read<AddWorkShopCubit>();
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomArrowBack(),
                      const CustomAppText(
                        text: "صور مركز الصيانة",
                        size: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      width(0),
                    ],
                  ),
                  height(24),
                  Row(children: [
                    const CustomAppText(
                      text: "صورة",
                      fontWeight: FontWeight.bold,
                      size: 18,
                      color: AppColors.grey4B,
                    ),
                    CustomAppText(
                      text: " (${cubit.selectedFiles!.length})",
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      size: 18,
                    ),
                  ]),
                  height(16),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: cubit.selectedFiles!.length + 1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return GestureDetector(
                            onTap: () {
                              cubit.pickImages();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.greyEE,
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      AppImages.add,
                                      height: 32,
                                      width: 32,
                                    ),
                                    const SizedBox(height: 8),
                                    const CustomAppText(
                                      text: 'أضف صورة',
                                      color: AppColors.grey41,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Image.file(
                            cubit.selectedFiles![index - 1],
                            fit: BoxFit.cover,
                          );
                        }
                      },
                    ),
                  ),
                  CustomContainerButton(
                    text: "تم",
                    onPressed: () {
                      context.pop();
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
