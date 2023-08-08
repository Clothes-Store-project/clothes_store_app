import 'package:clothes_store_app/modules/returns_details/return_details_screen.dart';
import 'package:clothes_store_app/modules/user_returns/cubit/cubit.dart';
import 'package:clothes_store_app/modules/user_returns/cubit/states.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserReturnsScreen extends StatelessWidget {
  const UserReturnsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => UserReturnsCubit()..getDataReturns(),
      child: BlocConsumer<UserReturnsCubit, UserReturnsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          UserReturnsCubit cubit = UserReturnsCubit.get(context);
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
                  "Returns",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              body: cubit.isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: mainColor,
                      ),
                    )
                  : Directionality(
                      textDirection: TextDirection.ltr,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: ListView.builder(
                          itemCount: cubit.orderModel.length,
                          shrinkWrap: true,
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
                                  "Status: ${cubit.orderModel[index].returnrequest}",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 18.0,
                                  ),
                                  softWrap: false,
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
                                  builder: (context) => ReturnsDetailsScreen(
                                    orderModel: cubit.orderModel[index],
                                    status:
                                        cubit.orderModel[index].returnrequest!,
                                  ),
                                ),
                              );
                            },
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
