import 'package:clothes_store_app/modules/categories_men/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesMenCubit extends Cubit<CategoriesMenStates> {
  CategoriesMenCubit() : super(CategoriesMenInitialState());

  static CategoriesMenCubit get(context) => BlocProvider.of(context);

  List<String> text = [
      "عروض",
      "وصلنا حديثا",
      "ملابس",
      "احذية",
      "اكسسوارات",
      "شنط",
      "رياضة",
      "ركن الوسامة",
      "مستلزمات منزلية",
      "ستريت ستايل",
      "بريميوم",
  ];

  int currentIndex = 0;

  void changeIndex(int newIndex){
    currentIndex = newIndex;
    emit(ChangeIndexState());
  }
}
