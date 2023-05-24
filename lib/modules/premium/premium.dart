import 'package:clothes_store_app/modules/premium/cubit/cubit.dart';
import 'package:clothes_store_app/modules/premium/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => PremiumCubit(),
      child: BlocConsumer<PremiumCubit, PremiumStates>(
          listener: (context, state) {},
          builder: (context, state) {
            PremiumCubit cubit = PremiumCubit.get(context);
            return const Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Image(
                      image: AssetImage('assets/premium/module_01_ar.jpg'),
                      width: double.infinity,
                      height: 80,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Image(
                      image: AssetImage('assets/premium/img1.jpg'),
                      width: double.infinity,
                    ),
                    Image(
                      image: AssetImage('assets/premium/img2.jpg'),
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
