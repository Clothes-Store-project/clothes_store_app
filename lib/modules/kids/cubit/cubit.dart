import 'package:clothes_store_app/modules/kids/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KidsCubit extends Cubit<KidsStates> {
  KidsCubit() : super(KidsInitialState());

  static KidsCubit get(context) => BlocProvider.of(context);

  List<String> images = [
    "assets/kids/img1.jpg",
    "assets/kids/img2.jpg",
    "assets/kids/img3.jpg",
    "assets/kids/img4.jpg",
    "assets/kids/img5.jpg",
    "assets/kids/img6.jpg",
    "assets/kids/img7.jpg",
    "assets/kids/img8.jpg",
  ];
}