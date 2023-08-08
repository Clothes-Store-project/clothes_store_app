import 'package:clothes_store_app/modules/wishlist/cubit/cubit.dart';
import 'package:clothes_store_app/modules/wishlist/cubit/states.dart';
import 'package:clothes_store_app/modules/wishlist/wishlist_widget.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => WishlistCubit()..getDataWishlist(),
      child: BlocConsumer<WishlistCubit, WishlistStates>(
          listener: (context, state) {},
          builder: (context, state) {
            WishlistCubit cubit = WishlistCubit.get(context);
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                leading: SizedBox(),
                centerTitle: true,
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
              body: cubit.isLoading || cubit.wishlistModel == null
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
                                cubit.wishlistModel!.response!.length,
                                (index) => Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      color: Colors.white,
                                      child: WishlistWidget(
                                        wishModel: cubit.wishlistModel!.response![index],
                                        index: index,
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
                      ],
                    ),
            );
          }),
    );
  }
}
