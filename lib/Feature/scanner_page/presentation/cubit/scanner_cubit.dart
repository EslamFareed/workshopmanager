import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:workshopmanager/Feature/scanner_page/domain/change_order_status_repo.dart';
part 'scanner_state.dart';

class ScannerCubit extends Cubit<ScannerState> {
  final ChangeOrderStatusRepo _repo;
  ScannerCubit(this._repo) : super(ScannerInitial());

  void reassembleCamera() {
    if (controller != null) {
      controller!.pauseCamera();
      controller!.resumeCamera();
    }
  }

  Future<void> scanner(String id,
      {required String lat, required String lng}) async {
    emit(ScannerLoadingState());
    final response = await _repo.changeOrderStatus(
      id,
      status: "working",
      lat: lat,
      lng: lng,
      method: "PUT",
    );
    log("lat is $lat long is $lng");
    response.fold(
      (failure) => emit(ScannerFailureState(failure.message)),
      (r) {
        emit(ScannerSuccessState());
        controller?.dispose();
      },
    );
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      result = scanData;
      log('QR Code Scanned: ${scanData.code}');
      emit(QrViewingState(scanData.code!));
    });
  }

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? result;

  @override
  Future<void> close() {
    controller?.dispose();
    return super.close();
  }
}
