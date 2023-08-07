import 'package:clothes_store_app/modules/login/login_screen.dart';
import 'package:clothes_store_app/modules/product_details/cubit/cubit.dart';
import 'package:clothes_store_app/modules/product_details/cubit/states.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String productId;

  const ProductDetailsScreen({required this.productId, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) =>
          ProductDetailsCubit()..getProduct(id: productId),
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
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.share,
                                        color: Colors.black,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
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
                                              onPressed: () {},
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
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  cubit.productModel!.name!,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                InkWell(
                                                  child: Text(
                                                    "تابع الماركة",
                                                    style: TextStyle(
                                                      color: mainColor,
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  onTap: () {},
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              cubit.productModel!.desc!
                                                  .description!,
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
                                                      const EdgeInsets.all(10),
                                                  child: Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(5),
                                                              topRight: Radius
                                                                  .circular(5),
                                                              bottomLeft: Radius
                                                                  .circular(5),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          5),
                                                            ),
                                                            color: Colors.white,
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
                                                    height: size.height * 0.03,
                                                    child: Center(
                                                      child: Text(
                                                        "خصم${100 - (cubit.productModel!.priceAfter! / cubit.productModel!.priceBefore! * 100)}%",
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
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20.0,
                                      ),
                                      const SizedBox(
                                        height: 10.0,
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
                                                ? SizedBox() : Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          "اللون       ${cubit.productModel!.desc!.color}",
                                                          style: const TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          "النوع      ${cubit.productModel!.desc!.type}",
                                                          style: const TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          "الماركة   ${cubit.productModel!.desc!.brand!.name}",
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
                                      Container(
                                        color: Colors.white,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "تقييمات",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                              ),
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      CircleAvatar(
                                                        backgroundImage: AssetImage(
                                                            'assets/img_24.png'),
                                                        radius: 25,
                                                        foregroundColor:
                                                            Colors.black26,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        "روبرت وود",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    width: size.height * 0.09,
                                                    height: size.height * 0.048,
                                                    clipBehavior: Clip
                                                        .antiAliasWithSaveLayer,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              1.0),
                                                    ),
                                                    child: MaterialButton(
                                                      shape: Border(
                                                        left: BorderSide(
                                                          color: mainColor,
                                                        ),
                                                        right: BorderSide(
                                                          color: mainColor,
                                                        ),
                                                        bottom: BorderSide(
                                                          color: mainColor,
                                                        ),
                                                        top: BorderSide(
                                                          color: mainColor,
                                                        ),
                                                      ),
                                                      onPressed: () {},
                                                      child: Text(
                                                        'تابع',
                                                        style: TextStyle(
                                                          color: mainColor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text(
                                                "تابع هذه الماركة لتصلك أحدث إصداراتها وآخر مستجدات تشكيلتها الحالية وغيرها الكثير.",
                                                style: TextStyle(
                                                  color: Colors.black38,
                                                  fontSize: 14.0,
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
                                                      color: Colors.black38,
                                                      blurRadius: 0.6,
                                                    ),
                                                  ],
                                                ),
                                                width: double.infinity,
                                                height: size.height * 0.05,
                                                child: Center(
                                                  child: Text(
                                                    "عرض كل المنتجات",
                                                    style: TextStyle(
                                                      color: Colors.black38,
                                                      fontSize: 14.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
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
                                  Container(
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
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: (){
                                        if (token == null) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginScreen()),
                                          );
                                        } else {
                                          print(cubit.productModel!.sId);
                                          cubit.addToCart(
                                            productId: cubit.productModel!.sId!,
                                          );
                                        }
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
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
