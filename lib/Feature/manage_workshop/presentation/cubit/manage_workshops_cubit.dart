import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:workshopmanager/Feature/manage_workshop/domain/repo/manage_workshops_repo.dart';

part 'manage_workshops_state.dart';

class ManageWorkshopsCubit extends Cubit<ManageWorkshopsState> {
  final ManageWorkshopsRepo repo;
  ManageWorkshopsCubit(this.repo) : super(ManageWorkshopsInitial());

  final value = ValueNotifier<bool>(false);
  Future<void> activeWorkshops(
    String id, {
    required dynamic value,
  }) async {
    emit(ManageWorkshopsLoadingState());
    final result = await repo.activeWorkshops(id, method: "PUT");
    result.fold(
      (failure) => emit(ManageWorkshopsFailureState(failure.message)),
      (message) => emit(ManageWorkshopsSuccessState(message)),
    );
  }
}
