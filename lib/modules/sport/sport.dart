
import 'package:clothes_store_app/modules/sport/cubit/cubit.dart';
import 'package:clothes_store_app/modules/sport/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SportCubit(),
      child: BlocConsumer<SportCubit, SportStates>(
          listener: (context, state) {},
          builder: (context, state) {
            SportCubit cubit = SportCubit.get(context);
            return const Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Image(
                      image: AssetImage('assets/sport/img1.jpg'),
                      width: double.infinity,
                    ),
                    Image(
                      image: AssetImage('assets/sport/img2.jpg'),
                      width: double.infinity,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
