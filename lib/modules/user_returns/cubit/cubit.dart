import 'package:clothes_store_app/models/order_model.dart';
import 'package:clothes_store_app/modules/user_returns/cubit/states.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:clothes_store_app/shared/network/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserReturnsCubit extends Cubit<UserReturnsStates> {
  UserReturnsCubit() : super(UserReturnsInitialState());

  static UserReturnsCubit get(context) => BlocProvider.of(context);
  bool isLoading = true;
  List<OrderModel> orderModel = [];

  void getDataReturns(){
    emit(UserReturnsLoadingState());
    DioHelper.postData(
      url: "/order_items/myreturns",
      token: token,
      data: {},
    ).then((value) async {
      for(int i = 0; i < value.data.length ; i++){
        orderModel.add(OrderModel.fromJson(value.data[i]));
      }
      isLoading = false;
      emit(UserReturnsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(UserReturnsErrorState());
    });
  }
}