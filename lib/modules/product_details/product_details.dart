import 'package:clothes_store_app/modules/login/login_screen.dart';
import 'package:clothes_store_app/modules/product_details/cubit/cubit.dart';
import 'package:clothes_store_app/modules/product_details/cubit/states.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String productId;

  const ProductDetailsScreen({required this.productId, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return BlocProvider(
      create: (BuildContext context) =>
      ProductDetailsCubit()
        ..getProduct(id: productId),
      child: BlocConsumer<ProductDetailsCubit, ProductDetailsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            ProductDetailsCubit cubit = ProductDetailsCubit.get(context);
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                body: cubit.isLoading
                    ? Center(
                  child: CircularProgressIndicator(
                    color: mainColor,
                  ),
                )
                    : Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    NestedScrollView(
                      floatHeaderSlivers: true,
                      headerSliverBuilder: (context, innerBoxIsScrolled) {
                        return [
                          SliverAppBar(
                            expandedHeight: size.height * 0.4,
                            backgroundColor: Colors.white,
                            iconTheme: IconThemeData(color: Colors.black),
                            actions: [
                              IconButton(
                                onPressed: () {
                                  Fluttertoast.showToast(
                                    msg: "Product added to cart",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 16,
                                  ).whenComplete(() {
                                    cubit.addToCart(productId: productId);
                                  });
                                },
                                icon: Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                            flexibleSpace: FlexibleSpaceBar(
                              centerTitle: true,
                              title: SafeArea(
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      cubit.productModel!.name!,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              background: Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  SizedBox(
                                    height: size.height * 0.4,
                                    child: ImageSlideshow(
                                      indicatorColor: mainColor,
                                      isLoop: true,
                                      children: List.generate(
                                          cubit.productModel!.imageSrc!
                                              .length, (index) {
                                        return Image.network(
                                          cubit.productModel!
                                              .imageSrc![index],
                                          fit: BoxFit.fill,
                                        );
                                      }),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey.shade300,
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          Fluttertoast.showToast(
                                            msg:
                                            "Product Added to wishlist",
                                            toastLength:
                                            Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.green,
                                            textColor: Colors.white,
                                            fontSize: 16,
                                          ).whenComplete(() {
                                            cubit.addToWish(
                                              productId: cubit
                                                  .productModel!.sId!,
                                            );
                                          });
                                        },
                                        icon: const Icon(Icons
                                            .favorite_outline_outlined),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            floating: true,
                            snap: true,
                            pinned: true,
                          )
                        ];
                      },
                      body: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SafeArea(
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cubit.productModel!.name!,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          cubit.productModel!.desc!
                                              .description!
                                              .replaceAll("\\n", "\n"),
                                          style: const TextStyle(
                                            color: Colors.black38,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  cubit.productModel!
                                                      .priceBefore
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      decoration:
                                                      TextDecoration
                                                          .lineThrough),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  cubit.productModel!
                                                      .priceAfter
                                                      .toString(),
                                                  style: const TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 25,
                                                    fontWeight:
                                                    FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.all(
                                                  10),
                                              child: Container(
                                                decoration:
                                                const BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius
                                                        .only(
                                                      topLeft: Radius
                                                          .circular(
                                                          5),
                                                      topRight: Radius
                                                          .circular(
                                                          5),
                                                      bottomLeft: Radius
                                                          .circular(
                                                          5),
                                                      bottomRight:
                                                      Radius
                                                          .circular(
                                                          5),
                                                    ),
                                                    color:
                                                    Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.red,
                                                        spreadRadius: 1,
                                                        blurRadius: 4,
                                                        offset:
                                                        Offset(0, 0),
                                                      ),
                                                    ]),
                                                width: size.width * 0.2,
                                                height:
                                                size.height * 0.03,
                                                child: Center(
                                                  child: Text(
                                                    "خصم %${100 - (cubit
                                                        .productModel!
                                                        .priceAfter! / cubit
                                                        .productModel!
                                                        .priceBefore! * 100)
                                                        .ceilToDouble()}",
                                                    style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 15,
                                                    ),
                                                    textAlign:
                                                    TextAlign.center,
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
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  color: Colors.white,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              cubit.changeIndex();
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                        color: cubit.index ==
                                                            0
                                                            ? mainColor
                                                            : Colors
                                                            .transparent),
                                                  )),
                                              child: Padding(
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                    vertical: 10,
                                                    horizontal: 20),
                                                child: Text(
                                                  "التفاصيل",
                                                  style: TextStyle(
                                                    color: cubit.index ==
                                                        0
                                                        ? mainColor
                                                        : Colors.black,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              cubit.changeIndex();
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                        color: cubit.index ==
                                                            1
                                                            ? mainColor
                                                            : Colors
                                                            .transparent),
                                                  )),
                                              child: Padding(
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                    vertical: 10,
                                                    horizontal: 20),
                                                child: Text(
                                                  "المعلومات وتفاصيل العناية",
                                                  style: TextStyle(
                                                    color: cubit.index ==
                                                        1
                                                        ? mainColor
                                                        : Colors.black,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        height: 0,
                                      ),
                                      cubit.index == 0
                                          ? SizedBox()
                                          : Padding(
                                        padding:
                                        const EdgeInsets.all(
                                            10),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text(
                                              "اللون",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight:
                                                  FontWeight
                                                      .bold),
                                            ),
                                            Text(
                                              "النوع      ${cubit.productModel!
                                                  .desc!.type}",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight:
                                                  FontWeight
                                                      .bold),
                                            ),
                                            Text(
                                              "الماركة   ${cubit.productModel!
                                                  .desc!.brand!.name}",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight:
                                                  FontWeight
                                                      .bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: List.generate(
                                      cubit.sizeName.length,
                                          (index) =>
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  cubit.changeColorIndex(
                                                      index);
                                                },
                                                child: Container(
                                                  width: size.width * 0.1,
                                                  height: size.height * 0.05,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        20),
                                                    color: Colors.black,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      cubit.sizeName[index],
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                            ],
                                          ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: List.generate(
                                      cubit.index2 == 0
                                          ? cubit.color.length
                                          : cubit.index2 == 1
                                          ? cubit.color2.length
                                          : cubit.index2 == 2
                                          ? cubit.color3.length
                                          : cubit.index2 == 3
                                          ? cubit.color.length
                                          : cubit.index2 == 4
                                          ? cubit.color2.length
                                          : cubit.index2 == 5
                                          ? cubit.color3.length
                                          : cubit.index2 == 6
                                          ? cubit.color.length
                                          : cubit.color2.length,
                                          (index) =>
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  width: size.width * 0.15,
                                                  height: size.height * 0.05,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        20),
                                                    color: cubit.index2 == 0
                                                        ? cubit.color[index]
                                                        : cubit.index2 == 1
                                                        ? cubit.color[index]
                                                        : cubit.index2 == 2
                                                        ? cubit.color[index]
                                                        : cubit.index2 == 3
                                                        ? cubit.color[index]
                                                        : cubit.index2 == 4
                                                        ? cubit.color[index]
                                                        : cubit.index2 == 5
                                                        ? cubit.color[index]
                                                        : cubit.index2 == 6
                                                        ? cubit.color[index]
                                                        : cubit.color[index],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                            ],
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: size.width,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            /*Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey.shade200,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          Text(
                                            "اخترالقياس",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 20),
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.grey,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),*/
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  if (token == null) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LoginScreen()),
                                    );
                                  } else {
                                    print(cubit.productModel!.sId);
                                    Fluttertoast.showToast(
                                      msg: "Product Added to cart",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.green,
                                      textColor: Colors.white,
                                      fontSize: 16,
                                    ).whenComplete(() {
                                      cubit.addToCart(
                                        productId:
                                        cubit.productModel!.sId!,
                                      );
                                    });
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(5),
                                    color: mainColor,
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      "اضف الى حقيبة التسوق",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
