import 'package:clothes_store_app/layout/app_layout.dart';
import 'package:clothes_store_app/models/order_model.dart';
import 'package:clothes_store_app/modules/order_details/cubit/states.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:clothes_store_app/shared/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsStates> {
  OrderDetailsCubit() : super(OrderDetailsInitialState());

  static OrderDetailsCubit get(context) => BlocProvider.of(context);
  bool isReturn = true;

  void viewButton({required OrderModel orderModel}) {
    if (orderModel.status == "completed") {
      isReturn = false;
    }
  }

  void returnOrder({
    required String id,
    required BuildContext context,
  }) {
    emit(OrderReturnLoadingState());
    DioHelper.postData(
      url: "/order_items/requestreturn/${id}",
      token: token,
      data: {},
    ).then((value) async {
      Fluttertoast.showToast(
        msg: "Order Return Success",
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
      emit(OrderReturnSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(OrderReturnErrorState());
    });
  }
}
