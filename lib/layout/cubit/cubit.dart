import 'package:bloc/bloc.dart';
import 'package:clothes_store_app/layout/cubit/states.dart';
import 'package:clothes_store_app/modules/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int bottomNavIndex = 0;

  List<Widget> layoutScreens = [
    const MainScreen(),
    const Center(child: Text("الفئات")),
    const Center(child: Text("عربة التسوق")),
    const Center(child: Text("قائمة الامنيات")),
    const Center(child: Text("صفحتى")),
  ];

  List<BottomNavigationBarItem> items(int index) {
    return [
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.home_outlined,
          size: 35,
        ),
        label: "الرئيسية",
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.apps_outlined,
          size: 35,
        ),
        label: "الفئات",
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.shopping_cart_outlined,
          size: 35,
        ),
        label: "عربة التسوق",
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.favorite_outline,
          size: 35,
        ),
        label: "قائمة الامنيات",
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.person_2_outlined,
          size: 35,
        ),
        label: "صفحتى",
      ),
    ];
  }

  void changeIndex(int newIndex) {
    bottomNavIndex = newIndex;
    emit(ChangeIndexState());
  }
}
