import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workshopmanager/Core/app/routes.dart';
import 'package:workshopmanager/Core/utils/app_colors.dart';
import 'package:workshopmanager/Core/widget/custom_app_button.dart';
import 'package:workshopmanager/Feature/Auth/register/presentation/cubit/register_cubit.dart';
import 'package:workshopmanager/di.dart';
import '../../../../../Core/constant/app_sized.dart';
import '../../../../../Core/func/show_toast.dart';
import '../../../../../Core/widget/custom_loader_widget.dart';
import '../widget/custom_auth_row_text.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(getIt()),
      child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
        if (state is RegisterLoadingState) {
          const CustomLoaderWidget();
        } else if (state is RegisterSuccessState) {
          showSuccessToast(message: "SignUp Successfully");
          context.push(Routes.navbar);
        } else if (state is RegisterFailureState) {
          showErrorToast(message: state.message);
        }
      }, builder: (context, state) {
        final cubit = context.read<RegisterCubit>();
        return SafeArea(
          top: false,
          child: Scaffold(
            body: Stepper(
              connectorColor: const WidgetStatePropertyAll(AppColors.primary),
              controlsBuilder: (context, details) {
                return Column(
                  children: [
                    CustomAppButton(
                      radius: 24,
                      width: double.infinity,
                      text: cubit.currentStep ==
                              cubit.steperCounter(context).length - 1
                          ? "انهاء"
                          : "التالى",
                      onPressed: () {
                        if (cubit.currentStep ==
                            cubit.steperCounter(context).length - 1) {
                          cubit.finishStep2(context);
                        } else {
                          cubit.finishStep1(context);
                        }
                      },
                    ),
                    height(8),
                    CustomAuthTextAccount(
                      haveAccount: "هل لديك حساب؟ ",
                      textAuth: "تسجيل الدخول",
                      onTap: () {
                        context.push(Routes.login);
                      },
                    )
                  ],
                );
              },
              onStepTapped: (step) {
                cubit.changePage(step);
              },
              elevation: 0,
              connectorThickness: 2,
              type: StepperType.horizontal,
              currentStep: cubit.currentStep,
              onStepContinue: () {
                cubit.pageIncrement();
              },
              onStepCancel: () {
                cubit.pageDecrement();
              },
              steps: cubit.steperCounter(context),
            ),
          ),
        );
      }),
    );
  }
}
