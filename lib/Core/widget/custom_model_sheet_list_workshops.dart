import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Feature/Home/Presentation/cubit/home_cubit.dart';
import '../../Feature/add_workshop_manager/presentation/widget/custom_workshop_list_view_body_in_dialog.dart';
import '../../di.dart';
import '../constant/app_sized.dart';
import '../constant/constant.dart';
import '../utils/app_colors.dart';
import 'custom_app_text.dart';
import 'custom_container_button.dart';
import 'custom_loader_widget.dart';

void workshopmodelButtomSheet(
  BuildContext context,
) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return BlocProvider(
        create: (context) => HomeCubit(getIt())..workshops(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12)),
                    color: AppColors.primary,
                  ),
                  child: const Center(
                    child: CustomAppText(
                      text: "اختار مركز الخدمة",
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                ),
                state is HomeGetWorkshopsSuccessState
                    ? Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              return CustomWorkshopListViewBodyInDialog(
                                onChanged: (val) {},
                                value: true,
                                image: state.workhops[index].logo ?? image,
                                workshopName: state.workhops[index].name!,
                                govesName:
                                    state.workhops[index].government!.arName!,
                                districtName:
                                    state.workhops[index].center!.arName!,
                              );
                            },
                            separatorBuilder: (context, index) => height(16),
                            itemCount: state.workhops.length,
                          ),
                        ),
                      )
                    : const Center(
                        child: CustomLoaderWidget(),
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
}
