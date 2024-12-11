import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:workshopmanager/Core/constant/app_shared_pref_keys.dart';
import 'package:workshopmanager/Feature/EditWorkshopProfile/domain/repo/edit_workshop_profile_repo.dart';
import 'package:workshopmanager/Feature/EditWorkshopProfile/presentation/models/workshop_data_model.dart';
import '../../../../Core/constant/end_points.dart';
import '../../../../Core/service/shared_pref.dart';
import '../../../../di.dart';
import '../../../workshop_working_time/presentation/cubit/workshop_working_time_cubit.dart';

part 'edit_workshop_profile_state.dart';

class EditWorkshopProfileCubit extends Cubit<EditWorkshopProfileState> {
  final EditWorkshopProfileRepo repo;
  final WorkshopWorkingTimeCubit cubit;

  EditWorkshopProfileCubit(this.repo, this.cubit)
      : super(EditWorkshopProfileInitial());

  // static EditWorkshopProfileCubit get(context) => BlocProvider.of(context);

  ImagePicker picker = ImagePicker();
  File? logo;
  String capacityNumber = "القدرة الاستيعابية ";

  //! Controllers
  TextEditingController workshopNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneOneController = TextEditingController();
  TextEditingController phonetwoController = TextEditingController();
  TextEditingController arDescritptionController = TextEditingController();
  TextEditingController enDescritptionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  //! Image Picker
  Future<void> logoPicker(ImageSource source) async {
    try {
      final pick = await picker.pickImage(source: source);
      if (pick != null) {
        logo = File(pick.path);
        emit(ImagePickerSuccessState(logo!));
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> editWorkshop(
    String id, {
    required String lat,
    required String long,
  }) async {
    final gove = await SharedPref().get(AppSharedPrefrencesKeys.goves);
    final district = await SharedPref().get(AppSharedPrefrencesKeys.distric);
    List<dynamic> brand =
        await SharedPref().getList(AppSharedPrefrencesKeys.brand);
    emit(EditWorkshopProfileLoadingState());
    final result = await repo.editWorkshop(
      id,
      logo: logo!,
      name: workshopNameController.text,
      address: addressController.text,
      geoLat: lat,
      geolng: long,
      phone: phoneOneController.text,
      arDescritption: arDescritptionController.text,
      enDescritption: enDescritptionController.text,
      capacity: capacityNumber,
      govesId: gove!,
      districId: district!,
      brands: brand,
      days: cubit.getFormattedDays(),
      method: "PUT",
    );
    result.fold(
        (failure) => emit(EditWorkshopProfileFailureState(failure.message)),
        (success) => emit(EditWorkshopProfilSuccessState()));
  }

  WorkshopProfileModel? data;
  void getWorkshopData(String id) async {
    emit(LoadingWorkshopDataState());
    try {
      var response = await Dio(BaseOptions(headers: {
        "Authorization":
            "Bearer ${preferences.getString(AppSharedPrefrencesKeys.tokenKey)}"
      })).get("${EndPoints.baseUrl}workshop-manager/workshops/show/$id");

      if (response.statusCode == 200 && response.data["success"] == true) {
        data = WorkshopProfileModel.fromJson(response.data["data"]);
        workshopNameController.text = data!.name!;
        addressController.text = data!.address!;
        phoneOneController.text = data!.phone1!;
        phonetwoController.text = data!.phone1!;
        arDescritptionController.text = data!.arDescription!;
        enDescritptionController.text = data!.enDescription!;
        emit(SuccessWorkshopDataState());
      } else {
        emit(ErrorWorkshopDataState());
      }
    } catch (e) {
      print(e.toString());
      emit(ErrorWorkshopDataState());
    }
  }
}
