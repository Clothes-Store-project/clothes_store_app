import 'package:clothes_store_app/models/main_categories_model.dart';
import 'package:clothes_store_app/modules/main/cubit/states.dart';
import 'package:clothes_store_app/shared/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreenCubit extends Cubit<MainScreenStates> {
  MainScreenCubit() : super(MainScreenInitialState());

  static MainScreenCubit get(context) => BlocProvider.of(context);
  TextEditingController searchController = TextEditingController();

  bool isLoading = false;

  int index = 0;
  String mainCategoryId = "";

  MainCategoriesModel? mainCategoriesModel;

  void changeIndex(int newIndex){
    index = newIndex;
    emit(ChangeIndexState());
  }

  void getMainCategories() async {
    try {
      isLoading = true;
      emit(MainCategoriesLoadingState());
      DioHelper.getData(
        url: "/main_category",
      ).then((value) async {
        mainCategoriesModel = MainCategoriesModel.fromJson(value.data);
        print(mainCategoriesModel);
        mainCategoryId = value.data["response"][0]["_id"];
        isLoading = false;
        emit(MainCategoriesSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(MainCategoriesErrorState());
      });
    } catch (e) {}
  }
}