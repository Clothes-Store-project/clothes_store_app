import 'package:clothes_store_app/modules/men/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenCubit extends Cubit<MenStates> {
  MenCubit() : super(MenInitialState());

  static MenCubit get(context) => BlocProvider.of(context);

  List<String> images = [
    "assets/men/img1.jpg",
    "assets/men/img2.jpg",
    "assets/men/img3.jpg",
    "assets/men/img4.jpg",
    "assets/men/img5.jpg",
    "assets/men/img6.jpg",
    "assets/men/img7.jpg",
    "assets/men/img8.jpg",
  ];
}