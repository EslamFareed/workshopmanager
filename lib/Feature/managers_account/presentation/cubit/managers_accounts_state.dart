part of 'managers_accounts_cubit.dart';

sealed class ManagersAccountsState extends Equatable {
  const ManagersAccountsState();

  @override
  List<Object> get props => [];
}

final class ManagersAccountsInitial extends ManagersAccountsState {}

final class ManagersAccountsLoadingState extends ManagersAccountsState {}

final class ManagersAccountsSuccessState extends ManagersAccountsState {
  final List<ManagersAccountEmployerUser> managers;

  const ManagersAccountsSuccessState(this.managers);
}

final class ManagersAccountsFailureState extends ManagersAccountsState {
  final String message;

  const ManagersAccountsFailureState(this.message);
}

final class DeleteEmployerSuccessState extends ManagersAccountsSuccessState {
  final String message;

  const DeleteEmployerSuccessState(super.managers, {required this.message});
}

final class DeleteEmployerFailureState extends ManagersAccountsSuccessState {
  final String message;

  const DeleteEmployerFailureState(super.managers, {required this.message});
}

final class ActiveEmployerFailureState extends ManagersAccountsSuccessState {
  final String message;

  const ActiveEmployerFailureState(super.managers, {required this.message});
}

final class ActiveEmployerSuccessState extends ManagersAccountsSuccessState {
  final String meesage;
  const ActiveEmployerSuccessState(super.managers, this.meesage);
}
