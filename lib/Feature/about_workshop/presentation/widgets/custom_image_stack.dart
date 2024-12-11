import 'package:flutter/material.dart';
import 'package:workshopmanager/Core/utils/app_colors.dart';
import '../../../../Core/widget/custom_arrow_back.dart';

class CustomImageStack extends StatelessWidget {
  final String logo;

  final Widget? child;
  const CustomImageStack({
    super.key,
    required this.logo,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          logo,
          height: MediaQuery.sizeOf(context).height * 0.3,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 30,
          left: 10,
          child: Row(
            children: [
              Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white,
                  ),
                  child: const Icon(Icons.share, color: AppColors.grey9)),
              const SizedBox(width: 8),
              Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white,
                  ),
                  child: const Icon(Icons.bookmark_border,
                      color: AppColors.grey9)),
            ],
          ),
        ),
        const Positioned(top: 30, right: 10, child: CustomArrowBack()),
        Positioned(
          bottom: 10,
          left: 10,
          right: 10,
          child: Container(
            height: MediaQuery.sizeOf(context).height * 0.07,
            padding: const EdgeInsets.all(4.0),
            margin: const EdgeInsets.all(4.0),
            color: AppColors.white,
            child: child,
          ),
        )
      ],
    );
  }
}
