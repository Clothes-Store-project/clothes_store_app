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

  Map<String, dynamic> quantities = {};

  Future<void> getProduct(
      {required String id}) async {
    try {
      isLoading = true;
      emit(ProductLoadingState());
      DioHelper.getData(url: "/product/$id").then((value) async {
        productModel = ProductModel.fromJson(value.data);
        getAllSize(sizeable: value.data["sizeable"], colors: value.data["colors"], quantity: value.data["quantity"]);
        isLoading = false;
        emit(ProductSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(ProductErrorState());
      });
    } catch (e) {}
  }

  void getAllSize({required bool sizeable, required bool colors, required Map<String, dynamic> quantity}){
    if(!sizeable && !colors){
      quantities = {"avilable": quantity["avilable"] > 0};
    }
    if (colors ? !sizeable : sizeable) {
      Map<String, dynamic> Available =  Map.fromEntries(quantity.entries.where((element) => element.value > 0));

      quantities = Available;
    }
    if (colors && sizeable) {
      for (String key in quantity.keys) {
        Map<String, dynamic> Available =  Map.fromEntries(quantity[key].entries.where((color) => color[key].value > 0));
        if(Available.isNotEmpty){
          quantities["size"] = {};
          for(String key1 in Available.keys){
            quantities[key][Available[key1]] = 1;
          }
        }
      }
    }

    print("Hello $quantities");
    emit(FillQuantityState());
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

  List<String> sizeName = [
    "s",
    "m",
    "l",
    "xl",
    "xxl",
    "xxl",
    "xxl",
    "xxl",
  ];

  int index2 = 0;

  void changeColorIndex(int newIndex){
    index2 = newIndex;
    emit(ChangeState());
  }

  List<Color> color = [
    Colors.yellow,
    Colors.black,
    Colors.red,
    Colors.green,
  ];
  List<Color> color2 = [
    Colors.black,
    Colors.red,
    Colors.green,
  ];
  List<Color> color3 = [
    Colors.black,
    Colors.red,
  ];
}