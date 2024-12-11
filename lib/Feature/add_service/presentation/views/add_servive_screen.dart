import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workshopmanager/Core/app/routes.dart';
import 'package:workshopmanager/Core/func/show_toast.dart';
import 'package:workshopmanager/Core/utils/app_colors.dart';
import 'package:workshopmanager/Core/widget/custom_app_text.dart';
import 'package:workshopmanager/Core/widget/custom_arrow_back.dart';
import 'package:workshopmanager/Core/widget/custom_loader_widget.dart';
import 'package:workshopmanager/Core/widget/custom_switch_button.dart';
import 'package:workshopmanager/Feature/add_service/presentation/cubit/add_service_cubit.dart';
import 'package:workshopmanager/Feature/suggested_service/presentation/cubit/suggested_service_cubit.dart';
import 'package:workshopmanager/di.dart';

import '../../../../Core/constant/app_sized.dart';
import '../widget/custom_row_add_service.dart';

class AddServiveScreen extends StatelessWidget {
  final int id;
  const AddServiveScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SuggestedServiceCubit(getIt())..service(id.toString()),
      child: BlocBuilder<SuggestedServiceCubit, SuggestedServiceState>(
        builder: (context, state) {
          return Scaffold(
            body: state is SuggestedServiceSuccessState
                ? SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 34),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CustomArrowBack(),
                              const CustomAppText(
                                text: "خدمات المركز",
                                fontWeight: FontWeight.w700,
                                size: 18,
                              ),
                              width(1),
                            ],
                          ),
                          height(36),
                          Column(
                            children: [
                              CustomRowAddService(
                                onTap: () {
                                  context.pushNamed(Routes.addSerivceFileds,
                                      pathParameters: {
                                        "id": id.toString(),
                                      });
                                },
                              ),
                              height(24),
                              Column(
                                children: [
                                  ...List.generate(
                                    state.service.length,
                                    (index) => Container(
                                      margin: const EdgeInsets.only(bottom: 16),
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: AppColors.greyEE,
                                        border:
                                            Border.all(color: AppColors.grey9),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: CustomAppText(
                                                  text: state.service[index]
                                                      .service!.arName!,
                                                ),
                                              ),
                                              BlocProvider(
                                                create: (context) =>
                                                    AddServiceCubit(getIt()),
                                                child: BlocConsumer<
                                                    AddServiceCubit,
                                                    AddServiceState>(
                                                  listener: (context, statte) {
                                                    if (statte
                                                        is ActiveServiceSuccessState) {
                                                      showToast(
                                                          message:
                                                              statte.message);
                                                    } else if (statte
                                                        is AddServiceFailureState) {
                                                      showToast(
                                                          message:
                                                              statte.message);
                                                    }
                                                  },
                                                  builder: (context, statte) {
                                                    final cubit = context.read<
                                                        AddServiceCubit>();
                                                    return CustomSwitchButton(
                                                      controller: cubit.value,
                                                      inactiveColor:
                                                          AppColors.greyD9,
                                                      onChanged: (val) =>
                                                          cubit.activeService(
                                                              state
                                                                  .service[
                                                                      index]
                                                                  .id
                                                                  .toString(),
                                                              val: val),

                                                      // activeColor: AppColors.primary,
                                                    );
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                          height(16),
                                          Row(
                                            children: [
                                              Flexible(
                                                child: Column(
                                                  children: [
                                                    CustomAppText(
                                                      text:
                                                          "${state.service[index].price} ريال",
                                                    ),
                                                    Container(
                                                      height: 1,
                                                      decoration:
                                                          const BoxDecoration(
                                                              color: AppColors
                                                                  .grey9),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              width(16),
                                              Flexible(
                                                child: Column(
                                                  children: [
                                                    CustomAppText(
                                                      text:
                                                          "${state.service[index].astimatedTime} ${state.service[index].astimatedTimeType!}",
                                                    ),
                                                    Container(
                                                      height: 1,
                                                      decoration:
                                                          const BoxDecoration(
                                                              color: AppColors
                                                                  .grey9),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              width(0),
                                              Flexible(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                : const Center(
                    child: CustomLoaderWidget(),
                  ),
          );
        },
      ),
    );
  }
}
