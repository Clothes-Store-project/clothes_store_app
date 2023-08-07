import 'package:clothes_store_app/modules/order_details/order_details_screen.dart';
import 'package:clothes_store_app/modules/user_orders/cubit/cubit.dart';
import 'package:clothes_store_app/modules/user_orders/cubit/states.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserOrdersScreen extends StatelessWidget {
  const UserOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => UserOrdersCubit()..getDataOrder(),
      child: BlocConsumer<UserOrdersCubit, UserOrdersStates>(
        listener: (context, state) {},
        builder: (context, state) {
          UserOrdersCubit cubit = UserOrdersCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
                backgroundColor: Colors.white,
                centerTitle: true,
                title: const Text(
                  "Orders",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                elevation: 0.5,
              ),
              body: cubit.isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: mainColor,
                      ),
                    )
                  : Directionality(
                      textDirection: TextDirection.ltr,
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: cubit.orderModel.length,
                        itemBuilder: (context, index) => ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Order Number: ${cubit.orderModel[index].sId}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                ),
                                softWrap: false,
                              ),
                              Text(
                                "States: ${cubit.orderModel[index].status}",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18.0,
                                ),
                                maxLines: 1,
                              ),
                            ],
                          ),
                          subtitle: Text(
                            "${cubit.orderModel[index].payment} ${cubit.orderModel[index].totalPrice}",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18.0,
                            ),
                            maxLines: 1,
                          ),
                          trailing: Icon(
                            Icons.arrow_back_ios_new_outlined,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OrderDetailsScreen(
                                  orderModel: cubit.orderModel[index],
                                ),
                              ),
                            );
                          },
                        ),
                        separatorBuilder: (context, int index) => Divider(
                          thickness: 1.5,
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
