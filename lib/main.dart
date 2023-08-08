import 'package:bloc/bloc.dart';
import 'package:clothes_store_app/MyBlocObserver.dart';
import 'package:clothes_store_app/layout/app_layout.dart';
import 'package:clothes_store_app/layout/cubit/cubit.dart';
import 'package:clothes_store_app/layout/cubit/states.dart';
import 'package:clothes_store_app/modules/edit_profile/cubit/cubit.dart';
import 'package:clothes_store_app/modules/home/cubit/cubit.dart';
import 'package:clothes_store_app/modules/login/login_screen.dart';
import 'package:clothes_store_app/modules/profile/cubit/cubit.dart';
import 'package:clothes_store_app/modules/shopping_cart/cubit/cubit.dart';
import 'package:clothes_store_app/modules/wishlist/cubit/cubit.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:clothes_store_app/shared/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();

  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  token = sharedPreferences.getString("token");

  print("Hello $token");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit(),
        ),
        BlocProvider(
            create: (BuildContext context) => HomeCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => EditProfileCubit()..dataUser(),
        ),
        BlocProvider(
            create: (BuildContext context) => ShoppingCartCubit()..getDataCart(),
        ),
        BlocProvider(
            create: (BuildContext context) => WishlistCubit()..getDataWishlist(),
        ),
        BlocProvider(
          create: (BuildContext context) => ProfileCubit(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Directionality(
                textDirection: TextDirection.rtl,
                child: AppScreen(index: 0,),
              ),
            );
          }),
    );
  }
}
