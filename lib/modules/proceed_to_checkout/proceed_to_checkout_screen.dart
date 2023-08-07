import 'package:clothes_store_app/modules/proceed_to_checkout/cubit/cubit.dart';
import 'package:clothes_store_app/modules/proceed_to_checkout/cubit/states.dart';
import 'package:clothes_store_app/shared/components.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProceedToCheckoutScreen extends StatelessWidget {
  const ProceedToCheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => ProceedToCheckoutCubit(),
      child: BlocConsumer<ProceedToCheckoutCubit, ProceedToCheckoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          ProceedToCheckoutCubit cubit = ProceedToCheckoutCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
                elevation: 0.5,
                centerTitle: true,
                backgroundColor: Colors.white,
                title: Text(
                  "Proceed To Checkout",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      TextFormFieldWidget(
                        controller: cubit.firstNameController,
                        type: TextInputType.name,
                        context: context,
                        labelText: "الاسم الاول",
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "الاسم الاول لا يجب ان يكون فارغا";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormFieldWidget(
                        controller: cubit.lastNameController,
                        type: TextInputType.name,
                        context: context,
                        labelText: "الاسم الاخير",
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "الاسم الاخير لا يجب ان يكون فارغا";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormFieldWidget(
                        controller: cubit.phoneController,
                        type: TextInputType.name,
                        context: context,
                        labelText: "رقم الهاتف",
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "رقم الهاتف لا يجب ان يكون فارغا";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormFieldWidget(
                        controller: cubit.countryController,
                        type: TextInputType.name,
                        context: context,
                        labelText: "الدولة",
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "الدولة لا يجب ان يكون فارغا";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormFieldWidget(
                        controller: cubit.cityController,
                        type: TextInputType.name,
                        context: context,
                        labelText: "المحافظة",
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "المحافظة لا يجب ان يكون فارغا";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormFieldWidget(
                        controller: cubit.addressController,
                        type: TextInputType.name,
                        context: context,
                        labelText: "العنوان",
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "العنوان لا يجب ان يكون فارغا";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormFieldWidget(
                        controller: cubit.zipCodeController,
                        type: TextInputType.name,
                        context: context,
                        labelText: "الرقم البريدي",
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "الرقم البريدي لا يجب ان يكون فارغا";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        width: size.width * 0.5,
                        height: size.height * 0.07,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: MaterialButton(
                          onPressed: () {

                          },
                          child: Text(
                            'Finalize',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
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
