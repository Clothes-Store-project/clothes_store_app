import 'package:clothes_store_app/modules/proceed_to_checkout/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProceedToCheckoutCubit extends Cubit<ProceedToCheckoutStates> {
  ProceedToCheckoutCubit() : super(ProceedToCheckoutInitialState());

  static ProceedToCheckoutCubit get(context) => BlocProvider.of(context);
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
}