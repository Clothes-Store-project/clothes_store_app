import 'package:clothes_store_app/models/products_model.dart';
import 'package:clothes_store_app/modules/view_sub_category/cubit/states.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:clothes_store_app/shared/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewSubCategoryCubit extends Cubit<ViewSubCategoryStates> {
  ViewSubCategoryCubit() : super(ViewSubCategoryInitialState());

  static ViewSubCategoryCubit get(context) => BlocProvider.of(context);
  TextEditingController searchController = TextEditingController();

  bool isLoading = true;

  ProductsModel? productsModel;

  Future<void> getProducts({required String subCategoryId}) async{
    try{
      isLoading = true;
      emit(ProductsLoadingState());
      DioHelper.getData(
          url: "/product/category/$subCategoryId",
      ).then((value) async {
        productsModel = ProductsModel.fromJson(value.data);
        isLoading = false;
        emit(ProductsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(ProductsErrorState());
      });
    }catch (e) {}
  }

  Future<void> addToCart({
    required String productId,
  }) async {
    try {
      DioHelper.postData(
          url: "/cart",
          data: {
            "product_id": productId,
            "quantity": 1,
          },
          token: token)
          .then((value) async {})
          .catchError((error) {
        print(error.toString());
      });
    } catch (e) {}
  }
}