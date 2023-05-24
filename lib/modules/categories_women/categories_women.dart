import 'package:carousel_slider/carousel_slider.dart';
import 'package:clothes_store_app/modules/categories_women/cubit/cubit.dart';
import 'package:clothes_store_app/modules/categories_women/cubit/states.dart';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesWomenScreen extends StatelessWidget {
  const CategoriesWomenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => CategoriesWomenCubit(),
      child: BlocConsumer<CategoriesWomenCubit, CategoriesWomenStates>(
          listener: (context, state) {},
          builder: (context, state) {
            CategoriesWomenCubit cubit = CategoriesWomenCubit.get(context);
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
                                itemCount: 13,
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
