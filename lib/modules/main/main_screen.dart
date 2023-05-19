import 'package:clothes_store_app/modules/main/cubit/cubit.dart';
import 'package:clothes_store_app/modules/main/cubit/states.dart';
import 'package:clothes_store_app/modules/women/women.dart';
import 'package:clothes_store_app/shared/components.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MainScreenCubit(),
      child: BlocConsumer<MainScreenCubit, MainScreenStates>(
          listener: (context, state) {},
          builder: (context, state) {
            MainScreenCubit cubit = MainScreenCubit.get(context);
            return DefaultTabController(
              length: 6,
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
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
                        hintText: "ابحث عن منتج، ماركة أو فئة",
                        hintStyle: const TextStyle(
                            color: Colors.black, fontSize: 13),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        contentPadding: EdgeInsets.zero,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
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
                    labelPadding: const EdgeInsets.symmetric(horizontal: 30),
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
                        "ركن الجمال",
                        style: TextStyle(
                            color:
                                cubit.index == 2 ? mainColor : Colors.black54),
                      ),
                      Text(
                        "الاطفال",
                        style: TextStyle(
                            color:
                                cubit.index == 3 ? mainColor : Colors.black54),
                      ),
                      Text(
                        "بريميوم",
                        style: TextStyle(
                            color:
                                cubit.index == 4 ? mainColor : Colors.black54),
                      ),
                      Text(
                        "رياضه",
                        style: TextStyle(
                            color:
                                cubit.index == 5 ? mainColor : Colors.black54),
                      ),
                    ],
                  ),
                ),
                body: const TabBarView(
                  children: [
                    WomenScreen(),
                    Center(child: Text("الرجال")),
                    Center(child: Text("ركن الجمال")),
                    Center(child: Text("الاطفال")),
                    Center(child: Text("بريميوم")),
                    Center(child: Text("رياضه")),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
