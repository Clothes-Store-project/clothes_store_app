import 'package:clothes_store_app/models/order_model.dart';
import 'package:clothes_store_app/modules/user_orders/cubit/states.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:clothes_store_app/shared/network/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserOrdersCubit extends Cubit<UserOrdersStates> {
  UserOrdersCubit() : super(UserOrdersInitialState());

  static UserOrdersCubit get(context) => BlocProvider.of(context);
  bool isLoading = true;
  bool isReturn = false;
  List<OrderModel> orderModel = [];

  void getDataOrder(){
    emit(LoadingUserOrdersState());
    DioHelper.postData(
      url: "/order_items/myorders",
      token: token,
      data: {},
    ).then((value) async {
      for(int i = 0; i < value.data.length ; i++){
        orderModel.add(OrderModel.fromJson(value.data[i]));
      }
      isLoading = false;
      emit(SuccessUserOrdersState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorUserOrdersState());
    });
  }
}