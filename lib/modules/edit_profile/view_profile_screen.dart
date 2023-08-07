import 'package:clothes_store_app/layout/app_layout.dart';
import 'package:clothes_store_app/models/sub_category_model.dart';
import 'package:clothes_store_app/modules/edit_profile/cubit/cubit.dart';
import 'package:clothes_store_app/modules/edit_profile/cubit/states.dart';
import 'package:clothes_store_app/modules/profile/profile_screen.dart';
import 'package:clothes_store_app/shared/components.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewProfileScreen extends StatelessWidget {
  const ViewProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => EditProfileCubit()..dataUser(),
      child: BlocConsumer<EditProfileCubit, EditProfileStates>(
        listener: (context, state) {},
        builder: (context, state) {
          EditProfileCubit cubit = EditProfileCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                iconTheme: const IconThemeData(
                  color: Colors.black,
                ),
                backgroundColor: Colors.white,
                title: const Text(
                  "اعدادات الحساب",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              body: WillPopScope(
                onWillPop: () async {
                  Navigator.pop(context);
                  return Future.value(true);
                },
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "معلومات الحساب",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () => showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) => Dialog(
                                        child: Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Center(
                                                  child: Text('معلومات الحساب'),
                                                ),
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                TextFormFieldWidget(
                                                  context: context,
                                                  controller:
                                                      cubit.firstNameController,
                                                  type: TextInputType.name,
                                                  labelText: "الاسم الاول*",
                                                  validate: (String? value) {
                                                    if (value!.isEmpty) {
                                                      return 'الاسم الاول لا يجب ان يكون فارغا';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                TextFormFieldWidget(
                                                  context: context,
                                                  controller:
                                                      cubit.lastNameController,
                                                  type: TextInputType.name,
                                                  labelText: "الاسم العائلة*",
                                                  validate: (String? value) {
                                                    if (value!.isEmpty) {
                                                      return 'الاسم العائلة لا يجب ان يكون فارغا';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                TextFormFieldWidget(
                                                  context: context,
                                                  controller:
                                                      cubit.emailController,
                                                  type: TextInputType.phone,
                                                  labelText:
                                                      "البريد الالكتروني*",
                                                  validate: (String? value) {
                                                    if (value!.isEmpty) {
                                                      return 'البريد الالكتروني لا يجب ان يكون فارغا';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                                SizedBox(
                                                  height: 30.0,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      width: size.width * 0.2,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: MaterialButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text(
                                                          "إلغاء",
                                                          style: TextStyle(
                                                            fontSize: 18.0,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: size.width * 0.25,
                                                      decoration: BoxDecoration(
                                                        color: mainColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: MaterialButton(
                                                        onPressed: () {
                                                          cubit.editDataProfile(
                                                              context: context);
                                                        },
                                                        child: Text(
                                                          "تحديث",
                                                          style: TextStyle(
                                                            fontSize: 18.0,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    icon: const Icon(
                                      Icons.edit,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                      border: Border(
                                    bottom: BorderSide(color: Colors.grey),
                                    left: BorderSide(color: Colors.grey),
                                    right: BorderSide(color: Colors.grey),
                                    top: BorderSide(color: Colors.grey),
                                  )),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "الاسم الاول : ${userModel!.respone!.firstName}",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        "اسم العائلة : ${userModel!.respone!.lastName}",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        "البريد الالكتروني : ${userModel!.respone!.email}",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        color: Colors.white,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "رقم الهاتف",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () => showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) => Dialog(
                                        child: Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Center(
                                                  child: Text('رقم الحساب'),
                                                ),
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                TextFormFieldWidget(
                                                  context: context,
                                                  controller:
                                                      cubit.telephoneController,
                                                  type: TextInputType.name,
                                                  labelText: "رقم الهاتف*",
                                                  validate: (String? value) {
                                                    if (value!.isEmpty) {
                                                      return 'رقم الهاتف لا يجب ان يكون فارغا';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                                SizedBox(
                                                  height: 20.0,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      width: size.width * 0.2,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: MaterialButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text(
                                                          "إلغاء",
                                                          style: TextStyle(
                                                            fontSize: 18.0,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: size.width * 0.25,
                                                      decoration: BoxDecoration(
                                                        color: mainColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: MaterialButton(
                                                        onPressed: () {
                                                          cubit.editDataProfile(
                                                              context: context);
                                                        },
                                                        child: Text(
                                                          "تحديث",
                                                          style: TextStyle(
                                                            fontSize: 18.0,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    icon: const Icon(
                                      Icons.edit,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                      border: Border(
                                    bottom: BorderSide(color: Colors.grey),
                                    left: BorderSide(color: Colors.grey),
                                    right: BorderSide(color: Colors.grey),
                                    top: BorderSide(color: Colors.grey),
                                  )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '${userModel!.respone!.telephone}',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        color: Colors.white,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "كلمة السر",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.edit,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                      border: Border(
                                    bottom: BorderSide(color: Colors.grey),
                                    left: BorderSide(color: Colors.grey),
                                    right: BorderSide(color: Colors.grey),
                                    top: BorderSide(color: Colors.grey),
                                  )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '***********',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        color: Colors.white,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: MaterialButton(
                                  height: 50.0,
                                  color: Colors.white70,
                                  onPressed: () {},
                                  child: SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        "حذف حسابي",
                                        style: TextStyle(
                                          color: mainColor,
                                          fontSize: 16,
                                        ),
                                        textAlign: TextAlign.center,
                                      )),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: MaterialButton(
                                  height: 50.0,
                                  color: mainColor,
                                  onPressed: () async {
                                    cubit.logout(context: context);
                                  },
                                  child: const SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        "خروج",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                        textAlign: TextAlign.center,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
