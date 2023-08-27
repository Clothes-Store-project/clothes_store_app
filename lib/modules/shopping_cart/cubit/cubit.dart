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
  bool isRemove = false;
  num total = 0;
  int total1 = 0;
  int x = 50;
  num z1 = 0;
  int p = 0;
  int m = 0;
  CartsModel? cartsModel;
  List<String> productsId = [];

  void changeTotal(num counter) {
    total = counter;
    emit(ChangeTotalState());
  }

  void getDataCart() async {
    cartsModel = null;
    cartProductsId = [];
    emit(CartLoadingState());
    DioHelper.getData(
      url: "/cart",
      token: token,
    ).then((value) {
      cartsModel = CartsModel.fromJson(value.data);
      print("TTT ${value.data["response"].length}");
      for(int i = 0; i < value.data["response"].length; i++){
        cartProductsId.add(value.data["response"][i]["product_id"]);
        emit(CartSuccessState());
        print("TTT ${cartProductsId}");
      }
      isLoading = false;
      emit(CartSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CartErrorState());
    });
  }

  void removeCart(String id) {
    cartsModel!.response!.removeWhere((item) => item.productId == id);
    getDataCart();
    isRemove = true;
    print(total);
    emit(RemoveCartState());
  }
}
