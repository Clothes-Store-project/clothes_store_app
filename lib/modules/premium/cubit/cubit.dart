
import 'package:clothes_store_app/modules/premium/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PremiumCubit extends Cubit<PremiumStates> {
  PremiumCubit() : super(PremiumInitialState());

  static PremiumCubit get(context) => BlocProvider.of(context);
}