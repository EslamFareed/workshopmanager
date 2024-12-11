import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:workshopmanager/Feature/Home/domian/repo/get_home_workshop_repo.dart';

import '../../data/model/home_workshop_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetHomeWorkshopsRepo repo;
  HomeCubit(this.repo) : super(HomeInitial());

  final List<HomeWorkshopModel> _workshop = [];
  final List<HomeWorkshopModel> allWorkshops = [];

  List<HomeWorkshopModel> get workshop => _workshop;

  List<HomeWorkshopModel> filteredWorkshops = [];

  final TextEditingController searchController = TextEditingController();

  void toggleServiceSelection(HomeWorkshopModel workshop) {
    if (filteredWorkshops.contains(workshop)) {
      filteredWorkshops.remove(workshop);
    } else {
      filteredWorkshops.add(workshop);
    }
    emit(HomeGetWorkshopsSuccessState(filteredWorkshops));
  }

  Future<void> workshops() async {
    emit(HomeGetWorkshopsLoadingState());

    final result = await repo.getHomeWorkshops();
    result.fold(
      (failure) {
        emit(HomeGetWorkshopsFailureState(failure.message));
      },
      (workshops) {
        _workshop.addAll(workshops);
        filteredWorkshops = workshops;
        emit(HomeGetWorkshopsSuccessState(workshops));
      },
    );
  }

  void searchWorkshops(String query) {
    if (query.isEmpty) {
      filteredWorkshops = _workshop;
    } else {
      filteredWorkshops = _workshop.where((workshop) {
        final workshopName = workshop.name?.toLowerCase() ?? '';
        final govesName = workshop.government?.arName?.toLowerCase() ?? '';
        final districtName = workshop.center?.arName?.toLowerCase() ?? '';
        final queryLower = query.toLowerCase();
        return workshopName.contains(queryLower) ||
            govesName.contains(queryLower) ||
            districtName.contains(queryLower);
      }).toList();
    }

    emit(HomeGetWorkshopsSuccessState(filteredWorkshops));
  }

  Future<void> deleteWorkshop(String id) async {
    final List<HomeWorkshopModel> workshop =
        (state as HomeGetWorkshopsSuccessState).workhops;

    final response = await repo.deleteWorkshop(id);
    response.fold((failure) {
      emit(DeleteFailureState(workshop, failureMessage: failure.message));
    }, (successMessage) {
      emit(DeletedSuccessState(workshop, deletedSuccess: successMessage));
    });
  }
}
