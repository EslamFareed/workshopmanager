import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../data/model/managers_account_employer_user.dart';
import '../../domain/repos/managers_account_repo.dart';

part 'managers_accounts_state.dart';

class ManagersAccountsCubit extends Cubit<ManagersAccountsState> {
  final ManagersAccountRepo repo;
  ManagersAccountsCubit(this.repo) : super(ManagersAccountsInitial());

  ValueNotifier<bool>? controller;

  Future<void> managers() async {
    emit(ManagersAccountsLoadingState());

    final result = await repo.getAllEmployer();
    result.fold(
      (failure) {
        emit(ManagersAccountsFailureState(failure.message));
      },
      (managers) async {
        emit(ManagersAccountsSuccessState(managers));
      },
    );
  }

  Future<void> deleteEmployer(String id) async {
    final List<ManagersAccountEmployerUser> managers =
        (state as ManagersAccountsSuccessState).managers;

    final response = await repo.deleteEmployer(id);
    response.fold((failure) {
      emit(DeleteEmployerFailureState(managers, message: failure.message));
    }, (successMessage) {
      emit(DeleteEmployerSuccessState(managers, message: successMessage));
    });
  }

  Future<void> activeEmployer(String id) async {
    final List<ManagersAccountEmployerUser> managers =
        (state as ManagersAccountsSuccessState).managers;
    final result = await repo.activeEmployer(
      id,
      method: "PUT",
    );
    result.fold((failure) {
      emit(ActiveEmployerFailureState(managers, message: failure.message));
    }, (employer) {
      emit(ActiveEmployerSuccessState(managers, employer));
    });
  }
}
