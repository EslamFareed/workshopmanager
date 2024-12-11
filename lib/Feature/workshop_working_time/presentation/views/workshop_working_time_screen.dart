import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workshopmanager/Core/widget/custom_app_button.dart';
import 'package:workshopmanager/Core/widget/custom_arrow_back.dart';
import 'package:workshopmanager/Feature/EditWorkshopProfile/presentation/cubit/edit_workshop_profile_cubit.dart';
import 'package:workshopmanager/Feature/EditWorkshopProfile/presentation/models/workshop_data_model.dart';
import 'package:workshopmanager/Feature/workshop_working_time/presentation/cubit/workshop_working_time_cubit.dart';
import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/widget/custom_app_text.dart';
import '../widget/custom_workshop_working_time_list_view_body.dart';

class WorkshopWorkingTimeScreen extends StatelessWidget {
  WorkshopWorkingTimeScreen({super.key, required this.fromEdit});

  final bool fromEdit;
  List<WorkingHours> workingdays = [];
  @override
  Widget build(BuildContext context) {
    if (fromEdit) {
      final editCubit = context.read<EditWorkshopProfileCubit>();
      workingdays = editCubit.data?.workingHours ?? [];
    }
    return BlocProvider(
      create: (context) => WorkshopWorkingTimeCubit()..start(workingdays),
      child: BlocBuilder<WorkshopWorkingTimeCubit, WorkshopWorkingTimeState>(
        builder: (context, state) {
          final cubit = context.read<WorkshopWorkingTimeCubit>();
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 35),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomArrowBack(),
                    const CustomAppText(
                      text: "ايام العمل",
                      fontWeight: FontWeight.w700,
                      size: 18,
                    ),
                    width(1)
                  ],
                ),
                height(32),
                const CustomAppText(
                  text: "اضف مواعيد العمل الاسبوعية",
                  fontWeight: FontWeight.w700,
                  size: 18,
                ),
                height(24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomAppText(text: "ايام العمل"),
                    width(1),
                    const CustomAppText(text: "ساعات العمل"),
                    width(1),
                    const CustomAppText(text: "الحالة"),
                    width(1),
                  ],
                ),
                height(16),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => height(8),
                    padding: EdgeInsets.zero,
                    itemCount: cubit.days.length,
                    itemBuilder: (context, index) {
                      return CustomWorkshopWorkingTimeListBody(
                        dayName: cubit.days[index],
                        fromTime: cubit.fromTimes[index].format(context),
                        onTapfirstFunction: () =>
                            cubit.selectTime(context, index, true),
                        onTapsecondFunction: () {
                          cubit.selectTime(context, index, false);
                        },
                        toTime: cubit.toTimes[index].format(context),
                        value: cubit.isDayActive[index],
                        onChanged: (val) {
                          cubit.changeValue(val, index);
                        },
                      );
                    },
                  ),
                ),

                //! Save button
                CustomAppButton(
                  text: "حفظ",
                  radius: 24,
                  width: double.maxFinite,
                  onPressed: () {
                    context.pop();
                  },
                ),
                height(16),
              ]),
            ),
          );
        },
      ),
    );
  }
}
