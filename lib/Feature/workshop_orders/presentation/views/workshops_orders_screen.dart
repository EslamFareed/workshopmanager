import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workshopmanager/Core/app/routes.dart';
import 'package:workshopmanager/Core/constant/app_sized.dart';
import 'package:workshopmanager/Core/enum/order_status.dart';
import 'package:workshopmanager/Core/extensions/extensions.dart';
import 'package:workshopmanager/Core/utils/app_colors.dart';
import 'package:workshopmanager/Core/widget/custom_app_text.dart';
import 'package:workshopmanager/Core/widget/custom_arrow_back.dart';
import 'package:workshopmanager/Feature/workshop_orders/presentation/cubit/workshop_orders_cubit.dart';
import 'package:workshopmanager/di.dart';

import '../../../../Core/constant/constant.dart';
import '../../../../Core/func/date.dart';
import '../../../../Core/widget/custom_loader_widget.dart';
import '../../../Home/Presentation/widget/custom_row_search_bar_and_filter.dart';
import '../widget/custom_container_list_view_body.dart';
import '../widget/custom_orders_list_view_body.dart';

class WorkshopsOrdersScreen extends StatefulWidget {
  final int id;
  const WorkshopsOrdersScreen({super.key, required this.id});

  @override
  State<WorkshopsOrdersScreen> createState() => _WorkshopsOrdersScreenState();
}

class _WorkshopsOrdersScreenState extends State<WorkshopsOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          WorkshopOrdersCubit(getIt())..getWorkshopOrders(widget.id.toString()),
      child: BlocBuilder<WorkshopOrdersCubit, WorkshopOrdersState>(
        builder: (context, state) {
          final cubit = context.read<WorkshopOrdersCubit>();
          if (state is WorkshopOrdersSuccessState) {
            if (OrderStatus.values[cubit.currentIndex] ==
                OrderStatus.finished) {
              cubit.filteredorders = state.order
                  .where(
                    (order) =>
                        order.status == OrderStatus.completed.name ||
                        order.status == OrderStatus.canceled.name,
                  )
                  .toList();
            } else {
              cubit.filteredorders = state.order
                  .where(
                    (order) =>
                        order.status ==
                        OrderStatus.values[cubit.currentIndex].name,
                  )
                  .toList();
            }
          }
          return Scaffold(
            body: state is WorkshopOrdersSuccessState
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 34),
                    child: Column(
                      children: [
                        Container(
                          decoration:
                              const BoxDecoration(color: AppColors.primary),
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CustomArrowBack(),
                              CustomAppText(
                                text: cubit.currentIndex == 0
                                    ? "طلبات الخدمة الجديدة"
                                    : cubit.currentIndex == 1
                                        ? "طلبات الخدمة قيد التشغيل"
                                        : cubit.currentIndex == 2
                                            ? "طلبات الخدمة المنتهية"
                                            : "",
                                fontWeight: FontWeight.w700,
                                color: AppColors.white,
                                size: 18,
                              ),
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: cubit.currentIndex == 0
                                      ? AppColors.orange
                                      : cubit.currentIndex == 1
                                          ? AppColors.green
                                          : cubit.currentIndex == 2
                                              ? AppColors.grey9C
                                              : Colors.transparent,
                                ),
                              ),
                            ],
                          ),
                        ),
                        height(16),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: CustomRowSearchBarAndFilter(
                            searchController: cubit.searchController,
                            svgColor: AppColors.black,
                            onSearchChanged: (val) {
                              cubit.searchOrders(val);
                            },
                          ),
                        ),
                        height(16),
                        SizedBox(
                          height: 80,
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CustomContainerListViewBody(
                                onTap: () {
                                  setState(() {
                                    cubit.currentIndex = index;

                                    if (cubit.currentIndex == 0) {
                                      cubit.orderList = state.order
                                          .where(
                                            (order) =>
                                                state.order[index].status ==
                                                OrderStatus
                                                    .values[cubit.currentIndex]
                                                    .name,
                                          )
                                          .toList();
                                    }
                                  });
                                },
                                assetName: cubit.vectors[index],
                                title: cubit.title[index],
                                borderColor: cubit.currentIndex == index
                                    ? AppColors.primary
                                    : AppColors.grey9,
                                textColor: cubit.currentIndex == index
                                    ? AppColors.primary
                                    : AppColors.black,
                                svgColor: cubit.currentIndex == index
                                    ? AppColors.primary
                                    : AppColors.grey9,
                              );
                            },
                            itemCount: cubit.title.length,
                          ),
                        ),
                        height(32),
                        Expanded(
                          child: ListView.separated(
                            padding: EdgeInsets.zero,
                            itemCount: cubit.filteredorders.length,
                            separatorBuilder: (context, index) => height(16),
                            itemBuilder: (context, index) {
                              final working = OrderStatus.working.name ==
                                  cubit.filteredorders[index].status;
                              final finished = OrderStatus.finished.name ==
                                  cubit.filteredorders[index].status;
                              return CustomOrdersListViewBody(
                                      calenderColor: working
                                          ? AppColors.green
                                          : finished
                                              ? AppColors.grey9C
                                              : AppColors.orange,
                                      statusColor: working
                                          ? AppColors.green
                                          : finished
                                              ? AppColors.grey9C
                                              : AppColors.orange,
                                      userImage: cubit.filteredorders[index]
                                              .client!.user!.avatar ??
                                          image,
                                      userName: cubit.filteredorders[index]
                                          .client!.user!.name!,
                                      userId: cubit
                                          .filteredorders[index].orderNumber
                                          .toString(),
                                      carLogo: cubit.filteredorders[index].car!
                                              .brand!.logo ??
                                          image,
                                      carName: cubit.filteredorders[index].car!
                                          .brand!.arName!,
                                      date: getDateOnly(cubit
                                          .filteredorders[index].createdAt!),
                                      modelYear: cubit.filteredorders[index]
                                          .car!.modelYear!,
                                      transmissionType: cubit
                                          .filteredorders[index]
                                          .car!
                                          .transmissionType!,
                                      status:
                                          cubit.filteredorders[index].status!)
                                  .onTap(() {
                                context.pushNamed(
                                  Routes.orderDetails,
                                  pathParameters: {
                                    "id": cubit.filteredorders[index].id
                                        .toString(),
                                  },
                                );
                              });
                            },
                          ),
                        )
                      ],
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
