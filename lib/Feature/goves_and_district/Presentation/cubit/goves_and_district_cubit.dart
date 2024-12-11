import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:workshopmanager/Feature/goves_and_district/data/models/goves_and_district_childern_model.dart';
import 'package:workshopmanager/Feature/goves_and_district/domain/repo/goves_and_district_repo.dart';
import '../../data/models/goves_and_district_model.dart';

part 'goves_and_district_state.dart';

class GovesAndDistrictCubit extends Cubit<GovesAndDistrictState> {
  final GovesAndDistrictRepo repo;
  GovesAndDistrictCubit(this.repo) : super(GovesAndDistrictInitial());

  String? selectedItem;
  String? districtItem;
  Future<void> goves() async {
    emit(GovesAndDistrictLoadingState());

    final result = await repo.goves();
    result.fold(
      (failure) {
        emit(GovesAndDistrictFailureState(failure.message));
      },
      (service) async {
        emit(GovesAndDistrictSuccessState(model: service));
      },
    );
  }
}
