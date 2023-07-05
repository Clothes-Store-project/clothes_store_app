import 'package:clothes_store_app/models/product_category_model.dart';
import 'package:clothes_store_app/models/products_model.dart';
import 'package:clothes_store_app/modules/women/cubit/states.dart';
import 'package:clothes_store_app/shared/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WomenCubit extends Cubit<WomenStates> {
  WomenCubit() : super(WomenInitialState());

  static WomenCubit get(context) => BlocProvider.of(context);

  List<String> images = [
    "assets/img2.jpg",
    "assets/img7.jpg",
    "assets/img3.jpg",
    "assets/img5.jpg",
    "assets/img6.jpg",
    "assets/img4.jpg",
    "assets/img1.jpg",
    "assets/img8.jpg",
  ];

  bool isLoading = false;

  List<ProductsModel> list = [];

  List<List<ProductsModel>> list2 = [];

  ProductCategoryModel? productCategoryModel;

  void getProductCategory() async {
    try {
      isLoading = true;
      emit(ProductCategoryLoadingState());
      DioHelper.getData(
        url: "/product_category",
      ).then((value) async {
        productCategoryModel = ProductCategoryModel.fromJson(value.data);
        for(int i = 0; i < productCategoryModel!.productCategory!.length; i++){
          getProducts(categoryId: productCategoryModel!.productCategory![i].sId!);
        }
        isLoading = false;
        emit(ProductCategorySuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(ProductCategoryErrorState());
      });
    } catch (e) {}
  }

  void getProducts({required String categoryId}) async{
    try{
      DioHelper.getData(
        url: "/product/category/$categoryId",
      ).then((value) async {
        list = [];
        print("\n$categoryId is ${value.data[0]["name"]}");
        for(int i = 0; i < value.data.length; i++){
          list.add(ProductsModel.fromJson(value.data[i]));
        }
        list2.add(list);
        print(productCategoryModel!.productCategory!.length);
        for(int i = 0; i < productCategoryModel!.productCategory!.length; i++){
          print(list2[i][0].name);
        }
        emit(ProductCategorySuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(ProductCategoryErrorState());
      });
    }catch (e) {}
  }
}