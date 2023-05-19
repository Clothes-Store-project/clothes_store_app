import 'package:clothes_store_app/modules/main/cubit/cubit.dart';
import 'package:clothes_store_app/modules/main/cubit/states.dart';
import 'package:clothes_store_app/modules/women/women.dart';
import 'package:clothes_store_app/shared/components.dart';
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
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_alert_outlined,
                    color: Colors.black45,
                  ),
                ),
                title: Container(
                  height: 40.0,
                  child: TextFormField(
                    controller: cubit.searchController,
                    textAlign: TextAlign.end,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.search_outlined,
                        color: Colors.black45,
                      ),
                      hintText: "ابحث عن منج' ماركة أو فئة",
                      filled: true,
                      hintStyle: const TextStyle(
                        color: Colors.black54,
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(
                          color: Colors.black45,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(
                          color: Colors.black45,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(
                          color: Colors.black45,
                        ),
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                    ),
                  ),
                ),
                elevation: 0,
              ),
              body: DefaultTabController(
                length: 6,
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    bottom: TabBar(
                      indicatorColor: Colors.green[300],
                      isScrollable: true,
                      labelStyle: const TextStyle(
                        fontSize: 17,
                      ),
                      labelPadding: const EdgeInsets.symmetric(horizontal: 30),
                      indicatorPadding: const EdgeInsets.symmetric(horizontal: -5),
                      tabs: const [
                        Text(
                          "النساء",
                          style: TextStyle(color: Colors.black54),
                        ),
                        Text(
                          "الرجال",
                          style: TextStyle(color: Colors.black54),
                        ),
                        Text(
                          "ركن الجمال",
                          style: TextStyle(color: Colors.black54),
                        ),
                        Text(
                          "الاطفال",
                          style: TextStyle(color: Colors.black54),
                        ),
                        Text(
                          "بريميوم",
                          style: TextStyle(color: Colors.black54),
                        ),
                        Text(
                          "رياضه",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  body:  const TabBarView(
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
              ),
            );
          }),
    );
  }
}
