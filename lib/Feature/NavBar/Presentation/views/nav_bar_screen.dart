import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshopmanager/Core/utils/app_colors.dart';
import 'package:workshopmanager/Feature/NavBar/cubit/nav_bar_cubit.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: Scaffold(
        body: BlocBuilder<NavBarCubit, int>(
          builder: (context, state) {
            final cubit = context.read<NavBarCubit>();
            return cubit.pages[state];
          },
        ),
        bottomNavigationBar: BlocBuilder<NavBarCubit, int>(
          builder: (context, state) {
            final cubit = context.read<NavBarCubit>();
            return BottomNavigationBar(
                currentIndex: state,
                elevation: 0.0,
                onTap: (index) {
                  cubit.setPage(index);
                },
                selectedIconTheme: const IconThemeData(size: 30),
                selectedLabelStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                backgroundColor: AppColors.greyDE,
                selectedItemColor: AppColors.primary,
                unselectedItemColor: AppColors.grey7c,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: "الرئيسية"),
                  BottomNavigationBarItem(
                      icon: Badge(
                        child: Icon(Icons.notifications_active),
                      ),
                      label: "الاشعارات"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: "الاعدادات")
                ]);
          },
        ),
      ),
    );
  }
}
