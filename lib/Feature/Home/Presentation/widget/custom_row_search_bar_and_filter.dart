import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workshopmanager/Core/widget/custom_seach_bar.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/utils/app_imgaes.dart';

class CustomRowSearchBarAndFilter extends StatelessWidget {
  final Color svgColor;
  final void Function(String)? onSearchChanged;
  final TextEditingController searchController;
  const CustomRowSearchBarAndFilter(
      {super.key,
      required this.svgColor,
      this.onSearchChanged,
      required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 5,
          child: CustomSearchBar(
            searchController: searchController,
            onSearchChanged: onSearchChanged,
            borderRadius: 8,
            hintText: "بحث",
            prefixIcon: const Icon(
              Icons.search,
              color: AppColors.grey41,
            ),
          ),
        ),
        // Flexible(
        //   child: Container(
        //     height: 44,
        //     padding: const EdgeInsets.all(8),
        //     decoration: const BoxDecoration(
        //       boxShadow: [
        //         BoxShadow(
        //           blurRadius: 4,
        //           color: AppColors.grey66,
        //           offset: Offset(0, 4),
        //         ),
        //         BoxShadow(
        //           blurRadius: 4,
        //           color: AppColors.grey66,
        //           offset: Offset(1, 0),
        //         )
        //       ],
        //       color: AppColors.white,
        //     ),
        //     child: SvgPicture.asset(
        //       AppImages.filter,
        //       colorFilter: ColorFilter.mode(svgColor, BlendMode.srcIn),
        //     ),
        //   ),
        // )
      ],
    );
  }
}
