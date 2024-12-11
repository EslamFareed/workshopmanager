import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workshopmanager/Core/app/routes.dart';
import 'package:workshopmanager/Core/constant/app_sized.dart';
import 'package:workshopmanager/Core/func/show_toast.dart';
import 'package:workshopmanager/Core/utils/app_colors.dart';
import 'package:workshopmanager/Core/widget/custom_app_bar.dart';
import 'package:workshopmanager/Feature/add_workshop/Presentation/cubit/add_work_shop_cubit.dart';
import 'package:workshopmanager/Feature/location_on_map/presentation/cubit/location_on_map_cubit.dart';
import '../../../../Core/widget/custom_container_button.dart';
import '../../../../di.dart';
import '../../../workshop_working_time/presentation/cubit/workshop_working_time_cubit.dart';
import '../widgets/custom_add_image.dart';
import '../widgets/custom_add_workshop_fileds.dart';

class AddWorkShopScreen extends StatelessWidget {
  const AddWorkShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddWorkShopCubit(getIt(), WorkshopWorkingTimeCubit()),
      child: BlocConsumer<AddWorkShopCubit, AddWorkShopState>(
        listener: (context, state) {
          if (state is AddWorkShopSuccessState) {
            showToast(message: "تم اضافة مركز صيانة ");
            context.push(Routes.navbar);
          } else if (state is AddWorkShopFailureState) {
            showToast(message: state.message);
          }
        },
        builder: (context, state) {
          final cubit = context.read<AddWorkShopCubit>();
          final location = context.read<LocationOnMapCubit>();
          return Scaffold(
            appBar: appBar(
              title: "الاعدادات ",
              textColor: AppColors.black13,
              leading: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 24),
                      child: Column(
                        children: [
                          const CustomAddImage(),
                          height(24),
                          const CustomAddWorkshopFileds(),
                        ],
                      ),
                    ),
                  ),
                ),
                CustomContainerButton(
                  text: "حفظ",
                  onPressed: () {
                    cubit.addWorkshop(
                      lat: location.currentPosition!.latitude.toString(),
                      long: location.currentPosition!.longitude.toString(),
                    );
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
