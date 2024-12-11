import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:workshopmanager/Feature/Auth/OTP/domain/repos/otp_repo.dart';

import '../../data/model/otp_model.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  final OtpRepo repo;
  OtpCubit(this.repo) : super(OtpInitial());

  String? otpCode;
  Future<void> otp({
    required String phone,
  }) async {
    emit(OtpLoadingstate());
    final result = await repo.otp(
      phone: phone,
      otp: "1234",
    );
    result.fold(
      (left) => emit(OtpFailureState(left.message)),
      (right) => emit(OtpSuccessState(right)),
    );
  }
}
