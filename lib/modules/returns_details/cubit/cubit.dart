import 'package:clothes_store_app/modules/returns_details/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ReturnsDetailsCubit extends Cubit<ReturnsDetailsStates> {
  ReturnsDetailsCubit() : super(ReturnsDetailsInitialState());

  static ReturnsDetailsCubit get(context) => BlocProvider.of(context);
}
