import 'package:flutter/material.dart';

class CustomImageListViewBody extends StatelessWidget {
  final String pic;
  const CustomImageListViewBody({super.key, required this.pic});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Image.network(
          pic,

          fit: BoxFit.fill,
          // width: MediaQuery.sizeOf(context).width *
          //     0.16, // Adjust width for images
        ),
      ),
    );
  }
}
