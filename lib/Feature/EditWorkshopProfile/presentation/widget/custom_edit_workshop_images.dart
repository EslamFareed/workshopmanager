import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:workshopmanager/Core/extensions/extensions.dart';
import 'package:workshopmanager/Core/widget/custom_pick_image_diolog.dart';
import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widget/custom_app_text.dart';
import '../cubit/edit_workshop_profile_cubit.dart';

class CustomEditWorkshopImages extends StatelessWidget {
  const CustomEditWorkshopImages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditWorkshopProfileCubit, EditWorkshopProfileState>(
      builder: (context, state) {
        final cubit = context.read<EditWorkshopProfileCubit>();
        return Row(
          children: [
            DottedBorder(
              strokeWidth: 2,
              borderType: BorderType.Circle,
              dashPattern: const [8, 4],
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.greyEE,
                ),
                child: cubit.logo == null
                    ? const Center(
                        child: Icon(
                        Icons.image_outlined,
                        size: 40,
                        color: AppColors.grey9,
                      ))
                    : CircleAvatar(
                        backgroundImage: FileImage(cubit.logo!),
                      ),
              ),
            ),
            width(12),
            const CustomAppText(
              text: "اضف صورة ",
              fontWeight: FontWeight.w500,
            ).onTap(() {
              showImagePickerDialog(
                context,
                cameraOnTap: () {
                  cubit.logoPicker(ImageSource.camera);
                  context.pop();
                },
                galleryOnTap: () {
                  cubit.logoPicker(ImageSource.gallery);
                  context.pop();
                },
                peaperText: "أضف صورة مركز الصيانة",
              );
            })
          ],
        );
      },
    );
  }
}
