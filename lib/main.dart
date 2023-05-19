import 'package:bloc/bloc.dart';
import 'package:clothes_store_app/MyBlocObserver.dart';
import 'package:clothes_store_app/layout/app_layout.dart';
import 'package:clothes_store_app/layout/cubit/cubit.dart';
import 'package:clothes_store_app/layout/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
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
            return Directionality(
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                home: AppScreen(),
              ),
              textDirection: TextDirection.rtl,
            );
          }),
    );
  }
}
