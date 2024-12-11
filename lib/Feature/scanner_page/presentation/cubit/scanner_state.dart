part of 'scanner_cubit.dart';

sealed class ScannerState extends Equatable {
  const ScannerState();

  @override
  List<Object> get props => [];
}

final class ScannerInitial extends ScannerState {}

final class ScannerLoadingState extends ScannerState {}

final class ScannerSuccessState extends ScannerState {}

final class ScannerFailureState extends ScannerState {
  final String message;

  const ScannerFailureState(this.message);
}

final class QrViewingState extends ScannerState {
  final String id;

  const QrViewingState(this.id);
}
