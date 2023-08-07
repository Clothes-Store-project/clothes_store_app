import 'package:clothes_store_app/layout/cubit/cubit.dart';
import 'package:clothes_store_app/layout/cubit/states.dart';
import 'package:clothes_store_app/shared/components.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppScreen extends StatelessWidget {
  final int index;
  const AppScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: cubit.layoutScreens[cubit.bottomNavIndex],
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                onTap: (index) {
                  cubit.changeIndex(index);
                },
                items: cubit.items(cubit.bottomNavIndex),
                currentIndex: cubit.bottomNavIndex,
                selectedItemColor: mainColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
