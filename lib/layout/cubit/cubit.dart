import 'package:bloc/bloc.dart';
import 'package:clothes_store_app/layout/cubit/states.dart';
import 'package:clothes_store_app/modules/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int bottomNavIndex = 4;

  List<Widget> layoutScreens = [
    const Center(child: Text("صفحتى")),
    const Center(child: Text("قائمة الامنيات")),
    const Center(child: Text("عربة التسوق")),
    const Center(child: Text("الفئات")),
    const MainScreen(),
  ];

  List<BottomNavigationBarItem> items(int index) {
    return [
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.person,
        ),
        label: "صفحتى",
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.favorite_outlined,
        ),
        label: "قائمة الامنيات",
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.shopping_cart_outlined,
        ),
        label: "عربة التسوق",
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.apps_outlined,
        ),
        label: "الفئات",
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.home_outlined,
        ),
        label: "الرئيسية",
      ),
    ];
  }

  void changeIndex(int newIndex) {
    bottomNavIndex = newIndex;
    emit(ChangeIndexState());
  }
}
