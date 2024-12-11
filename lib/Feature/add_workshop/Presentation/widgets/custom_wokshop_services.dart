import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workshopmanager/Core/extensions/extensions.dart';
import 'package:workshopmanager/Core/widget/custom_pop_dislog.dart';
import 'package:workshopmanager/di.dart';
import '../../../../Core/constant/app_shared_pref_keys.dart';
import '../../../../Core/service/shared_pref.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widget/custom_app_text.dart';
import '../../../../Core/widget/custom_drop_down_container.dart';
import '../../../../Core/widget/custom_loader_widget.dart';
import '../../../workshop_services/presentation/cubit/workshop_list_service_cubit.dart';

class CustomWokshopServices extends StatefulWidget {
  const CustomWokshopServices({super.key});

  @override
  State<CustomWokshopServices> createState() => _CustomWokshopServicesState();
}

class _CustomWokshopServicesState extends State<CustomWokshopServices> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkshopListServiceCubit(getIt())..service(),
      child: BlocBuilder<WorkshopListServiceCubit, WorkshopListServiceState>(
        builder: (context, state) {
          final cubit = context.read<WorkshopListServiceCubit>();
          return state is WorkshopListServiceSuccessState
              ? CustomDropDownContainer(
                  hint: cubit.selectedItem == null
                      ? "اختار نوع الخدمات "
                      : cubit.selectedItem!,
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
                            return CustomAppText(
                              text: state.service[index].arName,
                            ).onTap(() async {
                              setState(() {
                                cubit.selectedItem =
                                    state.service[index].arName.toString();
                              });
                              context.pop();
                              SharedPref().set(
                                AppSharedPrefrencesKeys.serviceId,
                                state.service[index].id.toString(),
                              );
                            });
                          },
                          separatorBuilder: (context, index) {
                            return const Divider(
                              color: AppColors.primary,
                            );
                          },
                          itemCount: state.service.length,
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
