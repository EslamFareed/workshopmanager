import 'package:fluttertoast/fluttertoast.dart';

import '../utils/app_colors.dart';

// void showToast({
//   required String message,
// }) {
//   Fluttertoast.showToast(
//     fontSize: 16,
//     toastLength: Toast.LENGTH_LONG,
//     msg: message,
//     backgroundColor: AppColors.primary,
//   );
// }

void showErrorToast({
  required String message,
}) {
  Fluttertoast.showToast(
    fontSize: 16,
    toastLength: Toast.LENGTH_LONG,
    msg: message,
    backgroundColor: AppColors.redED,
  );
}

void showSuccessToast({
  required String message,
}) {
  Fluttertoast.showToast(
    fontSize: 16,
    toastLength: Toast.LENGTH_LONG,
    msg: message,
    backgroundColor: AppColors.primary,
  );
}
