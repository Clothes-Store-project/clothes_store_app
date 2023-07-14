import 'package:clothes_store_app/models/products_model.dart';
import 'package:clothes_store_app/models/sub_category_model.dart';
import 'package:clothes_store_app/modules/category/cubit/states.dart';
import 'package:clothes_store_app/shared/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryStates> {
  CategoryCubit() : super(CategoryInitialState());

  static CategoryCubit get(context) => BlocProvider.of(context);

  bool isLoading = true;

  bool isLoading2 = true;

  int currentIndex = 0;

  String id = "";

  SubCategoryModel? subCategoryModel;

  ProductsModel? productsModel;

  void changeIndex(int newIndex){
    currentIndex = newIndex;
    getProducts(subCategoryId: subCategoryModel!.response![newIndex].sId!);
    emit(ChangeIndexState());
  }

  void getSubCategory({required String id}) async {
    try {
      isLoading = true;
      subCategoryModel = null;
      emit(CategoryLoadingState());
      DioHelper.getData(
        url: "/subcategory/main_category/$id",
      ).then((value) async {
        subCategoryModel = SubCategoryModel.fromJson(value.data);
        isLoading = false;
        emit(CategorySuccessState());
      }).whenComplete(() async{
        getProducts(subCategoryId: subCategoryModel!.response![0].sId!);
      }).catchError((error) {
        print(error.toString());
        emit(CategoryErrorState());
      });
    } catch (e) {}
  }

  Future<void> getProducts({required String subCategoryId}) async{
    try{
      isLoading2 = true;
      productsModel = null;
      emit(ProductsLoadingState());
      DioHelper.getData(
        url: "/product/category/$subCategoryId",
      ).then((value) async {
        productsModel = ProductsModel.fromJson(value.data);
        isLoading2 = false;
        emit(ProductsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(ProductsErrorState());
      });
    }catch (e) {}
  }
}
