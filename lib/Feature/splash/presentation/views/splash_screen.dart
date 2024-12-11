import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workshopmanager/Core/constant/app_sized.dart';
import 'package:workshopmanager/Core/utils/app_imgaes.dart';

import '../../../../Core/app/routes.dart';
import '../../../../Core/constant/app_shared_pref_keys.dart';
import '../../../../Core/service/shared_pref.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final token = await SharedPref().get(AppSharedPrefrencesKeys.tokenKey);
      Future.delayed(const Duration(seconds: 8), () async {
        if (mounted) {
          if (token == null || token == "") {
            context.pushReplacement(Routes.login);
          } else {
            context.pushReplacement(Routes.navbar);
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        AppImages.splash,
        fit: BoxFit.cover,
        width: double.infinity,
        height: heightSize(context),
      ),
    );
  }
}
