import 'package:clothes_store_app/modules/categories_men/cubit/cubit.dart';
import 'package:clothes_store_app/modules/categories_men/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesMenScreen extends StatelessWidget {
  const CategoriesMenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => CategoriesMenCubit(),
      child: BlocConsumer<CategoriesMenCubit, CategoriesMenStates>(
          listener: (context, state) {},
          builder: (context, state) {
            CategoriesMenCubit cubit = CategoriesMenCubit.get(context);
            return Scaffold(
              backgroundColor: Colors.white,
              body: Row(
                children: [
                  Container(
                    color: Colors.grey.shade300,
                    width: size.width * 0.36,
                    child: ListView.builder(
                      itemBuilder: (context, index) => MaterialButton(
                        onPressed: () {
                          cubit.changeIndex(index);
                        },
                        color: index == cubit.currentIndex
                            ? Colors.white
                            : Colors.grey.shade300,
                        focusColor: Colors.white,
                        height: 50,
                        elevation: 0,
                        child: Text(
                          cubit.text[index],
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      itemCount: cubit.text.length,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
