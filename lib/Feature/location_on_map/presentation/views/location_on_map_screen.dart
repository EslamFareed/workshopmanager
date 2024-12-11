import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:workshopmanager/Core/extensions/extensions.dart';
import 'package:workshopmanager/Core/widget/custom_app_text.dart';
import 'package:workshopmanager/Feature/location_on_map/presentation/cubit/location_on_map_cubit.dart';

import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widget/custom_arrow_back.dart';
import '../../../../Core/widget/custom_seach_bar.dart';

class LocationOnMapScreen extends StatelessWidget {
  const LocationOnMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationOnMapCubit, LocationOnMapState>(
      builder: (context, state) {
        final cubit = context.read<LocationOnMapCubit>();
        return Scaffold(
          body: Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    cubit.currentPosition!.latitude,
                    cubit.currentPosition!.longitude,
                  ),
                  zoom: 15,
                ),
                onMapCreated: (GoogleMapController controller) =>
                    cubit.mapController,
                mapType: MapType.terrain,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
              ),
              Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 24),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CustomArrowBack(),
                              const CustomAppText(
                                text: "موقعك علي الخريطة",
                                size: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white,
                              ),
                              width(1),
                            ],
                          ),
                          height(32),
                          CustomSearchBar(
                            onSearchChanged: (q) {
                              // cubit.searchLocationData(
                              //   cubit.searchController.text,
                              //   context,
                              // );
                            },
                            hintText: cubit.locationString,
                            //searchController: cubit.searchController,
                          ).onTap(() {
                            // cubit.searchLocationData(
                            //     cubit.searchController.text, context);
                          }),
                        ],
                      ),
                    ),
                  ),
                  // WhiteContainer(
                  //   widget: DefaultButton(
                  //     width: double.maxFinite,
                  //     title: "تاكيد",
                  //     onPressed: () {
                  //       context.push(Routes.filteration);
                  //     },
                  //   ),
                  // ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
