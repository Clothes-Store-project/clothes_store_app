
import 'package:clothes_store_app/modules/categories/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit extends Cubit<CategoriesStates> {
  CategoriesCubit() : super(CategoriesInitialState());

  static CategoriesCubit get(context) => BlocProvider.of(context);
  TextEditingController searchController = TextEditingController();

  int index = 0;
  void changeIndex(int newIndex){
    index = newIndex;
    emit(ChangeIndexState());
  }
}