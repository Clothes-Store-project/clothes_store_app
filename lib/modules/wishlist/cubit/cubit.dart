import 'package:clothes_store_app/models/cart_model.dart';
import 'package:clothes_store_app/models/wish_model.dart';
import 'package:clothes_store_app/modules/wishlist/cubit/states.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:clothes_store_app/shared/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistCubit extends Cubit<WishlistStates> {
  WishlistCubit() : super(WishlistInitialState());

  static WishlistCubit get(context) => BlocProvider.of(context);
  bool isLoading = true;
  WishlistModel? wishlistModel;

  void getDataWishlist() async{
    emit(WishlistLoadingState());
    DioHelper.getData(url: "/wish",token: token).then((value) {
      print(value.data);
      wishlistModel = WishlistModel.fromJson(value.data);
      isLoading = false;
      emit(WishlistSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(WishlistErrorState());
    });
  }

  void removeWishlist(int index){
    wishlistModel!.response!.removeAt(index);
    emit(RemoveWishlistState());
  }
}