import 'package:clothes_store_app/modules/categories_women/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesWomenCubit extends Cubit<CategoriesWomenStates> {
  CategoriesWomenCubit() : super(CategoriesWomenInitialState());

  static CategoriesWomenCubit get(context) => BlocProvider.of(context);

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
      "تصاميم محافظة",
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
      "ركن الجمال",
      style: TextStyle(fontSize: 16, color: Colors.black),
    ),
    const Text(
      "ستريت ستايل",
      style: TextStyle(fontSize: 16, color: Colors.black),
    ),
    const Text(
      "ماركات",
      style: TextStyle(fontSize: 16, color: Colors.black),
    ),
    const Text(
      "مستلزمات منزلية",
      style: TextStyle(fontSize: 16, color: Colors.black),
    ),
    const Text(
      "بريميوم",
      style: TextStyle(fontSize: 16, color: Colors.black),
    ),
  ];
}
