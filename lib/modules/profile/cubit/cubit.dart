import 'package:clothes_store_app/models/user_model.dart';
import 'package:clothes_store_app/modules/profile/cubit/states.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:clothes_store_app/shared/network/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);

  bool isLoading = true;

  void getDataProfile(){
    isLoading = true;
    emit(LoadingProfileState());
    DioHelper.getData(url: "/user/view_profile", token: token).then((value) {
      userModel = UserModel.fromJson(value.data);
      isLoading = false;
      emit(SuccessProfileState());
    }).catchError((error) {
      isLoading = true;
      print(error);
      emit(ErrorProfileState());
    });
  }
}