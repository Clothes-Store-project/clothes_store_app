import 'package:clothes_store_app/modules/wishlist/cubit/cubit.dart';
import 'package:clothes_store_app/modules/wishlist/cubit/states.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => WishlistCubit(),
      child: BlocConsumer<WishlistCubit, WishlistStates>(
          listener: (context, state) {},
          builder: (context, state) {
            WishlistCubit cubit = WishlistCubit.get(context);
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: const Text(
                  "قائمة الامنيات",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                leadingWidth: 50,
                elevation: 0.5,
              ),
              body: Padding(
                padding: const EdgeInsets.all(5.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0,left: 10.0,right: 10.0,),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.tealAccent,
                              radius: 50,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "قائمة الامنيات فارغة",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 23,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  "اكتشف ما هو شائع",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      SizedBox(height: 500,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          child: MaterialButton(
                            shape: const Border(
                              left: BorderSide(
                                color: Color.fromRGBO(80, 192, 168, 1),
                              ),
                              right: BorderSide(
                                color: Color.fromRGBO(80, 192, 168, 1),
                              ),
                              bottom: BorderSide(
                                color: Color.fromRGBO(80, 192, 168, 1),
                              ),
                              top: BorderSide(
                                color: Color.fromRGBO(80, 192, 168, 1),
                              ),
                            ),
                            onPressed: () {},
                            height: 50.0,
                            child: const Text(
                              'الاستمرار بالتسوق',
                              style: TextStyle(
                                color: Color.fromRGBO(80, 192, 168, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
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
