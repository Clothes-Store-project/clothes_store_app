import 'package:clothes_store_app/modules/login/cubit/states.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:clothes_store_app/shared/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController1 = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isPassword = true;

  void changeState() {
    isPassword = !isPassword;
    emit(ChangeState());
  }

  int index  = 0;

  void changeIndex(){
    if(index == 0){
      index = 1;
    }else{
      index = 0;
    }
    emit(ChangeIndexState());
  }

  void userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: "/user/login",
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) async {
      if(value.data["message"] == "Id or password is invalid"){
        print("Id or password is invalid");
      }else{
        print(value.data["token"]);
        token = value.data["token"];
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();

        await sharedPreferences
            .setString("token", token!);
      }
      emit(LoginSuccessState());
    }).catchError((error) {
      print(error);
      emit(LoginErrorState(error.toString()));
    });
  }

  void userRegister() async {
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: "/user/sign_up",
      data: {
        'username': userNameController.text,
        'email': emailController1.text,
        'password': passwordController1.text,
        'first_name': firstNameController.text,
        'last_name': lastNameController.text,
        'telephone': telephoneController.text,
      },
    ).then((value) async {
      if(value.data["message"] == "This email is already in use"){
        print("This email is already in use");
      }else{
        print(value.data["message"]);
      }
      emit(RegisterSuccessState());
    }).catchError((error) {
      print(error);
      emit(RegisterErrorState(error.toString()));
    });
  }
}
