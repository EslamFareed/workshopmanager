import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:workshopmanager/Feature/about_workshop/data/model/about_workshop_model.dart';
import 'package:workshopmanager/Feature/about_workshop/domain/repo/about_workshop_repo.dart';

part 'about_workshop_state.dart';

class AboutWorkshopCubit extends Cubit<AboutWorkshopState> {
  final AboutWorkshopRepo repo;
  AboutWorkshopCubit(this.repo) : super(AboutWorkshopInitial());
  // final List<bool> selectedServices = [];
  Future<void> showWorkshop(String id) async {
    emit(AboutWorkshopLoadingState());
    final response = await repo.showWorkshop(id);
    response.fold((failure) {
      emit(AboutWorkshopFailureState(failure.message));
    }, (workshop) {
      emit(AboutWorkshopSuccessState(workshop));
    });
  }
}
