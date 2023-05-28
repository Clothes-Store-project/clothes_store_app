import 'package:clothes_store_app/modules/categories/cubit/cubit.dart';
import 'package:clothes_store_app/modules/categories/cubit/states.dart';
import 'package:clothes_store_app/modules/categories_kids/categories_kids.dart';
import 'package:clothes_store_app/modules/categories_men/categories_men.dart';
import 'package:clothes_store_app/modules/categories_women/categories_women.dart';
import 'package:clothes_store_app/modules/kids/kids.dart';
import 'package:clothes_store_app/modules/men/men.dart';
import 'package:clothes_store_app/modules/women/women.dart';
import 'package:clothes_store_app/shared/components.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CategoriesCubit(),
      child: BlocConsumer<CategoriesCubit, CategoriesStates>(
          listener: (context, state) {},
          builder: (context, state) {
            CategoriesCubit cubit = CategoriesCubit.get(context);
            return DefaultTabController(
              length: 3,
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  elevation: 0.5,
                  backgroundColor: Colors.white,
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications_none,
                        color: Colors.red,
                      ),
                    ),
                  ],
                  title: TextField(
                    keyboardType: TextInputType.text,
                    controller: cubit.searchController,
                    style:
                        const TextStyle(color: Colors.black54, fontSize: 16),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "الفئات",
                        hintStyle: const TextStyle(
                            color: Colors.black, fontSize: 13),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        contentPadding: EdgeInsets.zero,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          color: mainColor,
                          size: 20,
                        )),
                  ),
                  bottom: TabBar(
                    indicatorColor: mainColor,
                    isScrollable: true,
                    labelStyle: const TextStyle(
                      fontSize: 17,
                    ),
                    onTap: (newIndex) => cubit.changeIndex(newIndex),
                    labelPadding: const EdgeInsets.symmetric(horizontal: 45),
                    indicatorPadding:
                        const EdgeInsets.symmetric(horizontal: -5),
                    tabs: [
                      Text(
                        "النساء",
                        style: TextStyle(
                            color:
                                cubit.index == 0 ? mainColor : Colors.black54),
                      ),
                      Text(
                        "الرجال",
                        style: TextStyle(
                            color:
                                cubit.index == 1 ? mainColor : Colors.black54),
                      ),
                      Text(
                        "الاطفال",
                        style: TextStyle(
                            color:
                                cubit.index == 2 ? mainColor : Colors.black54),
                      ),
                    ],
                  ),
                ),
                body: const TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    CategoriesWomenScreen(),
                    CategoriesMenScreen(),
                    CategoriesKidsScreen(),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
