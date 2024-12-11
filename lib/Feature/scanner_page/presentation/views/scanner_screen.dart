import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:workshopmanager/Core/func/show_toast.dart';
import 'package:workshopmanager/Core/utils/app_colors.dart';
import 'package:workshopmanager/Core/widget/custom_app_text.dart';
import 'package:workshopmanager/Core/widget/custom_arrow_back.dart';
import 'package:workshopmanager/Feature/location_on_map/presentation/cubit/location_on_map_cubit.dart';
import 'package:workshopmanager/Feature/scanner_page/presentation/cubit/scanner_cubit.dart';
import 'package:workshopmanager/di.dart';

import '../../../../Core/app/routes.dart';
import '../../../../Core/constant/app_sized.dart';

class ScannerScreen extends StatelessWidget {
  final int id;
  const ScannerScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScannerCubit(getIt()),
      child: BlocConsumer<ScannerCubit, ScannerState>(
        listener: (context, state) {
          if (state is QrViewingState) {
            context.read<ScannerCubit>().scanner(
                  state.id,
                  lat: context
                      .read<LocationOnMapCubit>()
                      .currentPosition!
                      .latitude
                      .toString(),
                  lng: context
                      .read<LocationOnMapCubit>()
                      .currentPosition!
                      .longitude
                      .toString(),
                );
          } else if (state is ScannerSuccessState) {
            showToast(message: "Change Order Status Successfully");
            context.pushReplacement(Routes.done);
          } else if (state is ScannerFailureState) {
            showToast(message: state.message);
          }
        },
        builder: (context, state) {
          final cubit = context.read<ScannerCubit>();
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomArrowBack(),
                      const CustomAppText(
                        text: "رمز الاستجابة",
                        size: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      width(0),
                    ],
                  ),
                  height(24),
                  Expanded(
                    flex: 5,
                    child: QRView(
                      key: cubit.qrKey,

                      onQRViewCreated: cubit.onQRViewCreated,
                      overlay: QrScannerOverlayShape(
                        borderColor: AppColors.primary,
                        borderRadius: 10,
                        borderLength: 30,
                        borderWidth: 10,
                        cutOutSize: 300,
                      ),
                      // formatsAllowed: QRCodeFormats.all,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
