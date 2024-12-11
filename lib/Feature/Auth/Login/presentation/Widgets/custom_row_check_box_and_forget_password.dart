import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workshopmanager/Core/app/routes.dart';
import 'package:workshopmanager/Core/extensions/extensions.dart';
import 'package:workshopmanager/Feature/Auth/Login/presentation/cubit/login_cubit.dart';
import '../../../../../Core/utils/app_colors.dart';
import '../../../../../Core/widget/custom_app_text.dart';

class CustomRowCheckBoxAndForgetPassword extends StatelessWidget {
  const CustomRowCheckBoxAndForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final cubit = context.read<LoginCubit>();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CustomAppText(
                  text: "تذكرنى",
                ),
                Checkbox(
                  activeColor: AppColors.primary,
                  value: cubit.isChecked,
                  onChanged: (val) {
                    cubit.changeCheckBoxValu(val!);
                  },
                )
              ],
            ),
            const CustomAppText(
              text: "هل نسيت كلمة المرور؟",
              color: AppColors.redED,
            ).onTap(() {
              context.push(Routes.forgetPassword);
            })
          ],
        );
      },
    );
  }
}
