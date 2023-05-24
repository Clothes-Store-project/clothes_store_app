import 'package:clothes_store_app/modules/shopping_cart/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingCartCubit extends Cubit<ShoppingCartStates> {
  ShoppingCartCubit() : super(ShoppingCartInitialState());

  static ShoppingCartCubit get(context) => BlocProvider.of(context);
}