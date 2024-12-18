import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workshopmanager/Core/app/routes.dart';
import 'package:workshopmanager/Core/constant/app_sized.dart';
import 'package:workshopmanager/Core/utils/app_colors.dart';
import 'package:workshopmanager/Core/widget/custom_arrow_back.dart';
import 'package:workshopmanager/Feature/Home/Presentation/cubit/home_cubit.dart';
import 'package:workshopmanager/di.dart';

import '../../../../Core/constant/constant.dart';
import '../../../../Core/func/show_toast.dart';
import '../../../../Core/widget/custom_app_text.dart';
import '../../../../Core/widget/custom_loader_widget.dart';
import '../widget/custom_workshops_setting_list_view_body.dart';

class ManageWorkshopScreen extends StatelessWidget {
  const ManageWorkshopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(getIt())..workshops(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is DeletedSuccessState) {
            showSuccessToast(message: state.deletedSuccess);
            context.read<HomeCubit>().workshops();
          } else if (state is DeleteFailureState) {
            showErrorToast(message: state.failureMessage);
          }
        },
        builder: (context, state) {
          final cubit = context.read<HomeCubit>();
          return Scaffold(
              body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 34),
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
                        text: " اعددادت المراكز",
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                        size: 18,
                      ),
                      width(1),
                    ],
                  ),
                ),
                height(16),
                state is HomeGetWorkshopsSuccessState
                    ? Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomAppText(
                                text: "الاعدادات",
                                fontWeight: FontWeight.w700,
                              ),
                              Expanded(
                                  child: ListView.separated(
                                itemBuilder: (context, index) {
                                  return CustomWorkshopsSettingListViewBody(
                                    workshopId:
                                        state.workhops[index].id.toString(),
                                    image: state.workhops[index].logo ?? image,
                                    workshopName: state.workhops[index].name!,
                                    govesName: state
                                        .workhops[index].government!.arName!,
                                    districtName:
                                        state.workhops[index].center!.arName!,
                                    orderNumber: state
                                        .workhops[index].orderCount
                                        .toString(),
                                    onTap: () {
                                      cubit.deleteWorkshop(
                                          state.workhops[index].id.toString());
                                    },
                                    servicePressed: () {
                                      context.pushNamed(
                                        Routes.addService,
                                        pathParameters: {
                                          "id": state.workhops[index].id
                                              .toString(),
                                        },
                                      );
                                    },
                                    settingPressed: () {
                                      context.pushNamed(
                                        Routes.editWorkshop,
                                        pathParameters: {
                                          "id": state.workhops[index].id
                                              .toString(),
                                        },
                                      );
                                    },
                                  );
                                },
                                itemCount: state.workhops.length,
                                separatorBuilder: (context, index) =>
                                    height(16),
                              ))
                            ],
                          ),
                        ),
                      )
                    : const Center(
                        child: CustomLoaderWidget(),
                      )
              ],
            ),
          ));
        },
      ),
    );
  }
}
