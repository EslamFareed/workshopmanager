import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workshopmanager/Core/constant/end_points.dart';
import 'package:workshopmanager/Feature/Auth/ForgetPassword/Presentation/cubit/forget_password_cubit.dart';
import 'package:workshopmanager/Feature/Auth/ForgetPassword/data/source/base/forget_password_soruce.dart';
import 'package:workshopmanager/Feature/Auth/ForgetPassword/domain/repos/forget_password_repo.dart';
import 'package:workshopmanager/Feature/Auth/Login/data/repos_impl/login_repo_impl.dart';
import 'package:workshopmanager/Feature/Auth/Login/data/source/login_source.dart';
import 'package:workshopmanager/Feature/Auth/Login/data/source/login_source_impl.dart';
import 'package:workshopmanager/Feature/Auth/Login/domain/repos/login_repo.dart';
import 'package:workshopmanager/Feature/Auth/Login/presentation/cubit/login_cubit.dart';
import 'package:workshopmanager/Feature/Auth/OTP/data/repo/otp_repo_impl.dart';
import 'package:workshopmanager/Feature/Auth/OTP/data/source/base/otp_source.dart';
import 'package:workshopmanager/Feature/Auth/OTP/data/source/impl/otp_source_impl.dart';
import 'package:workshopmanager/Feature/Auth/ResetPassword/Presentation/cubit/resetpassword_cubit.dart';
import 'package:workshopmanager/Feature/Auth/ResetPassword/data/repo/reset_password_repo_impl.dart';
import 'package:workshopmanager/Feature/Auth/ResetPassword/data/source/base/reset_password_source.dart';
import 'package:workshopmanager/Feature/Auth/ResetPassword/data/source/impl/reset_password_source_impl.dart';
import 'package:workshopmanager/Feature/Auth/ResetPassword/domain/repos/reset_password_repo.dart';
import 'package:workshopmanager/Feature/Auth/register/data/repos/register_repo_impl.dart';
import 'package:workshopmanager/Feature/Auth/register/data/source/base/register_source.dart';
import 'package:workshopmanager/Feature/Auth/register/data/source/impl/register_source_impl.dart';
import 'package:workshopmanager/Feature/Auth/register/domian/repo/register_repo.dart';
import 'package:workshopmanager/Feature/Auth/register/presentation/cubit/register_cubit.dart';
import 'package:workshopmanager/Feature/EditWorkshopProfile/data/repo/edit_workshop_profile_repo_impl.dart';
import 'package:workshopmanager/Feature/EditWorkshopProfile/data/source/base/edit_workshop_profile_source.dart';
import 'package:workshopmanager/Feature/EditWorkshopProfile/data/source/impl/edit_workshop_profile_source_impl.dart';
import 'package:workshopmanager/Feature/EditWorkshopProfile/domain/repo/edit_workshop_profile_repo.dart';
import 'package:workshopmanager/Feature/EditWorkshopProfile/presentation/cubit/edit_workshop_profile_cubit.dart';
import 'package:workshopmanager/Feature/Home/Presentation/cubit/home_cubit.dart';
import 'package:workshopmanager/Feature/Home/data/repos/get_home_workshop_repo_impl.dart';
import 'package:workshopmanager/Feature/Home/data/source/base/get_home_workshops_source.dart';
import 'package:workshopmanager/Feature/Home/data/source/impl/get_home_workshops_source_impl.dart';
import 'package:workshopmanager/Feature/Home/domian/repo/get_home_workshop_repo.dart';
import 'package:workshopmanager/Feature/Notifications/data/repo/notification_repo_impl.dart';
import 'package:workshopmanager/Feature/Notifications/data/source/impl/notifications_source_impl.dart';
import 'package:workshopmanager/Feature/Notifications/domain/repo/notification_repo.dart';
import 'package:workshopmanager/Feature/Notifications/presentation/cubit/notifications_cubit.dart';
import 'package:workshopmanager/Feature/Order_details/data/repo/order_details_repo_impl.dart';
import 'package:workshopmanager/Feature/Order_details/data/source/impl/order_details_source_impl.dart';
import 'package:workshopmanager/Feature/Order_details/domain/order_details_repo.dart';
import 'package:workshopmanager/Feature/about_workshop/data/repo/about_workshop_repo_impl.dart';
import 'package:workshopmanager/Feature/about_workshop/data/source/base/about_workshop_source.dart';
import 'package:workshopmanager/Feature/about_workshop/data/source/impl/about_workshop_source_impl.dart';
import 'package:workshopmanager/Feature/about_workshop/domain/repo/about_workshop_repo.dart';
import 'package:workshopmanager/Feature/about_workshop/presentation/cubit/about_workshop_cubit.dart';
import 'package:workshopmanager/Feature/add_service/data/repo/add_service_repo_impl.dart';
import 'package:workshopmanager/Feature/add_service/data/source/base/add_service_source.dart';
import 'package:workshopmanager/Feature/add_service/data/source/impl/add_service_source_impl.dart';
import 'package:workshopmanager/Feature/add_service/domain/repo/add_service_repo.dart';
import 'package:workshopmanager/Feature/add_service/presentation/cubit/add_service_cubit.dart';
import 'package:workshopmanager/Feature/add_workshop/Presentation/cubit/add_work_shop_cubit.dart';
import 'package:workshopmanager/Feature/add_workshop/data/repo/add_workshop_repo_imol.dart';
import 'package:workshopmanager/Feature/add_workshop/data/source/base/add_workshop_source.dart';
import 'package:workshopmanager/Feature/add_workshop/data/source/impl/add_workshop_source_impl.dart';
import 'package:workshopmanager/Feature/add_workshop/domain/respo/add_workshop_repo.dart';
import 'package:workshopmanager/Feature/add_workshop_manager/data/repo/add_workshop_manager_repo_impl.dart';
import 'package:workshopmanager/Feature/add_workshop_manager/data/source/base/add_workshop_manager_source.dart';
import 'package:workshopmanager/Feature/add_workshop_manager/data/source/impl/add_workshop__manager_source_impl.dart';
import 'package:workshopmanager/Feature/add_workshop_manager/domain/add_workshop_manager_repo.dart';
import 'package:workshopmanager/Feature/add_workshop_manager/presentation/cubit/add_workshop_manager_cubit.dart';
import 'package:workshopmanager/Feature/goves_and_district/Presentation/cubit/goves_and_district_cubit.dart';
import 'package:workshopmanager/Feature/goves_and_district/data/repo/goves_and_district_repo_impl.dart';
import 'package:workshopmanager/Feature/goves_and_district/data/source/base/goves_and_distric_source.dart';
import 'package:workshopmanager/Feature/goves_and_district/data/source/impl/goves_and_distict_source_impl.dart';
import 'package:workshopmanager/Feature/goves_and_district/domain/repo/goves_and_district_repo.dart';
import 'package:workshopmanager/Feature/manage_profile/data/repo/update_profile_repo_impl.dart';
import 'package:workshopmanager/Feature/manage_profile/data/source/base/update_profile_source.dart';
import 'package:workshopmanager/Feature/manage_profile/data/source/impl/update_profile_source_impl.dart';
import 'package:workshopmanager/Feature/manage_profile/domain/repo/update_profile_repo.dart';
import 'package:workshopmanager/Feature/manage_profile/presentation/cubit/manage_profile_cubit.dart';
import 'package:workshopmanager/Feature/manage_workshop/data/repo/manage_workshops_repo_impl.dart';
import 'package:workshopmanager/Feature/manage_workshop/data/source/base/manage_workshop_source.dart';
import 'package:workshopmanager/Feature/manage_workshop/presentation/cubit/manage_workshops_cubit.dart';
import 'package:workshopmanager/Feature/managers_account/data/source/base/managers_account_source.dart';
import 'package:workshopmanager/Feature/managers_account/data/source/impl/managers_account_source_impl.dart';
import 'package:workshopmanager/Feature/managers_account/domain/repos/managers_account_repo.dart';
import 'package:workshopmanager/Feature/managers_account/presentation/cubit/managers_accounts_cubit.dart';
import 'package:workshopmanager/Feature/scanner_page/data/repo/change_order_state_repo_impl.dart';
import 'package:workshopmanager/Feature/scanner_page/data/source/base/change_order_status_source.dart';
import 'package:workshopmanager/Feature/scanner_page/data/source/impl/change_order_status_source_impl.dart';
import 'package:workshopmanager/Feature/scanner_page/domain/change_order_status_repo.dart';
import 'package:workshopmanager/Feature/scanner_page/presentation/cubit/scanner_cubit.dart';
import 'package:workshopmanager/Feature/settings/data/repo/setting_repo_impl.dart';
import 'package:workshopmanager/Feature/settings/data/source/base/setting_source.dart';
import 'package:workshopmanager/Feature/settings/data/source/impl/setting_source_impl.dart';
import 'package:workshopmanager/Feature/settings/domain/repo/setting_repo.dart';
import 'package:workshopmanager/Feature/settings/presentation/cubit/settings_cubit.dart';
import 'package:workshopmanager/Feature/show_manager_account/data/repo/show_manager_repo_impl.dart';
import 'package:workshopmanager/Feature/show_manager_account/data/source/base/show_manager_source.dart';
import 'package:workshopmanager/Feature/show_manager_account/data/source/impl/show_manager_source_impl.dart';
import 'package:workshopmanager/Feature/show_manager_account/domain/repo/show_manager_repo.dart';
import 'package:workshopmanager/Feature/show_manager_account/presentation/cubit/show_manager_info_cubit.dart';
import 'package:workshopmanager/Feature/suggested_service/data/repo/service_repo_impl.dart';
import 'package:workshopmanager/Feature/suggested_service/data/source/base/service_source.dart';
import 'package:workshopmanager/Feature/suggested_service/data/source/impl/service_source_impl.dart';
import 'package:workshopmanager/Feature/suggested_service/domain/repo/service_repo.dart';
import 'package:workshopmanager/Feature/suggested_service/presentation/cubit/suggested_service_cubit.dart';
import 'package:workshopmanager/Feature/workshop_car_brands/data/repo/workshop_car_brand_repo_imol.dart';
import 'package:workshopmanager/Feature/workshop_car_brands/data/source/base/workshop_car_brand_source.dart';
import 'package:workshopmanager/Feature/workshop_car_brands/data/source/impl/workshop_car_brand_source_impl.dart';
import 'package:workshopmanager/Feature/workshop_orders/data/repo/workshop_orders_repo_impl.dart';
import 'package:workshopmanager/Feature/workshop_orders/data/source/base/workshop_order_source.dart';
import 'package:workshopmanager/Feature/workshop_orders/data/source/impl/workshop_order_source_impl.dart';
import 'package:workshopmanager/Feature/workshop_orders/domain/repos/workshop_order_repo.dart';
import 'package:workshopmanager/Feature/workshop_orders/presentation/cubit/workshop_orders_cubit.dart';
import 'package:workshopmanager/Feature/workshop_services/data/repo/workshop_list_service_repo_impl.dart';
import 'package:workshopmanager/Feature/workshop_services/data/source/base/workshop_list_service_source.dart';
import 'package:workshopmanager/Feature/workshop_services/data/source/impl/workshop_list_service_source_impl.dart';
import 'package:workshopmanager/Feature/workshop_services/domian/repo/workshop_list_service_repo.dart';

import 'Core/network/dio/base_dio.dart';
import 'Core/network/dio/dio_client.dart';
import 'Core/network/dio/dio_interceptor.dart';
import 'Feature/Auth/ForgetPassword/data/repo/forget_password_repo_impl.dart';
import 'Feature/Auth/ForgetPassword/data/source/impl/forget_password_source_impl.dart';
import 'Feature/Auth/OTP/domain/repos/otp_repo.dart';
import 'Feature/Auth/OTP/presentation/cubit/otp_cubit.dart';
import 'Feature/Notifications/data/source/base/notifications_source.dart';
import 'Feature/Order_details/data/source/base/order_details_source.dart';
import 'Feature/Order_details/presentation/cubit/order_details_cubit.dart';
import 'Feature/manage_workshop/data/source/impl/manage_workshop_source_impl.dart';
import 'Feature/manage_workshop/domain/repo/manage_workshops_repo.dart';
import 'Feature/managers_account/data/repo/managers_account_repo_impl.dart';
import 'Feature/workshop_car_brands/domian/repo/workshop_car_brand_repo.dart';
import 'Feature/workshop_car_brands/presentation/cubit/workshop_car_brand_cubit.dart';
import 'Feature/workshop_services/presentation/cubit/workshop_list_service_cubit.dart';
import 'Feature/workshop_working_time/presentation/cubit/workshop_working_time_cubit.dart';

GetIt getIt = GetIt.instance;
SharedPreferences preferences = getIt<SharedPreferences>();
Future<void> initDependencyInjection() async {
  await _registerSingletons();
  _registerDataSources();
  _registerRepos();
  _registerFactory();
}

Future<void> _registerSingletons() async {
  getIt.registerLazySingleton<GlobalKey<NavigatorState>>(
    () => GlobalKey<NavigatorState>(),
  );
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  BaseOptions options = BaseOptions(
    validateStatus: (status) {
      if (status == null) {
        return false;
      }
      if (status == 422 || status == 302) {
        return true;
      } else {
        return status >= 200 && status < 300;
      }
      // return status != null && status < 500;
    },
    baseUrl: EndPoints.baseUrl,
    followRedirects: false,
    headers: {
      'Content-Type': 'application/json',
    },
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
  );
  getIt.registerSingleton<BaseDio>(
      DioClient(options: options, dio: Dio(), interceptors: [
    DioInterceptor(getIt()),
  ]));
  getIt.registerSingleton<SharedPreferences>(preferences);
}

void _registerDataSources() {
  getIt.registerSingleton<LoginSource>(LoginSourceImpl(getIt()));
  getIt.registerSingleton<ForgetPasswordSource>(
      ForgetPasswordSourceImpl(getIt()));
  getIt.registerSingleton<OtpSource>(OtpSourceImpl(getIt()));
  getIt
      .registerSingleton<ResetPasswordSource>(ResetPasswordSourceImpl(getIt()));
  getIt.registerSingleton<RegisterSource>(RegisterSourceImpl(getIt()));
  getIt.registerSingleton<AddWorkshopSource>(AddWorkshopSourceImpl(getIt()));
  getIt.registerSingleton<GovesAndDistricSource>(
      GovesAndDistictSourceImpl(getIt()));
  getIt.registerSingleton<WorkshopCarBrandSource>(
      WorkshopCarBrandSourceImpl(getIt()));
  getIt.registerSingleton<WorkshopListServiceSource>(
      WorkshopListServiceSourceImpl(getIt()));
  getIt.registerSingleton<GetHomeWorkshopsSource>(
      GetHomeWorkshopsSourceImpl(getIt()));
  getIt
      .registerSingleton<AboutWorkshopSource>(AboutWorkshopSourceImpl(getIt()));
  getIt
      .registerSingleton<WorkshopOrderSource>(WorkshopOrderSourceImpl(getIt()));
  getIt.registerSingleton<OrderDetailsSource>(OrderDetailsSourceImpl(getIt()));
  getIt.registerSingleton<AddWorkshopManagerSource>(
      AddWorkshopManagerSourceImpl(getIt()));
  getIt.registerSingleton<ManagersAccountSource>(
      ManagersAccountSourceImpl(getIt()));

  getIt.registerSingleton<ServiceSource>(ServiceSourceImpl(getIt()));
  getIt.registerSingleton<SettingSource>(SettingSourceImpl(getIt()));
  getIt.registerSingleton<ShowManagerSource>(ShowManagerSourceImpl(getIt()));
  getIt.registerSingleton<EditWorkshopProfileSource>(
      EditWorkshopProfileSourceImpl(getIt()));
  getIt
      .registerSingleton<UpdateProfileSource>(UpdateProfileSourceImpl(getIt()));
  getIt.registerSingleton<AddServiceSource>(AddServiceSourceImpl(getIt()));

  getIt.registerSingleton<ManageWorkshopSource>(
      ManageWorkshopSourceImpl(getIt()));

  getIt
      .registerSingleton<NotificationsSource>(NotificationsSourceImpl(getIt()));

  getIt.registerSingleton<ChangeOrderStatusSource>(
      ChangeOrderStatusSourceImpl(getIt()));
}

void _registerRepos() {
  getIt.registerSingleton<LoginRepo>(LoginRepoImpl(getIt()));
  getIt.registerSingleton<ForgetPasswordRepo>(ForgetPasswordRepoImpl(getIt()));
  getIt.registerSingleton<OtpRepo>(OtpRepoImpl(getIt()));
  getIt.registerSingleton<ResetPasswordRepo>(ResetPasswordRepoImpl(getIt()));
  getIt.registerSingleton<RegisterRepo>(RegisterRepoImpl(getIt()));
  getIt.registerSingleton<AddWorkshopRepo>(AddWorkshopRepoImol(getIt()));
  getIt.registerSingleton<GovesAndDistrictRepo>(
      GovesAndDistrictRepoImpl(getIt()));
  getIt.registerSingleton<WorkshopCarBrandRepo>(
      WorkshopCarBrandRepoImol(getIt()));
  getIt.registerSingleton<WorkshopListServiceRepo>(
      WorkshopListServiceRepoImpl(getIt()));
  getIt.registerSingleton<GetHomeWorkshopsRepo>(
      GetHomeWorkshopRepoImpl(getIt()));
  getIt.registerSingleton<AboutWorkshopRepo>(AboutWorkshopRepoImpl(getIt()));
  getIt.registerSingleton<WorkshopOrderRepo>(WorkshopOrdersRepoImpl(getIt()));
  getIt.registerSingleton<OrderDetailsRepo>(OrderDetailsRepoImpl(getIt()));
  getIt.registerSingleton<AddWorkshopManagerRepo>(
      AddWorkshopManagerRepoImpl(getIt()));
  getIt
      .registerSingleton<ManagersAccountRepo>(ManagersAccountRepoImpl(getIt()));
  getIt.registerSingleton<ServiceRepo>(ServiceRepoImpl(getIt()));
  getIt.registerSingleton<SettingRepo>(SettingRepoImpl(getIt()));
  getIt
      .registerSingleton<ShowManagerRepo>(ShowManagerRepoImpl(source: getIt()));
  getIt.registerSingleton<EditWorkshopProfileRepo>(
      EditWorkshopProfileRepoImpl(getIt()));
  getIt.registerSingleton<UpdateProfileRepo>(UpdateProfileRepoImpl(getIt()));
  getIt.registerSingleton<AddServiceRepo>(AddServiceRepoImpl(getIt()));

  getIt
      .registerSingleton<ManageWorkshopsRepo>(ManageWorkshopsRepoImpl(getIt()));

  getIt.registerSingleton<NotificationRepo>(NotificationRepoImpl(getIt()));
  getIt.registerSingleton<ChangeOrderStatusRepo>(
      ChangeOrderStateRepoImpl(getIt()));
}

void _registerFactory() {
  getIt.registerFactory<LoginCubit>(() => LoginCubit(
        getIt(),
        LocalAuthentication(),
      ));
  getIt
      .registerFactory<ForgetPasswordCubit>(() => ForgetPasswordCubit(getIt()));
  getIt.registerFactory<OtpCubit>(() => OtpCubit(getIt()));
  getIt.registerFactory<ResetPasswordCubit>(() => ResetPasswordCubit(getIt()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));
  getIt.registerFactory<AddWorkShopCubit>(
      () => AddWorkShopCubit(getIt(), WorkshopWorkingTimeCubit()));
  getIt.registerFactory<GovesAndDistrictCubit>(
      () => GovesAndDistrictCubit(getIt()));
  getIt.registerFactory<WorkshopCarBrandCubit>(
      () => WorkshopCarBrandCubit(getIt()));
  getIt.registerFactory<WorkshopListServiceCubit>(
      () => WorkshopListServiceCubit(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
  getIt.registerFactory<AboutWorkshopCubit>(() => AboutWorkshopCubit(getIt()));
  getIt
      .registerFactory<WorkshopOrdersCubit>(() => WorkshopOrdersCubit(getIt()));
  getIt.registerFactory<OrderDetailsCubit>(() => OrderDetailsCubit(getIt()));
  getIt.registerFactory<AddWorkshopManagerCubit>(
      () => AddWorkshopManagerCubit(getIt()));
  getIt.registerFactory<ManagersAccountsCubit>(
      () => ManagersAccountsCubit(getIt()));
  getIt.registerFactory<SuggestedServiceCubit>(
      () => SuggestedServiceCubit(getIt()));
  getIt.registerFactory<SettingsCubit>(() => SettingsCubit(getIt()));
  getIt.registerFactory<ShowManagerInfoCubit>(
      () => ShowManagerInfoCubit(getIt()));
  getIt.registerFactory<EditWorkshopProfileCubit>(
      () => EditWorkshopProfileCubit(getIt(), WorkshopWorkingTimeCubit()));
  getIt.registerFactory<ManageProfileCubit>(() => ManageProfileCubit(getIt()));
  getIt.registerFactory<AddServiceCubit>(() => AddServiceCubit(getIt()));
  getIt.registerFactory<ManageWorkshopsCubit>(
      () => ManageWorkshopsCubit(getIt()));
  getIt.registerFactory<NotificationsCubit>(() => NotificationsCubit(getIt()));
  getIt.registerFactory<ScannerCubit>(() => ScannerCubit(getIt()));
}
