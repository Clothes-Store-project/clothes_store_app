import 'package:clothes_store_app/modules/women/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WomenCubit extends Cubit<WomenStates> {
  WomenCubit() : super(WomenInitialState());

  static WomenCubit get(context) => BlocProvider.of(context);
}