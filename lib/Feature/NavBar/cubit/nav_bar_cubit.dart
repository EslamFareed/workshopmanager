import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:workshopmanager/Feature/Home/Presentation/Views/home_screen.dart';
import 'package:workshopmanager/Feature/Notifications/presentation/views/notifications_screen.dart';
import 'package:workshopmanager/Feature/settings/presentation/views/settings_screen.dart';

class NavBarCubit extends Cubit<int> {
  NavBarCubit() : super(0);
  void setPage(int newIndex) => emit(newIndex);

  final List<Widget> pages = [
    const HomeScreen(),
    const NotificationsScreen(),
    const SettingsScreen(),
  ];
}
