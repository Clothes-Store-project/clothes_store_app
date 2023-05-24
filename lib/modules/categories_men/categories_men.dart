
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
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Row(
                    children: [
                      Container(
                        color: Colors.grey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: Colors.white70,
                              height: 1000,
                              width: 150,
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemBuilder: (context, index) => MaterialButton(
                                  onPressed: () {},
                                  focusColor: Colors.white,
                                  height: 50,
                                  child: cubit.text[index],
                                  elevation: 0,
                                ),
                                itemCount: cubit.text.length,
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
