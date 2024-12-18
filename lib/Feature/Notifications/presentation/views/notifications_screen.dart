import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workshopmanager/Core/constant/app_sized.dart';
import 'package:workshopmanager/Core/extensions/extensions.dart';
import 'package:workshopmanager/Core/func/show_toast.dart';
import 'package:workshopmanager/Core/utils/app_colors.dart';
import 'package:workshopmanager/Core/utils/app_imgaes.dart';
import 'package:workshopmanager/Core/widget/custom_app_text.dart';
import 'package:workshopmanager/Core/widget/custom_arrow_back.dart';
import 'package:workshopmanager/Core/widget/custom_loader_widget.dart';
import 'package:workshopmanager/Feature/Notifications/presentation/cubit/notifications_cubit.dart';
import 'package:workshopmanager/di.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationsCubit(getIt())..notification(),
      child: BlocConsumer<NotificationsCubit, NotificationsState>(
        listener: (context, state) {
          if (state is DeleteNotificationsSuccessState) {
            showSuccessToast(message: state.message);
            context.read<NotificationsCubit>().notification();
          } else if (state is ChangeNotificationsStatusSuccessState) {
            showSuccessToast(message: state.message);
          } else if (state is ChangeNotificationsStatusSuccessState) {
            showSuccessToast(message: state.message);
            context.read<NotificationsCubit>().notification();
          } else if (state is ChangeNotificationsStatusFailureState) {
            showErrorToast(message: state.message);
          }
        },
        builder: (context, state) {
          final cubit = context.read<NotificationsCubit>();
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomArrowBack(),
                      const CustomAppText(
                        text: "الاشعارات",
                        size: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      SvgPicture.asset(AppImages.alram),
                    ],
                  ),
                  height(heightSize(context) * 0.05),
                  state is NotificationsSuccessState
                      ? Expanded(
                          child: ListView.separated(
                            itemBuilder: (context, index) => Dismissible(
                              key: UniqueKey(),
                              onDismissed: (direction) {
                                cubit.deleteNotification(
                                  state.notifications[index].id.toString(),
                                );
                              },
                              background: Container(
                                decoration:
                                    const BoxDecoration(color: AppColors.redED),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: AppColors.greyD9),
                                  color: state.notifications[index].isRead == 1
                                      ? AppColors.white
                                      : AppColors.greyD9,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 70,
                                      width: 10,
                                      decoration: const BoxDecoration(
                                        color: AppColors.green,
                                      ),
                                    ),
                                    width(4),
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: FittedBox(
                                                    child: CustomAppText(
                                                      text: state
                                                          .notifications[index]
                                                          .arTitle!,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ),
                                                width(4),
                                                CustomAppText(
                                                    text:
                                                        "id#${state.notifications[index].id}"),
                                                width(4),
                                                SvgPicture.asset(
                                                  AppImages.alram,
                                                  colorFilter:
                                                      const ColorFilter.mode(
                                                    AppColors.orange,
                                                    BlendMode.srcIn,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            height(8),
                                            CustomAppText(
                                              text: state
                                                  .notifications[index].arBody!,
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ).onTap(() {
                                cubit.changeNotificationStatus(
                                    state.notifications[index].id.toString());
                              }),
                            ),
                            separatorBuilder: (context, index) => height(6),
                            itemCount: state.notifications.length,
                          ),
                        )
                      : const CustomLoaderWidget()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
