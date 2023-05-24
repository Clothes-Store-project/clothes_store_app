import 'package:clothes_store_app/modules/wishlist/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistCubit extends Cubit<WishlistStates> {
  WishlistCubit() : super(WishlistInitialState());

  static WishlistCubit get(context) => BlocProvider.of(context);
}