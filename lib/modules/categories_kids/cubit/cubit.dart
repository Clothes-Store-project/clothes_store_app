import 'package:clothes_store_app/modules/categories_kids/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesKidsCubit extends Cubit<CategoriesKidsStates> {
  CategoriesKidsCubit() : super(CategoriesKidsInitialState());

  static CategoriesKidsCubit get(context) => BlocProvider.of(context);

  List<Widget> text = [
    const Text(
      "عروض",
      style: TextStyle(fontSize: 16, color: Colors.black),
    ),
    const Text(
      "نسوقوا حسب العمر",
      style: TextStyle(fontSize: 16, color: Colors.black),
    ),
    const Text(
      "البنات",
      style: TextStyle(fontSize: 16, color: Colors.black),
    ),
    const Text(
      "الاولاد",
      style: TextStyle(fontSize: 16, color: Colors.black),
    ),
    const Text(
      "رياضة",
      style: TextStyle(fontSize: 16, color: Colors.black),
    ),
    const Text(
      "ماركات",
      style: TextStyle(fontSize: 16, color: Colors.black),
    ),
    const Text(
      "لوازم منزلية",
      style: TextStyle(fontSize: 16, color: Colors.black),
    ),
    const Text(
      "بريميوم",
      style: TextStyle(fontSize: 16, color: Colors.black),
    ),
    const Text(
      "عالم الهدايا",
      style: TextStyle(fontSize: 16, color: Colors.black),
    ),
  ];
}
