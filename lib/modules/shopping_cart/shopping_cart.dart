import 'package:clothes_store_app/modules/proceed_to_checkout/proceed_to_checkout_screen.dart';
import 'package:clothes_store_app/modules/shopping_cart/cart_widget.dart';
import 'package:clothes_store_app/modules/shopping_cart/cubit/cubit.dart';
import 'package:clothes_store_app/modules/shopping_cart/cubit/states.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => ShoppingCartCubit()..getDataCart(),
      child: BlocConsumer<ShoppingCartCubit, ShoppingCartStates>(
          listener: (context, state) {},
          builder: (context, state) {
            ShoppingCartCubit cubit = ShoppingCartCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                leading: SizedBox(),
                backgroundColor: Colors.white,
                centerTitle: true,
                title: Text(
                  "حقيبة التسوق",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'regular',
                  ),
                ),
                leadingWidth: 50,
                elevation: 0.5,
              ),
              body: cubit.isLoading || cubit.cartsModel == null
                  ? Center(
                      child: CircularProgressIndicator(
                        color: mainColor,
                      ),
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              children: List.generate(
                                cubit.cartsModel!.response!.length,
                                (index) => Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      color: Colors.white,
                                      child: CartWidget(
                                        cartModel:
                                            cubit.cartsModel!.response![index],
                                        index: index,
                                        isRemove: cubit.isRemove,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: size.height * 0.13,
                          width: size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              top: BorderSide(
                                color: Colors.black26,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                              right: 15.0,
                              top: 5.0,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'المجموع + الشحن',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        fontFamily: 'regular',
                                      ),
                                    ),
                                    Text(
                                      '${(cubit.total + cubit.x).toStringAsFixed(3)} د.إ.',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        fontFamily: 'regular',
                                      ),
                                    ),
                                  ],
                                ),
                                ConditionalBuilder(
                                  condition: state is! CartLoadingState,
                                  builder: (context) => Container(
                                    width: double.infinity,
                                    child: MaterialButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ProceedToCheckoutScreen(
                                              totalPrice: cubit.total,
                                              cartsModel: cubit.cartsModel!,
                                                  color: '',
                                                  productSize: '',
                                            ),
                                          ),
                                        );
                                      },
                                      color: mainColor,
                                      height: size.height * 0.06,
                                      child: const Text(
                                        'Proceed to Checkout',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                          fontFamily: 'regular',
                                        ),
                                      ),
                                    ),
                                  ),
                                  fallback: (context) => Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
            );
          }),
    );
  }
}
