import 'package:clothes_store_app/models/user_model.dart';
import 'package:clothes_store_app/modules/edit_profile/cubit/states.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:clothes_store_app/shared/network/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileCubit extends Cubit<EditProfileStates> {
  EditProfileCubit() : super(EditProfileInitialState());
  static EditProfileCubit get(context) => BlocProvider.of(context);
  bool isLoading = true;

  void getDataProfile(){
    isLoading = true;
    emit(LoadingEditState());
    DioHelper.getData(url: "/user/view_profile", token: token).then((value) {
      userModel = UserModel.fromJson(value.data);
      isLoading = false;
      emit(SuccessEditState());
    }).catchError((error) {
      isLoading = true;
      emit(ErrorEditState());
    });
  }
}