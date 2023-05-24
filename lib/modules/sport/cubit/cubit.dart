
import 'package:clothes_store_app/modules/sport/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SportCubit extends Cubit<SportStates> {
  SportCubit() : super(SportInitialState());

  static SportCubit get(context) => BlocProvider.of(context);
}