import 'package:bloc/bloc.dart';
import 'package:clothes_store_app/MyBlocObserver.dart';
import 'package:clothes_store_app/layout/app_layout.dart';
import 'package:clothes_store_app/layout/cubit/cubit.dart';
import 'package:clothes_store_app/layout/cubit/states.dart';
import 'package:clothes_store_app/modules/item_details/item_details.dart';
import 'package:clothes_store_app/modules/login/login_screen.dart';
import 'package:clothes_store_app/shared/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
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
      ],
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Directionality(
                textDirection: TextDirection.rtl,
                child: LoginScreen(),
              ),
            );
          }),
    );
  }
}
