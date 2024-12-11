import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workshopmanager/Core/utils/app_colors.dart';

import '../utils/app_imgaes.dart';

List<Widget> icons = [
  SvgPicture.asset(AppImages.userAccount),
  SvgPicture.asset(AppImages.addManager),
  SvgPicture.asset(AppImages.managerSetting),
  SvgPicture.asset(AppImages.managerSettingP),
  const Icon(Icons.call, color: AppColors.primary)
];
