import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshopmanager/Core/extensions/extensions.dart';
import 'package:workshopmanager/Feature/Auth/register/presentation/cubit/register_cubit.dart';
import '../../../../../Core/utils/app_colors.dart';
import '../../../../../Core/widget/custom_pick_image_diolog.dart';

class CustomAddProfileStack extends StatefulWidget {
  final Widget? personIcon;
  final Color? borderColor;
  final Color? containerColor;
  final Color? iconBorderColor;
  final Color? iconColor;
  final Widget? child;
  File? image;
  final void Function()? cameraOnTap;
  final void Function()? galleryOnTap;
  final String peaperText;
  CustomAddProfileStack({
    super.key,
    this.personIcon,
    this.borderColor,
    this.containerColor,
    this.iconBorderColor,
    this.iconColor,
    this.child,
    required this.peaperText,
    this.image,
    this.cameraOnTap,
    this.galleryOnTap,
  });

  @override
  State<CustomAddProfileStack> createState() => _CustomAddProfileStackState();
}

class _CustomAddProfileStackState extends State<CustomAddProfileStack> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (BuildContext context, RegisterState state) {
        //  final cubit = context.read<RegisterCubit>();
        return Stack(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: widget.containerColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: widget.image == null
                    ? widget.personIcon ??
                        const Icon(
                          Icons.image_outlined,
                          size: 30,
                        )
                    : SizedBox(
                        height: 70,
                        child: Image.file(widget.image!),
                      ),
              ).onTap(() {
                showImagePickerDialog(
                  peaperText: widget.peaperText,
                  cameraOnTap: widget.cameraOnTap,
                  galleryOnTap: widget.galleryOnTap,
                  context,
                );
              }),
            ),
            widget.image == null
                ? const SizedBox()
                : Positioned(
                    top: 15,
                    left: 25,
                    child: const Icon(
                      Icons.highlight_remove_outlined,
                      color: AppColors.redED,
                    ).onTap(() {
                      setState(() {
                        widget.image = null;
                      });
                    }),
                  ),
          ],
        );
      },
    );
  }
}
