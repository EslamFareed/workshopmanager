import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workshopmanager/Core/constant/app_sized.dart';
import 'package:workshopmanager/Core/constant/constant.dart';
import 'package:workshopmanager/Core/func/show_toast.dart';
import 'package:workshopmanager/Feature/managers_account/presentation/cubit/managers_accounts_cubit.dart';
import 'package:workshopmanager/Feature/managers_account/presentation/widget/custom_row_add_employer.dart';
import 'package:workshopmanager/di.dart';
import '../../../../Core/app/routes.dart';
import '../../../../Core/widget/custom_loader_widget.dart';
import '../widget/custom_container_row_title.dart';
import '../widget/custom_manager_list_view_body.dart';

class ManagersAccountScreen extends StatelessWidget {
  const ManagersAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ManagersAccountsCubit(getIt())..managers(),
      child: BlocConsumer<ManagersAccountsCubit, ManagersAccountsState>(
        listener: (context, state) {
          if (state is DeleteEmployerFailureState) {
            showToast(message: state.message);
          } else if (state is DeleteEmployerSuccessState) {
            showToast(message: state.message);
            context.read<ManagersAccountsCubit>().managers();
          } else if (state is ActiveEmployerFailureState) {
            showToast(message: state.message);
          } else if (state is ActiveEmployerSuccessState) {
            showToast(message: state.meesage);
          }
        },
        builder: (context, state) {
          final cubit = context.read<ManagersAccountsCubit>();
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 34),
              child: Column(
                children: [
                  const CustomContainerRowTitle(),
                  height(16),
                  state is ManagersAccountsSuccessState
                      ? Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 24),
                            child: Column(
                              children: [
                                const CustomRowAddEmployer(),
                                height(16),
                                Expanded(
                                  child: ListView.separated(
                                      itemBuilder: (context, index) {
                                        return CustomManagerListViewBody(
                                          controller: cubit.controller,
                                          onChanged: (val) {
                                            cubit.activeEmployer(
                                              state.managers[index].id
                                                  .toString(),
                                            );
                                            //     .then((_) {
                                            //   cubit.controller!.value =
                                            //       cubit.controller!.value;
                                            // });
                                          },
                                          navigator: () {
                                            context.pushNamed(
                                                Routes.showManager,
                                                pathParameters: {
                                                  "id": state.managers[index].id
                                                      .toString(),
                                                });
                                          },
                                          jobTitle: state.managers[index]
                                              .employer!.jobTitle!,
                                          email: state.managers[index].email!,
                                          phone: state.managers[index].phone!,
                                          onTap: () {
                                            cubit.deleteEmployer(
                                              state.managers[index].id!
                                                  .toString(),
                                            );
                                          },
                                          managerImage:
                                              state.managers[index].avatar ??
                                                  image,
                                          managerName:
                                              state.managers[index].name!,
                                        );
                                      },
                                      separatorBuilder: (context, index) =>
                                          height(16),
                                      itemCount: state.managers.length),
                                ),
                              ],
                            ),
                          ),
                        )
                      : const Center(
                          child: CustomLoaderWidget(),
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
