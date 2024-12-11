import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workshopmanager/Core/constant/app_sized.dart';
import 'package:workshopmanager/Core/extensions/extensions.dart';
import 'package:workshopmanager/Feature/goves_and_district/Presentation/cubit/goves_and_district_cubit.dart';
import 'package:workshopmanager/di.dart';
import '../../../../Core/constant/app_shared_pref_keys.dart';
import '../../../../Core/service/shared_pref.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widget/custom_app_text.dart';
import '../../../../Core/widget/custom_drop_down_container.dart';
import '../../../../Core/widget/custom_loader_widget.dart';
import '../../../../Core/widget/custom_pop_dislog.dart';

class CustomSelecetGovesAndDristriceRow extends StatefulWidget {
  const CustomSelecetGovesAndDristriceRow({super.key});

  @override
  State<CustomSelecetGovesAndDristriceRow> createState() =>
      _CustomSelecetGovesAndDristriceRowState();
}

class _CustomSelecetGovesAndDristriceRowState
    extends State<CustomSelecetGovesAndDristriceRow> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GovesAndDistrictCubit(getIt())..goves(),
      child: BlocBuilder<GovesAndDistrictCubit, GovesAndDistrictState>(
        builder: (context, state) {
          final cubit = context.read<GovesAndDistrictCubit>();

          return state is GovesAndDistrictSuccessState
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //! Goves
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomAppText(
                            text: "المحافظة",
                            size: 14,
                            color: AppColors.black13,
                          ),
                          height(4),
                          CustomDropDownContainer(
                            hint: cubit.selectedItem != null
                                ? cubit.selectedItem!
                                : "اختار المحافظة",
                          ).onTap(() {
                            popupDropDownDialogs(
                              context: context,
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).height * .5,
                                  child: ListView.separated(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return CustomAppText(
                                        text: state.model[index].arName
                                            .toString(),
                                      ).onTap(() async {
                                        setState(() {
                                          cubit.selectedItem = state
                                              .model[index].arName
                                              .toString();
                                        });

                                        context.pop();
                                        await SharedPref().set(
                                          AppSharedPrefrencesKeys.goves,
                                          state.model[index].id.toString(),
                                        );
                                      });
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
                          }),
                        ],
                      ),
                    ),
                    width(16),
                    //! Distric
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomAppText(
                            text: "المنطقة",
                            size: 14,
                            color: AppColors.black13,
                          ),
                          height(4),
                          CustomDropDownContainer(
                            hint: cubit.districtItem != null
                                ? cubit.districtItem!
                                : "اختار المنطقة",
                          ).onTap(() {
                            final filteredDistricts = state.model
                                .firstWhere(
                                    (gove) => gove.arName == cubit.selectedItem)
                                .children;
                            popupDropDownDialogs(
                              context: context,
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).height * .5,
                                  child: ListView.separated(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return CustomAppText(
                                        text: filteredDistricts[index]
                                            .arName
                                            .toString(),
                                      ).onTap(() async {
                                        setState(() {
                                          cubit.districtItem =
                                              filteredDistricts[index]
                                                  .arName
                                                  .toString();
                                        });
                                        context.pop();
                                        await SharedPref().set(
                                          AppSharedPrefrencesKeys.distric,
                                          filteredDistricts[index]
                                              .id
                                              .toString(),
                                        );
                                        // print(
                                        //     "=====================${filteredDistricts[index].id}");
                                      });
                                    },
                                    separatorBuilder: (context, index) {
                                      return const Divider(
                                        color: AppColors.primary,
                                      );
                                    },
                                    itemCount: filteredDistricts!.length,
                                  ),
                                )
                              ],
                              controller: TextEditingController(),
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                )
              : const Center(
                  child: CustomLoaderWidget(),
                );
        },
      ),
    );
  }
}
