import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workshopmanager/Core/utils/app_colors.dart';
import 'package:workshopmanager/Feature/Auth/Login/presentation/cubit/login_cubit.dart';
import '../../../../../Core/constant/app_sized.dart';
import '../../../../../Core/utils/app_imgaes.dart';
import '../../../../../Core/widget/custom_app_text.dart';

class CustomFingerPrinterContainer extends StatelessWidget {
  const CustomFingerPrinterContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final cubit = context.read<LoginCubit>();
        return GestureDetector(
          onTap: () {
            cubit.fingerprint();
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                SvgPicture.asset(AppImages.lockSVG),
                width(4),
                const CustomAppText(
                  text: "تسجيل دخول ببصمة الاصبع او معرف الوجه",
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
