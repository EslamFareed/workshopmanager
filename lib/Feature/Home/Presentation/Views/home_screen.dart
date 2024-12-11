import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:workshopmanager/Core/app/routes.dart';
import 'package:workshopmanager/Core/constant/constant.dart';
import 'package:workshopmanager/Core/extensions/extensions.dart';
import 'package:workshopmanager/Core/func/show_toast.dart';
import 'package:workshopmanager/Core/utils/app_colors.dart';
import 'package:workshopmanager/Core/utils/app_imgaes.dart';
import 'package:workshopmanager/Core/widget/custom_app_text.dart';
import 'package:workshopmanager/Feature/Home/Presentation/cubit/home_cubit.dart';
import 'package:workshopmanager/Feature/Home/Presentation/widget/custom_workshops_list_view_body.dart';
import 'package:workshopmanager/di.dart';

import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/widget/custom_app_bar.dart';
import '../../../../Core/widget/custom_loader_widget.dart';
import '../widget/custom_home_drawer.dart';
import '../widget/custom_row_search_bar_and_filter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(getIt())..workshops(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is DeletedSuccessState) {
            showToast(message: state.deletedSuccess);
            context.read<HomeCubit>().workshops();
          } else if (state is DeleteFailureState) {
            showToast(message: state.failureMessage);
          }
        },
        builder: (context, state) {
          final cubit = context.read<HomeCubit>();
          return Scaffold(
            appBar: appBar(
              color: AppColors.primary,
              title: "اختار المراكز ",
              leading: Builder(
                builder: (context) {
                  return IconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: AppColors.white,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  );
                },
              ),
            ),
            drawer: const CustomHomeDrawer(),
            body: state is HomeGetWorkshopsSuccessState
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(AppImages.shahmWord),
                            width(16),
                            Image.asset(AppImages.shahm, height: 50, width: 50),
                          ],
                        ),
                        height(16),
                        CustomRowSearchBarAndFilter(
                          svgColor: AppColors.primary,
                          searchController: cubit.searchController,
                          onSearchChanged: (qa) {
                            cubit.searchWorkshops(qa);
                          },
                        ),
                        height(32),
                        const CustomAppText(
                          text: "اختار المراكز ",
                          fontWeight: FontWeight.w700,
                        ),
                        height(4),
                        cubit.filteredWorkshops.isEmpty
                            ? DottedBorder(
                                color: AppColors.primary,
                                padding: const EdgeInsets.all(20),
                                radius: const Radius.circular(12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const CustomAppText(
                                      text: "اضف مركز",
                                      size: 18,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.primary,
                                    ),
                                    width(8),
                                    SvgPicture.asset(AppImages.add)
                                  ],
                                ).onTap(
                                  () {
                                    context.push(Routes.addWorkShop);
                                  },
                                ),
                              )
                            : Expanded(
                                child: ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return CustomWorkshopsListViewBody(
                                      image:
                                          cubit.filteredWorkshops[index].logo ??
                                              image,
                                      workshopName:
                                          cubit.filteredWorkshops[index].name!,
                                      govesName: cubit.filteredWorkshops[index]
                                          .government!.arName!,
                                      districtName: cubit
                                          .filteredWorkshops[index]
                                          .center!
                                          .arName!,
                                      orderNumber: cubit
                                          .filteredWorkshops[index].orderCount
                                          .toString(),
                                      onTap: () {
                                        cubit.deleteWorkshop(
                                          cubit.filteredWorkshops[index].id
                                              .toString(),
                                        );
                                      },
                                      aboutworkshopOnPressed: () {
                                        context.pushNamed(Routes.aboutWorkshop,
                                            pathParameters: {
                                              "id": cubit
                                                  .filteredWorkshops[index].id
                                                  .toString(),
                                            });
                                      },
                                      ordersOnPressed: () {
                                        context.pushNamed(Routes.workshopOrders,
                                            pathParameters: {
                                              "id": cubit
                                                  .filteredWorkshops[index].id
                                                  .toString()
                                            });
                                      },
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      height(16),
                                  itemCount: cubit.filteredWorkshops.length,
                                ),
                              ),
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
