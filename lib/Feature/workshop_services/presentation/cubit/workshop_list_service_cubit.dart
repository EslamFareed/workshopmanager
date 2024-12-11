import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:workshopmanager/Feature/workshop_services/data/model/workshop_list_service.dart';
import 'package:workshopmanager/Feature/workshop_services/domian/repo/workshop_list_service_repo.dart';
part 'workshop_list_service_state.dart';

class WorkshopListServiceCubit extends Cubit<WorkshopListServiceState> {
  final WorkshopListServiceRepo repo;
  WorkshopListServiceCubit(this.repo) : super(WorkshopListServiceInitial());

  String? selectedItem;
  Future<void> service() async {
    emit(WorkshopListServiceLoadingState());

    final result = await repo.workshopservice();
    result.fold(
      (failure) {
        emit(WorkshopListServiceFailureState(failure.message));
      },
      (service) {
        emit(WorkshopListServiceSuccessState(service));
      },
    );
  }
}
