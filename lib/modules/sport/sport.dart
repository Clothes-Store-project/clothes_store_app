
import 'package:clothes_store_app/modules/sport/cubit/cubit.dart';
import 'package:clothes_store_app/modules/sport/cubit/states.dart';
import 'package:clothes_store_app/modules/view_data/view_data.dart';
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
            return Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ViewDataScreen()),
                        );
                      },
                      child: const Image(
                        image: AssetImage('assets/sport/img1.jpg'),
                        width: double.infinity,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ViewDataScreen()),
                        );
                      },
                      child: const Image(
                        image: AssetImage('assets/sport/img2.jpg'),
                        width: double.infinity,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
