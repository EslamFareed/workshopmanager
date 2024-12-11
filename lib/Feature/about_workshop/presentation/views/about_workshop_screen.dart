import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshopmanager/Feature/about_workshop/presentation/cubit/about_workshop_cubit.dart';
import 'package:workshopmanager/Feature/about_workshop/presentation/widgets/custom_gallary_workshop_view.dart';
import 'package:workshopmanager/Feature/about_workshop/presentation/widgets/custom_image_stack.dart';
import 'package:workshopmanager/di.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widget/custom_loader_widget.dart';
import '../widgets/custom_about_workshop_view.dart';
import '../widgets/custom_image_list_view_body.dart';
import '../widgets/custom_list_service_list_view_body.dart';
import '../widgets/custom_workshop_rating_view.dart';
import '../widgets/custom_workshop_row_data_widget.dart';

class AboutWorkshopScreen extends StatelessWidget {
  final int id;
  const AboutWorkshopScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AboutWorkshopCubit(getIt())..showWorkshop(id.toString()),
      child: BlocBuilder<AboutWorkshopCubit, AboutWorkshopState>(
        builder: (context, state) {
          //  final cubit = context.read<AboutWorkshopCubit>();
          return Scaffold(
            body: state is AboutWorkshopSuccessState
                ? DefaultTabController(
                    length: 4,
                    initialIndex: 3,
                    child: Scaffold(
                      body: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageStack(
                              logo: state.workshop.logo ??
                                  "https://via.placeholder.com/200x200",
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    ...List.generate(
                                      state.workshop.images!.length,
                                      (index) => CustomImageListViewBody(
                                        pic: state.workshop.images![index],
                                      ),
                                    )
                                  ],
                                ),
                              )),
                          CustomWorkshopRowDataWidget(
                            rating: state.workshop.starRatingAvg.toString(),
                            reviewCount:
                                state.workshop.reviews!.length.toString(),
                            category:
                                state.workshop.services!.first.enName ?? "",
                            workshopName: state.workshop.name!,
                            location: state.workshop.government!.arName!,
                            district: state.workshop.center!.arName!,
                          ),
                          const TabBar(
                            tabs: [
                              Tab(text: "عن الشركة"),
                              Tab(text: "الصور"),
                              Tab(text: "التقييمات"),
                              Tab(text: "الخدمات"),
                            ],
                            labelStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            labelColor: AppColors.primary,
                            unselectedLabelColor: AppColors.grey9,
                            indicatorColor: AppColors.primary,
                            indicatorWeight: 3,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: TabBarView(
                                children: [
                                  CustomAboutWorkshopView(
                                    description: state.workshop.arDescription!,
                                  ),
                                  CustomGallaryWorkshopView(
                                    pics: state.workshop.images!,
                                  ),
                                  CustomWorkshopRatingView(
                                      reviews: state.workshop.reviews
                                      // name: "عبدالرحمن محمد",
                                      // maintainType: "تعميم",
                                      // pic: "https://picsum.photos/200",
                                      // date: "12/12/2022",
                                      // review: "خدمة سريعة وجيدة",
                                      ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: state.workshop.services!.length,
                                    itemBuilder: (context, index) {
                                      return CustomListServiceListViewBody(
                                        pic: state.workshop.services![index]
                                            .serviceImage!,
                                        title: state
                                            .workshop.services![index].enName!,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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
