import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:workshopmanager/Core/constant/app_shared_pref_keys.dart';
import 'package:workshopmanager/Core/service/shared_pref.dart';
import 'package:workshopmanager/Feature/add_workshop/data/model/workshop_model.dart';
import 'package:workshopmanager/Feature/add_workshop/domain/respo/add_workshop_repo.dart';
import 'package:workshopmanager/Feature/workshop_working_time/presentation/cubit/workshop_working_time_cubit.dart';
part 'add_work_shop_state.dart';

class AddWorkShopCubit extends Cubit<AddWorkShopState> {
  final AddWorkshopRepo repo;
  final WorkshopWorkingTimeCubit cubit;
  AddWorkShopCubit(this.repo, this.cubit) : super(AddWorkShopInitial());

//! Controllers
  TextEditingController workshopNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneOneController = TextEditingController();
  TextEditingController phonetwoController = TextEditingController();
  TextEditingController arDescritptionController = TextEditingController();
  TextEditingController enDescritptionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  //! Picker
  ImagePicker picker = ImagePicker();
  File? logo;
  List<File>? selectedFiles = [];

  Future<void> pickImages() async {
    try {
      final pickedFiles = await picker.pickMultiImage();

      selectedFiles!.addAll(pickedFiles.map((e) => File(e.path)).toList());

      emit(ImagePickerListSuccessState(selectedFiles!));
    } catch (e) {
      rethrow;
    }
  }

  String capacityNumber = "القدرة الاستيعابية ";

  Future<void> addWorkshop({
    required String lat,
    required String long,
  }) async {
    final gove = await SharedPref().get(AppSharedPrefrencesKeys.goves);
    final district = await SharedPref().get(AppSharedPrefrencesKeys.distric);
    List<dynamic> brand =
        await SharedPref().getList(AppSharedPrefrencesKeys.brand);

    emit(AddWorkShopLoaddingState());

    final result = await repo.addWorkshop(
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
      images: [logo!],
      days: cubit.getFormattedDays(),
    );
    result.fold((failure) {
      emit(
        AddWorkShopFailureState(failure.message),
      );
    }, (result) {
      emit(
        AddWorkShopSuccessState(result),
      );
    });
  }

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
}
