import 'package:clothes_store_app/layout/app_layout.dart';
import 'package:clothes_store_app/models/user_model.dart';
import 'package:clothes_store_app/modules/edit_profile/cubit/states.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:clothes_store_app/shared/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileCubit extends Cubit<EditProfileStates> {
  EditProfileCubit() : super(EditProfileInitialState());

  static EditProfileCubit get(context) => BlocProvider.of(context);
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  //bool isLoading = true;

  void dataUser() {
    firstNameController.text = userModel!.respone!.firstName!;
    lastNameController.text = userModel!.respone!.lastName!;
    telephoneController.text = userModel!.respone!.telephone!;
    emailController.text = userModel!.respone!.email!;
  }

  void editDataProfile({
    required BuildContext context,
  }) {
    //isLoading = true;
    emit(LoadingEditState());
    DioHelper.patchData(url: "/user/update_profile", token: token, data: {
      'first_name': firstNameController.text,
      'last_name': lastNameController.text,
      'telephone': telephoneController.text,
      'email': emailController.text,
    }).then((value) {
      Navigator.pop(context);
      //isLoading = false;
      emit(SuccessEditState());
    }).catchError((error) {
      //isLoading = true;
      emit(ErrorEditState());
    });
  }

  void logout({required BuildContext context}) async{
    token = null;
    emit(LogoutState());
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    await sharedPreferences
        .remove("token")
        .whenComplete(() {
      print("hello $token");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AppScreen(index: 4,)),
      );
    });
  }
}
