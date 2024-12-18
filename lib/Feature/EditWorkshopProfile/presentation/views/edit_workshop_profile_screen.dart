import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workshopmanager/Core/app/routes.dart';
import 'package:workshopmanager/Core/func/show_toast.dart';
import 'package:workshopmanager/Feature/EditWorkshopProfile/presentation/cubit/edit_workshop_profile_cubit.dart';
import 'package:workshopmanager/Feature/EditWorkshopProfile/presentation/widget/custom_edit_workshop_images.dart';
import 'package:workshopmanager/di.dart';
import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widget/custom_app_bar.dart';
import '../../../../Core/widget/custom_container_button.dart';
import '../../../location_on_map/presentation/cubit/location_on_map_cubit.dart';
import '../../../workshop_working_time/presentation/cubit/workshop_working_time_cubit.dart';
import '../widget/custom_edit_workshop_information_fileds.dart';

class EditWorkshopProfileScreen extends StatelessWidget {
  final int id;
  const EditWorkshopProfileScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EditWorkshopProfileCubit>();
    cubit.getWorkshopData(id.toString());
    return BlocConsumer<EditWorkshopProfileCubit, EditWorkshopProfileState>(
      listener: (context, state) {
        if (state is EditWorkshopProfilSuccessState) {
          showSuccessToast(message: "Updated Successfully");
          context.push(Routes.navbar);
        } else if (state is EditWorkshopProfileFailureState) {
          showErrorToast(message: state.message);
        }
      },
      builder: (context, state) {
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
          body: state is LoadingWorkshopDataState
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 24),
                          child: Column(
                            children: [
                              const CustomEditWorkshopImages(),
                              height(24),
                              const CustomEditWorkshopInformationFileds(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    CustomContainerButton(
                      text: "حفظ",
                      onPressed: () {
                        cubit.editWorkshop(
                          id.toString(),
                          lat: location.currentPosition!.latitude.toString(),
                          long: location.currentPosition!.longitude.toString(),
                        );
                      },
                    )
                  ],
                ),
        );
      },
    );
  }
}
