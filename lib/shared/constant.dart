import 'dart:ui';

import 'package:clothes_store_app/models/cart_model.dart';
import 'package:clothes_store_app/models/user_model.dart';

Color mainColor = const Color.fromRGBO(242, 196, 61, 1);

String? token;

UserModel? userModel;

List<String> cartProductsId = [];
List<String> wishProductsId = [];