import 'package:clothes_store_app/layout/app_layout.dart';
import 'package:clothes_store_app/models/cart_model.dart';
import 'package:clothes_store_app/models/sub_category_model.dart';
import 'package:clothes_store_app/modules/proceed_to_checkout/cubit/states.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:clothes_store_app/shared/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProceedToCheckoutCubit extends Cubit<ProceedToCheckoutStates> {
  ProceedToCheckoutCubit() : super(ProceedToCheckoutInitialState());

  static ProceedToCheckoutCubit get(context) => BlocProvider.of(context);
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();

  int total = 50;
  bool isLoading = false;

  void createOrder({
    required CartsModel cartsModel,
    required int totalPrice,
    required BuildContext context,
  }) {
    isLoading = true;
    emit(CreateOrderLoadingState());
    DioHelper.postData(
      url: "/order_items/create",
      token: token,
      data: {
        "phone": phoneController.text,
        "country": countryController.text,
        "firstName": firstNameController.text,
        "lastName": lastNameController.text,
        "address": addressController.text,
        "city": cityController.text,
        "zipCode": cityController.text,
        "payment": "cash",
        "totalPrice": "$totalPrice",
        "products": cartsModel.response,
      },
    ).then((value) {
      isLoading = false;
      Fluttertoast.showToast(
        msg: "Add Order Success",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: mainColor,
        textColor: Colors.white,
        fontSize: 16,
      ).whenComplete(() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AppScreen(index: 0)),
        );
      });
      emit(CreateOrderSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CreateOrderErrorState());
    });
  }
}
