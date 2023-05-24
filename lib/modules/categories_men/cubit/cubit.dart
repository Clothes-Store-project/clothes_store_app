import 'package:clothes_store_app/modules/categories_men/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesMenCubit extends Cubit<CategoriesMenStates> {
  CategoriesMenCubit() : super(CategoriesMenInitialState());

  static CategoriesMenCubit get(context) => BlocProvider.of(context);

  List<Widget> text = [
    const Text(
      "عروض",
      style: TextStyle(fontSize: 16, color: Colors.black),
    ),
    const Text(
      "وصلنا حديثا",
      style: TextStyle(fontSize: 16, color: Colors.black),
    ),
    const Text(
      "ملابس",
      style: TextStyle(fontSize: 16, color: Colors.black),
    ),
    const Text(
      "احذية",
      style: TextStyle(fontSize: 16, color: Colors.black),
    ),
    const Text(
      "اكسسوارات",
      style: TextStyle(fontSize: 16, color: Colors.black),
    ),
    const Text(
      "شنط",
      style: TextStyle(fontSize: 16, color: Colors.black),
    ),
    const Text(
      "رياضة",
      style: TextStyle(fontSize: 16, color: Colors.black),
    ),

    const Text(
      "ركن الوسامة",
      style: TextStyle(fontSize: 16, color: Colors.black),
    ),
    const Text(
      "مستلزمات منزلية",
      style: TextStyle(fontSize: 16, color: Colors.black),
    ),
    const Text(
      "ستريت ستايل",
      style: TextStyle(fontSize: 16, color: Colors.black),
    ),
    const Text(
      "بريميوم",
      style: TextStyle(fontSize: 16, color: Colors.black),
    ),
  ];
}
