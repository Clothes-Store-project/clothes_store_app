import 'package:clothes_store_app/modules/women/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WomenCubit extends Cubit<WomenStates> {
  WomenCubit() : super(WomenInitialState());

  static WomenCubit get(context) => BlocProvider.of(context);

  List<String> images = [
    "assets/img2.jpg",
    "assets/img7.jpg",
    "assets/img3.jpg",
    "assets/img5.jpg",
    "assets/img6.jpg",
    "assets/img4.jpg",
    "assets/img1.jpg",
    "assets/img8.jpg",
  ];
}