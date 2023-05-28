import 'package:clothes_store_app/modules/categories_kids/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesKidsCubit extends Cubit<CategoriesKidsStates> {
  CategoriesKidsCubit() : super(CategoriesKidsInitialState());

  static CategoriesKidsCubit get(context) => BlocProvider.of(context);

  List<String> text = [
    "عروض",
    "نسوقوا حسب العمر",
    "البنات",
    "الاولاد",
    "رياضة",
    "ماركات",
    "لوازم منزلية",
    "بريميوم",
    "عالم الهدايا",
  ];

  int currentIndex = 0;

  void changeIndex(int newIndex){
    currentIndex = newIndex;
    emit(ChangeIndexState());
  }
}
