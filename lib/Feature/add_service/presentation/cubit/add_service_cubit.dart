import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:workshopmanager/Core/constant/app_shared_pref_keys.dart';
import 'package:workshopmanager/Core/service/shared_pref.dart';
import 'package:workshopmanager/Feature/add_service/domain/repo/add_service_repo.dart';

part 'add_service_state.dart';

class AddServiceCubit extends Cubit<AddServiceState> {
  final AddServiceRepo repo;
  AddServiceCubit(this.repo) : super(AddServiceInitial());

  final value = ValueNotifier<bool>(false);

  final TextEditingController timeController = TextEditingController();
  final TextEditingController costController = TextEditingController();

  Future<void> addService(String id) async {
    final serviceId = await SharedPref().get(AppSharedPrefrencesKeys.serviceId);
    print("============================$serviceId");
    emit(AddServiceLoadingState());
    final result = await repo.addSerivce(
      id,
      cost: costController.text,
      serviceId: serviceId!,
      time: timeController.text,
      timeType: "hour",
    );
    result.fold((failure) => emit(AddServiceFailureState(failure.message)),
        (success) => emit(AddServiceSuccessState()));
  }

  Future<void> activeService(
    String id, {
    required dynamic val,
  }) async {
    final result = await repo.activeService(id);
    result.fold((failure) => emit(AddServiceFailureState(failure.message)),
        (success) => emit(ActiveServiceSuccessState(success)));
  }
}
