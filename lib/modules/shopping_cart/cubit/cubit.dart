import 'package:clothes_store_app/models/cart_model.dart';
import 'package:clothes_store_app/models/products_model.dart';
import 'package:clothes_store_app/modules/shopping_cart/cubit/states.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:clothes_store_app/shared/network/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingCartCubit extends Cubit<ShoppingCartStates> {
  ShoppingCartCubit() : super(ShoppingCartInitialState());

  static ShoppingCartCubit get(context) => BlocProvider.of(context);
  bool isEmpty = false;
  int counter = 0;

  void changePlus() {
    counter++;
    emit(ChangePlusState());
  }

  void changeMinus() {
    if (counter == 0) {
      counter = 0;
    } else {
      counter--;
    }
    emit(ChangeMinusState());
  }

  String? id;
  bool isLoading = true;
  bool Function(CartModel element) isRemove = (element) => true;
  int total = 0;
  int total1 = 0;
  int x = 50;
  int z1 = 0;
  int p = 0;
  int m = 0;
  CartsModel? cartsModel;

  void changeTotal(int counter) {
    total = counter + x;
    emit(ChangeTotalState());
  }

  void getDataCart() async {
    emit(CartLoadingState());
    DioHelper.getData(
      url: "/cart",
      token: token,
    ).then((value) {
      cartsModel = CartsModel.fromJson(value.data);
      total1 = total + x;
      print(total1);
      isLoading = false;
      emit(CartSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CartErrorState());
    });
  }

  void removeCart(String id) async{
    cartsModel!.response!.removeWhere((item) => item.productId == id);
    emit(RemoveCartState());
  }
}
