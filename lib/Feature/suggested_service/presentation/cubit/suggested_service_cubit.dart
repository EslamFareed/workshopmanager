import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:workshopmanager/Feature/suggested_service/data/model/get_service/service_model.dart';
import 'package:workshopmanager/Feature/suggested_service/domain/repo/service_repo.dart';

import '../../data/model/suggested_service/suggested_service_model.dart';

part 'suggested_service_state.dart';

class SuggestedServiceCubit extends Cubit<SuggestedServiceState> {
  final ServiceRepo repo;
  SuggestedServiceCubit(this.repo) : super(SuggestedServiceInitial());

  final List<ServiceModel> _selectedServices = [];

  List<ServiceModel> get selectedServices => _selectedServices;

  void toggleServiceSelection(ServiceModel service) {
    if (_selectedServices.contains(service)) {
      _selectedServices.remove(service);
    } else {
      _selectedServices.add(service);
    }
  }

  Future<void> service(String id) async {
    emit(SuggestedServiceLoadingState());

    final result = await repo.service(id);
    result.fold(
      (failure) {
        emit(SuggestedServiceFailureState(failure.message));
      },
      (service) async {
        emit(SuggestedServiceSuccessState(service: service));
      },
    );
  }

  Future<void> suggestedService({
    required String id,
    required List brandList,
  }) async {
    final List<ServiceModel> suggested =
        (state as SuggestedServiceSuccessState).service;
    final result = await repo.suggestedService(id, brandList: brandList);
    result.fold(
      (failure) => emit(SuggestedFailureState(
        service: suggested,
        errorMessage: failure.message,
      )),
      (result) => emit(
        SuggestedSuccessState(service: suggested, suggestedService: result),
      ),
    );
  }
}
