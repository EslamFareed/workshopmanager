import 'package:flutter/material.dart';
import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widget/custom_app_text.dart';
import 'custom_column_car_infromation.dart';
import 'custom_user_information_user_row.dart';

class CustomOrdersListViewBody extends StatelessWidget {
  final String userImage;
  final String userName;
  final String userId;
  final String carLogo;
  final String carName;
  final String date;
  final String transmissionType;
  final String modelYear;
  final String status;
  final Color statusColor;
  final Color calenderColor;
  const CustomOrdersListViewBody({
    super.key,
    required this.userImage,
    required this.userName,
    required this.userId,
    required this.carLogo,
    required this.carName,
    required this.date,
    required this.transmissionType,
    required this.modelYear,
    required this.status,
    required this.statusColor,
    required this.calenderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.primary,
          ),
        ),
        child: Column(
          children: [
            CustomUserInformationUserRow(
              url: userImage,
              text: userName,
              id: userId,
            ),
            CustomColumnCarInfromation(
              calenderColor: calenderColor,
              carLogo: carLogo,
              carName: carName,
              date: date,
              transmissionType: transmissionType,
              modelYear: modelYear,
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: statusColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  width(8),
                  CustomAppText(
                    text: status,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
