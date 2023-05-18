import 'package:clothes_store_app/layout/cubit/cubit.dart';
import 'package:clothes_store_app/layout/cubit/states.dart';
import 'package:clothes_store_app/shared/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          body: cubit.layoutScreens[cubit.bottomNavIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              cubit.changeIndex(index);
            },
            items: cubit.items(cubit.bottomNavIndex),
            currentIndex: cubit.bottomNavIndex,
            selectedItemColor: Colors.green[600],
          ),
        );
      },
    );
  }
}
