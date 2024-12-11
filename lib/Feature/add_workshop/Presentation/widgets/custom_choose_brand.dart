import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshopmanager/Core/extensions/extensions.dart';
import 'package:workshopmanager/Core/service/shared_pref.dart';
import 'package:workshopmanager/Core/widget/custom_pop_dislog.dart';
import 'package:workshopmanager/Feature/workshop_car_brands/presentation/cubit/workshop_car_brand_cubit.dart';
import 'package:workshopmanager/di.dart';

import '../../../../Core/constant/app_shared_pref_keys.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widget/custom_app_text.dart';
import '../../../../Core/widget/custom_drop_down_container.dart';
import '../../../../Core/widget/custom_loader_widget.dart';

class CustomChooseBrand extends StatefulWidget {
  const CustomChooseBrand({super.key});

  @override
  State<CustomChooseBrand> createState() => _CustomChooseBrandState();
}

class _CustomChooseBrandState extends State<CustomChooseBrand> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkshopCarBrandCubit(getIt())..workshopBrand(),
      child: BlocBuilder<WorkshopCarBrandCubit, WorkshopCarBrandState>(
        builder: (context, state) {
          final cubit = context.read<WorkshopCarBrandCubit>();

          return state is WorkshopCarBrandSuccessState
              ? CustomDropDownContainer(
                  hint: cubit.selectedItem != null
                      ? cubit.selectedItem!
                      : "اختار الماركات ",
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    size: 25,
                    color: AppColors.grey41,
                  ),
                ).onTap(() {
                  popupDropDownDialogs(
                    context: context,
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .5,
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomAppText(
                                  text: state.model[index].arName.toString(),
                                ),
                                Checkbox(
                                  value: cubit.selectedItems.contains(
                                    state.model[index].id.toString(),
                                  ),
                                  onChanged: (val) {
                                    if (val != null) {
                                      cubit.toggleSelection(state
                                          .model[index].id
                                          .toString()); // Toggle selection
                                    }
                                  },
                                )
                              ],
                            ).onTap(
                              () async {
                                cubit.selectedItem =
                                    state.model[index].arName.toString();

                                await SharedPref().setList(
                                    AppSharedPrefrencesKeys.brand,
                                    state.model
                                        .map((e) => e.id.toString())
                                        .toList());
                              },
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Divider(
                              color: AppColors.primary,
                            );
                          },
                          itemCount: state.model.length,
                        ),
                      )
                    ],
                    controller: TextEditingController(),
                  );
                })
              : const Center(
                  child: CustomLoaderWidget(),
                );
        },
      ),
    );
  }
}
