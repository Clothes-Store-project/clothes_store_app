import 'package:clothes_store_app/modules/edit_profile/view_profile_screen.dart';
import 'package:clothes_store_app/modules/login/login_screen.dart';
import 'package:clothes_store_app/modules/profile/cubit/cubit.dart';
import 'package:clothes_store_app/modules/profile/cubit/states.dart';
import 'package:clothes_store_app/modules/user_orders/user_orders_screen.dart';
import 'package:clothes_store_app/modules/user_returns/user_returns_screen.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => ProfileCubit()..getDataProfile(),
      child: BlocConsumer<ProfileCubit, ProfileStates>(
          listener: (context, state) {},
          builder: (context, state) {
            ProfileCubit cubit = ProfileCubit.get(context);
            return Scaffold(
              backgroundColor: Colors.grey.shade200,
              appBar: AppBar(
                centerTitle: true,
                leading: SizedBox(),
                backgroundColor: Colors.white,
                title: const Text(
                  "صفحتي",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                leadingWidth: 50,
                elevation: 0.5,
              ),
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          token != null
                              ? cubit.isLoading
                                  ? SizedBox()
                                  : ListTile(
                                      title: Text(
                                        "${userModel!.respone!.username} \n ${userModel!.respone!.email}",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_back_ios_new_outlined,
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ViewProfileScreen(),
                                          ),
                                        );
                                      },
                                    )
                              : Padding(
                                  padding: EdgeInsets.all(10),
                                  child: MaterialButton(
                                    color: mainColor,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()),
                                      );
                                    },
                                    child: const SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          "التسجيل / تسجيل الدخول",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                          textAlign: TextAlign.center,
                                        )),
                                  ),
                                ),
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            UserOrdersScreen(),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: mainColor.withOpacity(0.2),
                                          shape: BoxShape.circle,
                                          border: Border.all(color: mainColor),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Icon(
                                            Icons.car_crash_outlined,
                                            color: mainColor,
                                            size: size.width * 0.1,
                                          ),
                                        ),
                                      ),
                                      Text("Orders")
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            UserReturnsScreen(),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: mainColor.withOpacity(0.2),
                                          shape: BoxShape.circle,
                                          border: Border.all(color: mainColor),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Icon(
                                            Icons.settings_backup_restore,
                                            color: mainColor,
                                            size: size.width * 0.1,
                                          ),
                                        ),
                                      ),
                                      Text("Returns")
                                    ],
                                  ),
                                ),
                                /*Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: mainColor.withOpacity(0.2),
                                        shape: BoxShape.circle,
                                        border: Border.all(color: mainColor),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Icon(
                                          Icons.money_off,
                                          color: mainColor,
                                          size: size.width * 0.1,
                                        ),
                                      ),
                                    ),
                                    Text("محفظة")
                                  ],
                                ),*/
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          /*ListTile(
                            onTap: () {},
                            trailing: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: Colors.grey.shade400,
                            ),
                            title: Text("بطاقة هدية"),
                            leading: Icon(
                              Icons.card_giftcard,
                              color: Colors.grey.shade400,
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            onTap: () {},
                            trailing: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: Colors.grey.shade400,
                            ),
                            title: Text("العنواين المحفوظة"),
                            leading: Icon(
                              Icons.location_on_outlined,
                              color: Colors.grey.shade400,
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            onTap: () {},
                            trailing: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: Colors.grey.shade400,
                            ),
                            title: Text("بطاقات الائتمان المحفوظة"),
                            leading: Icon(
                              Icons.add_card_outlined,
                              color: Colors.grey.shade400,
                            ),
                          ),
                          const Divider(),*/
                          ListTile(
                            onTap: () {},
                            trailing: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: Colors.grey.shade400,
                            ),
                            title: Text("البلد واللغة"),
                            leading: Icon(
                              Icons.language,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ],
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
