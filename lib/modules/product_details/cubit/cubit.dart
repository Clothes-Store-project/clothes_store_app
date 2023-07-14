import 'package:clothes_store_app/models/products_model.dart';
import 'package:clothes_store_app/modules/product_details/cubit/states.dart';
import 'package:clothes_store_app/shared/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsStates> {
  ProductDetailsCubit() : super(ProductDetailsInitialState());

  static ProductDetailsCubit get(context) => BlocProvider.of(context);
  TextEditingController commentController = TextEditingController();
  bool isLoading = true;

  int index  = 0;
  ProductModel? productModel;

  void changeIndex(){
    if(index == 0){
      index = 1;
    }else{
      index = 0;
    }
    emit(ChangeState());
  }
  Future<void> getProduct(
      {required String id}) async {
    try {
      isLoading = true;
      emit(ProductLoadingState());
      DioHelper.getData(url: "/product/$id").then((value) async {
        productModel = ProductModel.fromJson(value.data);
        isLoading = false;
        emit(ProductSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(ProductErrorState());
      });
    } catch (e) {}
  }
}