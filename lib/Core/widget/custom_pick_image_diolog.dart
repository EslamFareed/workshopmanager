import 'package:flutter/material.dart';
import 'package:workshopmanager/Core/extensions/extensions.dart';
import '../constant/app_sized.dart';
import '../utils/app_colors.dart';
import 'custom_app_text.dart';

void showImagePickerDialog(
  BuildContext ctx, {
  required void Function()? cameraOnTap,
  required void Function()? galleryOnTap,
  required String peaperText,
}) {
  showDialog(
    context: ctx,
    builder: (ctx) {
      return Dialog(
        child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            height: heightSize(ctx) * 0.25,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                CustomAppText(
                  text: peaperText,
                  size: 16,
                  color: AppColors.black21,
                ),
                height(32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Icon(
                          Icons.photo_library_outlined,
                          size: 32,
                          color: AppColors.primary,
                        ),
                        height(4),
                        const CustomAppText(
                          text: "المعرض",
                          color: AppColors.grey41,
                        ),
                      ],
                    ).onTap(galleryOnTap),
                    Column(
                      children: [
                        const Icon(
                          Icons.camera_alt_outlined,
                          size: 32,
                          color: AppColors.primary,
                        ),
                        height(4),
                        const CustomAppText(
                          text: "الكاميرا",
                          color: AppColors.grey41,
                        )
                      ],
                    ).onTap(cameraOnTap),
                  ],
                )
              ],
            )),
      );
    },
  );
}
