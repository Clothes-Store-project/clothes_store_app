import 'package:clothes_store_app/modules/login/cubit/cubit.dart';
import 'package:clothes_store_app/modules/login/cubit/states.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          LoginCubit cubit = LoginCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: Text(
                  "نمشي",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                elevation: 0.5,
                iconTheme: const IconThemeData(
                  color: Colors.black,
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "تسجيل الدخول عبر",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black54,
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                          ),
                                        ],
                                      ),
                                      width: size.width * 0.45,
                                      height: size.height * 0.05,
                                      child: Center(
                                        child: Text(
                                          "فيسبوك",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black54,
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                          ),
                                        ],
                                      ),
                                      width: size.width * 0.45,
                                      height: size.height * 0.05,
                                      child: Center(
                                        child: Text(
                                          "جوجل",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "تسجيل الدخول نمشي الخاص بك",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        cubit.changeIndex();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border(
                                          bottom: BorderSide(
                                              color: cubit.index == 0
                                                  ? mainColor
                                                  : Colors.transparent),
                                        )),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 20),
                                            child: Text(
                                              "الدخول",
                                              style: TextStyle(
                                                color: cubit.index == 0
                                                    ? mainColor
                                                    : Colors.black,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        cubit.changeIndex();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border(
                                          bottom: BorderSide(
                                              color: cubit.index == 1
                                                  ? mainColor
                                                  : Colors.transparent),
                                        )),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 20),
                                            child: Text(
                                              "اشترك معنا",
                                              style: TextStyle(
                                                color: cubit.index == 1
                                                    ? mainColor
                                                    : Colors.black,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              cubit.index == 0
                                  ? Column(
                                      children: [
                                        TextFormField(
                                          controller: cubit.emailController,
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            labelText: 'البريد الالكتروني',
                                            labelStyle: TextStyle(
                                              color: mainColor,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: mainColor,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: mainColor,
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.red,
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                          validator: (String? value) {
                                            if (value!.isEmpty) {
                                              return 'البريد الالكترونى لا يجب ان يكون فارغا';
                                            }
                                            return null;
                                          },
                                          cursorColor: mainColor,
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        TextFormField(
                                          controller: cubit.passwordController,
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                          decoration: InputDecoration(
                                            labelText: 'كلمة السر',
                                            labelStyle: TextStyle(
                                              color: mainColor,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: mainColor,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: mainColor,
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.red,
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.red,
                                              ),
                                            ),
                                            suffixIcon: IconButton(
                                              onPressed: () {
                                                cubit.changeState();
                                              },
                                              icon: Icon(
                                                cubit.isPassword
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          obscureText: cubit.isPassword,
                                          cursorColor: mainColor,
                                          validator: (String? value) {
                                            if (value!.isEmpty) {
                                              return 'كلمة السر لا يجب ان يكون فارغا';
                                            }
                                            return null;
                                          },
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        ConditionalBuilder(
                                          condition:
                                              state is! LoginLoadingState,
                                          builder: (context) => Container(
                                            width: double.infinity,
                                            child: MaterialButton(
                                              onPressed: () {
                                                if (cubit.formKey.currentState!
                                                    .validate()) {
                                                  cubit.userLogin(
                                                    email: cubit
                                                        .emailController.text,
                                                    password: cubit
                                                        .passwordController
                                                        .text,
                                                  );
                                                }
                                              },
                                              color: mainColor,
                                              height: size.height * 0.05,
                                              child: const Text(
                                                'الدخول',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          fallback: (context) => Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Center(
                                          child: InkWell(
                                            onTap: () {},
                                            child: Text(
                                              "هل نسيت كلمة السر؟",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        TextFormField(
                                          controller: cubit.userNameController,
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                          keyboardType:
                                          TextInputType.text,
                                          decoration: InputDecoration(
                                            labelText: 'اسم المستخدم *',
                                            labelStyle: TextStyle(
                                              color: mainColor,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: mainColor,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: mainColor,
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.red,
                                              ),
                                            ),
                                            focusedErrorBorder:
                                            OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                          validator: (String? value) {
                                            if (value!.isEmpty) {
                                              return 'اسم المستخدم لا يجب ان يكون فارغا';
                                            }
                                            return null;
                                          },
                                          cursorColor: mainColor,
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        TextFormField(
                                          controller: cubit.emailController1,
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                          keyboardType:
                                          TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            labelText: 'البريد الالكتروني',
                                            labelStyle: TextStyle(
                                              color: mainColor,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: mainColor,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: mainColor,
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.red,
                                              ),
                                            ),
                                            focusedErrorBorder:
                                            OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                          validator: (String? value) {
                                            if (value!.isEmpty) {
                                              return 'البريد الالكترونى لا يجب ان يكون فارغا';
                                            }
                                            return null;
                                          },
                                          cursorColor: mainColor,
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        TextFormField(
                                          controller: cubit.passwordController1,
                                          keyboardType:
                                          TextInputType.visiblePassword,
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                          decoration: InputDecoration(
                                            labelText: 'كلمة السر',
                                            labelStyle: TextStyle(
                                              color: mainColor,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: mainColor,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: mainColor,
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.red,
                                              ),
                                            ),
                                            focusedErrorBorder:
                                            OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.red,
                                              ),
                                            ),
                                            suffixIcon: IconButton(
                                              onPressed: () {
                                                cubit.changeState();
                                              },
                                              icon: Icon(
                                                cubit.isPassword
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          obscureText: cubit.isPassword,
                                          cursorColor: mainColor,
                                          validator: (String? value) {
                                            if (value!.isEmpty) {
                                              return 'كلمة السر لا يجب ان يكون فارغا';
                                            }
                                            return null;
                                          },
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        TextFormField(
                                          controller: cubit.firstNameController,
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                          keyboardType:
                                              TextInputType.text,
                                          decoration: InputDecoration(
                                            labelText: 'الاسم الاول *',
                                            labelStyle: TextStyle(
                                              color: mainColor,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: mainColor,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: mainColor,
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.red,
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                          validator: (String? value) {
                                            if (value!.isEmpty) {
                                              return 'الاسم الاول لا يجب ان يكون فارغا';
                                            }
                                            return null;
                                          },
                                          cursorColor: mainColor,
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        TextFormField(
                                          controller: cubit.lastNameController,
                                          keyboardType:
                                              TextInputType.text,
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                          decoration: InputDecoration(
                                            labelText: 'اسم العائلة *',
                                            labelStyle: TextStyle(
                                              color: mainColor,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: mainColor,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: mainColor,
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.red,
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                          cursorColor: mainColor,
                                          validator: (String? value) {
                                            if (value!.isEmpty) {
                                              return 'اسم العائلة لا يجب ان يكون فارغا';
                                            }
                                            return null;
                                          },
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        TextFormField(
                                          controller: cubit.telephoneController,
                                          keyboardType:
                                          TextInputType.phone,
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                          decoration: InputDecoration(
                                            labelText: 'رقم الهاتف',
                                            labelStyle: TextStyle(
                                              color: mainColor,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: mainColor,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: mainColor,
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.red,
                                              ),
                                            ),
                                            focusedErrorBorder:
                                            OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                          cursorColor: mainColor,
                                          validator: (String? value) {
                                            if (value!.isEmpty) {
                                              return 'رقم الهاتف لا يجب ان يكون فارغا';
                                            }
                                            return null;
                                          },
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        ConditionalBuilder(
                                          condition:
                                              state is! LoginLoadingState,
                                          builder: (context) => Container(
                                            width: double.infinity,
                                            child: MaterialButton(
                                              onPressed: () {
                                                if (cubit.formKey.currentState!
                                                    .validate()) {
                                                  cubit.userRegister();
                                                }
                                              },
                                              color: mainColor,
                                              height: size.height * 0.05,
                                              child: const Text(
                                                'اشترك منا',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          fallback: (context) => Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Center(
                                          child: InkWell(
                                            onTap: () {},
                                            child: Text(
                                              "هل نسيت كلمة السر؟",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                      ],
                                    )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "راسل خدمة العملاء",
                                      style: TextStyle(
                                        color: Colors.black38,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      "اتصل بنا",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black38,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "اذهب إلى صفحتي",
                                      style: TextStyle(
                                        color: Colors.black38,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      "744 626 800",
                                      style: TextStyle(
                                        color: Colors.black38,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
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
            ),
          );
        },
      ),
    );
  }
}
