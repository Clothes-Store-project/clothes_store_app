
import 'package:clothes_store_app/models/main_categories_model.dart';
import 'package:clothes_store_app/modules/categories/cubit/states.dart';
import 'package:clothes_store_app/shared/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit extends Cubit<CategoriesStates> {
  CategoriesCubit() : super(CategoriesInitialState());

  static CategoriesCubit get(context) => BlocProvider.of(context);
  TextEditingController searchController = TextEditingController();

  int index = 0;
  String mainCategoryId = "";
  bool isLoading = true;

  MainCategoriesModel? mainCategoriesModel;

  void changeIndex(int newIndex){
    index = newIndex;
    emit(ChangeIndexState());
  }

  void getMainCategories() async {
    try {
      isLoading = true;
      emit(CategoriesLoadingState());
      DioHelper.getData(
        url: "/main_category",
      ).then((value) async {
        mainCategoriesModel = MainCategoriesModel.fromJson(value.data);
        print(mainCategoriesModel);
        mainCategoryId = value.data["response"][0]["_id"];
        isLoading = false;
        emit(CategoriesSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(CategoriesErrorState());
      });
    } catch (e) {}
  }
}