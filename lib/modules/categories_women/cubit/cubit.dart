import 'package:clothes_store_app/modules/categories_women/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesWomenCubit extends Cubit<CategoriesWomenStates> {
  CategoriesWomenCubit() : super(CategoriesWomenInitialState());

  static CategoriesWomenCubit get(context) => BlocProvider.of(context);

  List<String> text = [
    "عروض",
    "وصلنا حديثا",
    "تصاميم محافظة",
    "ملابس",
    "احذية",
    "اكسسوارات",
    "شنط",
    "رياضة",
    "ركن الجمال",
    "ستريت ستايل",
    "ماركات",
    "مستلزمات منزلية",
    "بريميوم",
  ];

  int currentIndex = 0;

  void changeIndex(int newIndex){
    currentIndex = newIndex;
    emit(ChangeIndexState());
  }
}
