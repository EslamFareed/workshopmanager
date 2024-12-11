import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshopmanager/Core/extensions/extensions.dart';
import 'package:workshopmanager/Core/utils/app_colors.dart';
import 'package:workshopmanager/Core/widget/custom_app_text.dart';
import '../../../../Core/constant/app_sized.dart';
import '../cubit/workshop_working_time_cubit.dart';

class CustomWorkshopWorkingTimeListBody extends StatelessWidget {
  final String dayName;
  final Function()? onTapfirstFunction;
  final String fromTime;
  final Function()? onTapsecondFunction;
  final String toTime;
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomWorkshopWorkingTimeListBody({
    super.key,
    required this.dayName,
    this.onTapfirstFunction,
    required this.fromTime,
    this.onTapsecondFunction,
    required this.toTime,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkshopWorkingTimeCubit, WorkshopWorkingTimeState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //! Day name
                Expanded(
                  flex: 3,
                  child: CustomAppText(
                    text: dayName,
                    size: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                //! Work hours
                Expanded(
                  flex: 4,
                  child: Row(
                    children: [
                      Flexible(
                        child: GestureDetector(
                          onTap: onTapfirstFunction,
                          child: FittedBox(
                            child: CustomAppText(
                              text: fromTime,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      width(16),
                      Flexible(
                        child: InkWell(
                          onTap: onTapsecondFunction,
                          child: FittedBox(
                            child: CustomAppText(
                              text: toTime,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                width(16),
                //! Status switch
                Expanded(
                  flex: 2,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 70,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: value ? AppColors.greyD9 : AppColors.grey9,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Row(
                      mainAxisAlignment: value
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: FittedBox(
                            child: CustomAppText(
                              text: value ? 'تفعيل' : 'معطل',
                            ),
                          ),
                        ),
                        width(12),
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                value ? AppColors.primary : AppColors.black13,
                          ),
                        ),
                      ],
                    ),
                  ).onTap(() {
                    onChanged(!value);
                  }),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
