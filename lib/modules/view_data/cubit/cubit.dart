import 'package:clothes_store_app/modules/view_data/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewDataCubit extends Cubit<ViewDataStates> {
  ViewDataCubit() : super(ViewDataInitialState());

  static ViewDataCubit get(context) => BlocProvider.of(context);
  TextEditingController searchController = TextEditingController();
}