import 'package:clothes_store_app/models/products_model.dart';
import 'package:clothes_store_app/modules/product_details/cubit/states.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:clothes_store_app/shared/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsStates> {
  ProductDetailsCubit() : super(ProductDetailsInitialState());

  static ProductDetailsCubit get(context) => BlocProvider.of(context);
  TextEditingController commentController = TextEditingController();
  bool isLoading = true;
  bool isSelectedSize = false;
  bool isSelectedSizeAndColor = false;
  bool isSelectedColor = false;
  bool isSize = false;
  String color = "";
  String size = "";

  int index  = 0;
  ProductModel? productModel;

  void selectSize(String newSize){
    size = newSize;
    emit(ChangeState());
  }

  void selectColor(String newColor){
    color = newColor;
    emit(ChangeState());
  }

  void selectedSize(){
    isSelectedSize = true;
    emit(ChangeState());
  }
  void selectedColor(){
    isSelectedColor = true;
    emit(ChangeState());
  }
  void selectedSizeAndColor(){
    isSelectedSizeAndColor = true;
    emit(ChangeState());
  }
  void selectedSizeOnly(){
    isSize = true;
    emit(ChangeState());
  }

  void changeIndex(){
    if(index == 0){
      index = 1;
    }else{
      index = 0;
    }
    emit(ChangeState());
  }

  Map<String, dynamic> quantities = {};

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

  Future<void> addToCart({
    required String productId,
  }) async {
    try {
      DioHelper.postData(
          url: "/cart",
          data: {
            "product_id": productId,
            "quantity": 1,
            "color": color,
            "size": size,
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

  int index2 = 0;

  Color hexToColor(String hexString) {
    return Color(int.parse(hexString, radix: 16)).withOpacity(1.0);
  }

  void changeColorIndex(int newIndex){
    index2 = newIndex;
    emit(ChangeState());
  }
}