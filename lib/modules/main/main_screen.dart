import 'package:clothes_store_app/modules/main/cubit/cubit.dart';
import 'package:clothes_store_app/modules/main/cubit/states.dart';
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
                  icon: Icon(
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
                      suffixIcon: Icon(
                        Icons.search_outlined,
                        color: Colors.black45,
                      ),
                      hintText: "ابحث عن منج' ماركة أو فئة",
                      filled: true,
                      hintStyle: TextStyle(
                        color: Colors.black54,
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: Colors.black45,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: Colors.black45,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: Colors.black45,
                        ),
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                    ),
                  ),
                ),
                elevation: 0,
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100.0,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => buildStoryItem(),
                          separatorBuilder: (context, index) => SizedBox(
                            width: 10.0,
                          ),
                          itemCount: 10,
                        ),
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

Widget buildStoryItem() => Container(
      width: 100.0,
      child: const Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(
                  'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/1c75ba1d-78f4-4103-8d74-f5c4421a5c8b/primary-mens-dri-fit-versatile-tank-RcQ41g.png',
                ),
              ),
              Center(
                child: Text(
                  "ملابس",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
