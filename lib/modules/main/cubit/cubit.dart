import 'package:clothes_store_app/modules/main/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreenCubit extends Cubit<MainScreenStates> {
  MainScreenCubit() : super(MainScreenInitialState());

  static MainScreenCubit get(context) => BlocProvider.of(context);
  TextEditingController searchController = TextEditingController();

  int index = 0;
  void changeIndex(int newIndex){
    index = newIndex;
    emit(ChangeIndexState());
  }
}