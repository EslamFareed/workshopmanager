import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:workshopmanager/Core/app/routes.dart';
import 'package:workshopmanager/Core/constant/app_sized.dart';
import 'package:workshopmanager/Core/func/show_toast.dart';
import 'package:workshopmanager/Core/utils/app_colors.dart';
import 'package:workshopmanager/Core/widget/custom_app_button.dart';
import 'package:workshopmanager/Feature/settings/presentation/cubit/settings_cubit.dart';
import 'package:workshopmanager/Feature/settings/presentation/widget/custom_list_tile_body.dart';
import 'package:workshopmanager/di.dart';
import '../../../../Core/constant/tile_svgs.dart';
import '../../../../Core/constant/tile_titles.dart';
import '../../../../Core/widget/custom_app_bar.dart';
import '../widget/custom_add_workshop_conatiner_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state is LogoutSuccessState) {
          showSuccessToast(message: state.message);
          context.push(Routes.login);
        } else if (state is LogoutFailureState) {
          showErrorToast(message: state.message);
        }
      },
      builder: (context, state) {
        final cubit = context.read<SettingsCubit>();
        return Scaffold(
          appBar: appBar(
            color: AppColors.primary,
            title: "الاعدادات",
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const CustomAddWorkshopConatinerButton(),
                  height(64),
                  ListView.builder(
                    itemCount: title.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CustomListTileBody(
                        leading: icons[index],
                        text: title[index],
                        onTap: () {
                          switch (index) {
                            case 0:
                              context.push(Routes.manageProfile);
                              break;
                            case 1:
                              context.push(Routes.addWorkshopManagers);
                              break;
                            case 2:
                              context.push(Routes.managersAccount);
                              break;
                            case 3:
                              context.push(Routes.manageWorkshops);
                              break;
                            case 4:
                              launchUrl(Uri.parse("tel://+201098333463"));
                              break;
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomAppButton(
                    text: "تسجيل الخروج",
                    containerColor: AppColors.redED,
                    onPressed: () {
                      cubit.logout();
                    },
                    radius: 24,
                    width: double.infinity,
                    borderColor: AppColors.redED,
                  ),
                  height(10),
                  CustomAppButton(
                    text: "حذف الحساب",
                    containerColor: AppColors.white,
                    onPressed: () {
                      showDeleteDialog(context, cubit);
                    },
                    radius: 24,
                    textColor: AppColors.redED,
                    width: double.infinity,
                    borderColor: AppColors.redED,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void showDeleteDialog(BuildContext context, cubit) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            width: MediaQuery.sizeOf(context).width * .8,
            height: MediaQuery.sizeOf(context).height * .5,
            padding: const EdgeInsets.all(20),
            child: BlocConsumer<SettingsCubit, SettingsState>(
              listener: (context, state) {
                if (state is SuccessDeleteAccountState) {
                  showSuccessToast(message: "تم حذف الحساب بنجاح");
                  context.push(Routes.login);
                }
              },
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "هل انت متأكد من حذف الحساب ؟؟",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    CustomAppButton(
                      text: "الغاء",
                      containerColor: AppColors.primary,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      radius: 24,
                      textColor: AppColors.white,
                      width: double.infinity,
                      borderColor: AppColors.primary,
                    ),
                    const SizedBox(height: 20),
                    state is LoadingDeleteAccountState
                        ? const Center(child: CircularProgressIndicator())
                        : CustomAppButton(
                            text: "حذف الحساب",
                            containerColor: AppColors.white,
                            onPressed: () {
                              cubit.deleteAccount();
                            },
                            radius: 24,
                            textColor: AppColors.redED,
                            width: double.infinity,
                            borderColor: AppColors.redED,
                          ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
