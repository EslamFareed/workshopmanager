import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:workshopmanager/Feature/workshop_car_brands/data/model/workshop_car_brands_model.dart';
import 'package:workshopmanager/Feature/workshop_car_brands/domian/repo/workshop_car_brand_repo.dart';

part 'workshop_car_brand_state.dart';

class WorkshopCarBrandCubit extends Cubit<WorkshopCarBrandState> {
  final WorkshopCarBrandRepo repo;
  WorkshopCarBrandCubit(this.repo) : super(WorkshopCarBrandInitial());

  String? selectedItem;

  List<String> selectedItems = [];

  void toggleSelection(String itemId) {
    final brands = (state as WorkshopCarBrandSuccessState).model;
    if (selectedItems.contains(itemId)) {
      selectedItems.remove(itemId);
    } else {
      selectedItems.add(itemId);
    }
    emit(WorkshopCarBrandStateUpdated(brands, List.from(selectedItems)));
  }

  Future<void> workshopBrand() async {
    emit(WorkshopCarBrandLoadingState());

    final result = await repo.workshopBrand();
    result.fold(
      (failure) {
        emit(WorkshopCarBrandFailure(failure.message));
      },
      (service) {
        selectedItems.add(service.map((e) => e.id.toString()).join(','));
        emit(WorkshopCarBrandSuccessState(service));
      },
    );
  }
}
