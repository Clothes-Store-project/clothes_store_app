import 'package:clothes_store_app/modules/home/home_screen.dart';
import 'package:clothes_store_app/modules/main/cubit/cubit.dart';
import 'package:clothes_store_app/modules/main/cubit/states.dart';
import 'package:clothes_store_app/shared/components.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => MainScreenCubit()..getMainCategories(),
      child: BlocConsumer<MainScreenCubit, MainScreenStates>(
          listener: (context, state) {},
          builder: (context, state) {
            MainScreenCubit cubit = MainScreenCubit.get(context);
            return cubit.isLoading? Scaffold(
              body: Center(
                child: CircularProgressIndicator(color: mainColor,),
              ),
            ) : DefaultTabController(
              length: cubit.mainCategoriesModel!.response!.length,
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  leading: SizedBox(),
                  elevation: 0.5,
                  actions: [SizedBox(width: size.width * 0.13,)],
                  backgroundColor: Colors.white,
                  title: TextField(
                    keyboardType: TextInputType.text,
                    controller: cubit.searchController,
                    style: const TextStyle(color: Colors.black54, fontSize: 16),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "ابحث عن منتج، ماركة أو فئة",
                        hintStyle: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 11,
                            fontWeight: FontWeight.w100,
                            fontFamily: "regular"),
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
                    labelStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                      fontFamily: "regular",
                    ),
                    onTap: (newIndex) => cubit.changeIndex(newIndex),
                    labelPadding: EdgeInsets.symmetric(horizontal: size.width * 0.0785),
                    tabs: List.generate(cubit.mainCategoriesModel!.response!.length, (index) => Text(
                      cubit.mainCategoriesModel!.response![index].name!,
                      style: TextStyle(
                          color:
                          cubit.index == index ? mainColor : Colors.black54),
                    ),),
                  ),
                ),
                body: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(cubit.mainCategoriesModel!.response!.length, (index) {
                    return HomeScreen(mainCategoryId: cubit.mainCategoriesModel!.response![index].sId!);
                  }),
                ),
              ),
            );
          }),
    );
  }
}
