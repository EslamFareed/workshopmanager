part of 'show_manager_info_cubit.dart';

sealed class ShowManagerInfoState extends Equatable {
  const ShowManagerInfoState();

  @override
  List<Object> get props => [];
}

final class ShowManagerInfoInitial extends ShowManagerInfoState {}

final class ShowManagerLoadingState extends ShowManagerInfoState {}

final class ShowManagerFailureState extends ShowManagerInfoState {
  final String message;

  const ShowManagerFailureState(this.message);
}

final class ShowManagerSuccessState extends ShowManagerInfoState {
  final ShowManagerInfoModel manager;

  const ShowManagerSuccessState({required this.manager});
}

final class UpdateManagerSuccessState extends ShowManagerSuccessState {
  final ShowManagerInfoModel showmanager;
  @override
  const UpdateManagerSuccessState(this.showmanager, {required super.manager});
}

final class UpdateManagerFailureState extends ShowManagerSuccessState {
  final String message;
  const UpdateManagerFailureState(this.message, {required super.manager});
}
