import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:workshopmanager/Core/app/app_routing.dart';
import 'package:workshopmanager/Core/cubit/language/app_language_state.dart';
import 'package:workshopmanager/Core/styles/app_styles.dart';
import 'package:workshopmanager/Core/widget/custom_loader_widget.dart';
import 'package:workshopmanager/Feature/Auth/register/presentation/cubit/register_cubit.dart';
import 'package:workshopmanager/Feature/EditWorkshopProfile/presentation/cubit/edit_workshop_profile_cubit.dart';
import 'package:workshopmanager/Feature/location_on_map/presentation/cubit/location_on_map_cubit.dart';
import 'package:workshopmanager/Feature/settings/presentation/cubit/settings_cubit.dart';
import 'package:workshopmanager/di.dart';
import 'Core/cubit/language/app_language_cubit.dart';
import 'Feature/workshop_working_time/presentation/cubit/workshop_working_time_cubit.dart';
import 'generated/l10n.dart';

class WorkshopManager extends StatelessWidget {
  const WorkshopManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SettingsCubit(getIt())),
        BlocProvider(
            create: (context) => AppLanguageCubit()..changeLanguage(0)),
        BlocProvider(
          create: (context) => LocationOnMapCubit()..getCurrentLocation(),
          lazy: false,
        ),
        BlocProvider(create: (context) => RegisterCubit(getIt())),
        BlocProvider(
            create: (context) =>
                EditWorkshopProfileCubit(getIt(), WorkshopWorkingTimeCubit())),
      ],
      child: BlocBuilder<AppLanguageCubit, AppLanguageState>(
        builder: (context, state) {
          if (state is ChangeLanguageState) {
            return MaterialApp.router(
              localeResolutionCallback: (locale, supportedLocales) {
                for (var supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale!.languageCode &&
                      supportedLocale.countryCode == locale.countryCode) {
                    return supportedLocale;
                  }
                }
                return supportedLocales.first;
              },
              locale: state.locale,
              debugShowCheckedModeBanner: false,
              routerConfig: router,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              theme: themeData(),
            );
          } else {
            return const SizedBox(
                child: Center(
              child: CustomLoaderWidget(),
            ));
          }
        },
      ),
    );
  }
}
