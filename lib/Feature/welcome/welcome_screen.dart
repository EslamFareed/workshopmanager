import 'package:flutter/material.dart';
import 'package:workshopmanager/Core/utils/app_colors.dart';
import 'package:go_router/go_router.dart';

import '../../Core/app/routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * .3,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/welcome_background.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * .7,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 8,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/new_logo_word.png",
                        width: 70,
                      ),
                      // LanguageSelectionMenu(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: MediaQuery.sizeOf(context).height * .1,
                    width: MediaQuery.sizeOf(context).width,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "مرحبا بك في",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "تطبيق خدمة الصيانة",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  // Image.asset("assets/images/new_logo_welcome.png"),
                  Spacer(),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: MediaQuery.sizeOf(context).height * .06,
                    width: MediaQuery.sizeOf(context).width,
                    child: ElevatedButton(
                      onPressed: () {
                        context.pushReplacement(Routes.register);
                        // NavigationHelper.goOff(CreateAccountScreen(), context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: const Text(
                        "إنشاء حساب",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * .03),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: MediaQuery.sizeOf(context).height * .06,
                    width: MediaQuery.sizeOf(context).width,
                    child: ElevatedButton(
                      onPressed: () {
                        context.pushReplacement(Routes.login);

                        // NavigationHelper.goOff(LoginScreen(), context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: AppColors.primary),
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: const Text(
                        "تسجيل دخول",
                        style:
                            TextStyle(fontSize: 15, color: AppColors.primary),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * .03),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
