import 'package:clothes_store_app/models/products_model.dart';
import 'package:clothes_store_app/modules/view_section_product/cubit/states.dart';
import 'package:clothes_store_app/shared/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewSectionProductCubit extends Cubit<ViewSectionProductStates> {
  ViewSectionProductCubit() : super(ViewSectionProductInitialState());

  static ViewSectionProductCubit get(context) => BlocProvider.of(context);
  TextEditingController searchController = TextEditingController();

  bool isLoading = true;

  ProductsModel? productsModel;

  Future<void> getProducts(
      {required String categoryId, required String typeOfProduct}) async {
    try {
      isLoading = true;
      emit(ViewSectionProductLoadingState());
      DioHelper.postData(url: "/product/type/$categoryId", data: {
        "typeOfProduct": typeOfProduct,
      }).then((value) async {
        productsModel = ProductsModel.fromJson(value.data);
        isLoading = false;
        emit(ViewSectionProductSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(ViewSectionProductErrorState());
      });
    } catch (e) {}
  }
}
