import 'package:clothes_store_app/models/products_model.dart';
import 'package:clothes_store_app/modules/view_super_deals/cubit/states.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:clothes_store_app/shared/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewSuperDealsCubit extends Cubit<ViewSuperDealsStates> {
  ViewSuperDealsCubit() : super(ViewSuperDealsInitialState());

  static ViewSuperDealsCubit get(context) => BlocProvider.of(context);
  TextEditingController searchController = TextEditingController();

  bool isLoading = true;

  ProductsModel? productsModel;

  Future<void> getProducts(
      {required String categoryId}) async {
    try {
      isLoading = true;
      emit(ViewSuperDealsLoadingState());
      DioHelper.getData(url: "/product/main_category/$categoryId").then((value) async {
        productsModel = ProductsModel.fromJson(value.data);
        isLoading = false;
        emit(ViewSuperDealsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(ViewSuperDealsErrorState());
      });
    } catch (e) {}
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

  Future<void> addToWish({
    required String productId,
  }) async {
    try {
      DioHelper.postData(
        url: "/wish",
        data: {
          "product_id": productId,
        },
        token: token,
      ).then((value) async {
      }).catchError((error) {
        print(error.toString());
      });
    } catch (e) {}
  }
}
