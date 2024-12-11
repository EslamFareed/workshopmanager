import 'package:flutter/material.dart';
import 'package:workshopmanager/Core/utils/app_imgaes.dart';

class CustomLoaderWidget extends StatelessWidget {
  const CustomLoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AppImages.loading,
        width: 300,
        height: 300,
      ),
    );
  }
}
