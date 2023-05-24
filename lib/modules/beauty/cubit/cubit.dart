import 'package:clothes_store_app/modules/beauty/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BeautyCubit extends Cubit<BeautyStates> {
  BeautyCubit() : super(BeautyInitialState());

  static BeautyCubit get(context) => BlocProvider.of(context);

  List<String> images = [
    "assets/beauty/img1.jpg",
    "assets/beauty/img2.jpg",
    "assets/beauty/img3.jpg",
    "assets/beauty/img4.jpg",
    "assets/beauty/img5.jpg",
    "assets/beauty/img6.jpg",
    "assets/beauty/img7.jpg",
    "assets/beauty/img8.jpg",
  ];
}