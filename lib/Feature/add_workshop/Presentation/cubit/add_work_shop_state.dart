part of 'add_work_shop_cubit.dart';

sealed class AddWorkShopState extends Equatable {
  const AddWorkShopState();

  @override
  List<Object> get props => [];
}

final class AddWorkShopInitial extends AddWorkShopState {}

final class AddWorkShopLoaddingState extends AddWorkShopState {}

final class AddWorkShopSuccessState extends AddWorkShopState {
  final WorkshopModel model;

  const AddWorkShopSuccessState(this.model);
}

final class AddWorkShopFailureState extends AddWorkShopState {
  final String message;

  const AddWorkShopFailureState(this.message);
}

final class ImagePickerSuccessState extends AddWorkShopState {
  final File logo;

  const ImagePickerSuccessState(this.logo);
}

final class ImagePickerListSuccessState extends AddWorkShopState {
  final List<File> images;

  const ImagePickerListSuccessState(this.images);
}
