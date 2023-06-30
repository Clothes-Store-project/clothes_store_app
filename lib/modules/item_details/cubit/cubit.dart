import 'package:clothes_store_app/modules/item_details/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemDetailsCubit extends Cubit<ItemDetailsStates> {
  ItemDetailsCubit() : super(ItemDetailsInitialState());

  static ItemDetailsCubit get(context) => BlocProvider.of(context);
  TextEditingController commentController = TextEditingController();
  int currentIndex = 0;
  bool initValue = false;
  bool isOpen = false;
  bool isOpen1 = false;
  bool isOpen2 = false;

  void opening(){
    isOpen = !isOpen;
    emit(ChangeState());
  }

  void opening1(){
    isOpen1 = !isOpen1;
    emit(ChangeState());
  }

  void opening2(){
    isOpen2 = !isOpen2;
    emit(ChangeState());
  }

  void changeIndex(index){
    currentIndex = index;
    emit(ChangeState());
  }

  void changeValue(value){
    initValue = value;
    emit(ChangeState());
  }
}