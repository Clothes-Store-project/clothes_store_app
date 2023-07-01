import 'package:clothes_store_app/modules/item_details/cubit/cubit.dart';
import 'package:clothes_store_app/modules/item_details/cubit/states.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => ItemDetailsCubit(),
      child: BlocConsumer<ItemDetailsCubit, ItemDetailsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            ItemDetailsCubit cubit = ItemDetailsCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                leading: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.clear,
                    color: Colors.black,
                  ),
                ),
                title: Column(
                  children: [
                    Text(
                      "روبرت وود",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "حذاء لوفر رسمي",
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                centerTitle: true,
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
                elevation: 0,
              ),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ImageSlideshow(
                          indicatorColor: mainColor,
                          isLoop: true,
                          children: [
                            Image.asset(
                              'assets/men/img_2.jpg',
                              fit: BoxFit.contain,
                            ),
                            Image.asset(
                              'assets/men/img_2.jpg',
                              fit: BoxFit.contain,
                            ),
                            Image.asset(
                              'assets/men/img_2.jpg',
                              fit: BoxFit.contain,
                            ),
                            Image.asset(
                              'assets/men/img_2.jpg',
                              fit: BoxFit.contain,
                            ),
                            Image.asset(
                              'assets/men/img_2.jpg',
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                        Container(
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "روبرت وود",
                                    style: TextStyle(
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
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    onTap: () {},
                                  ),
                                ],
                              ),
                              Text(
                                "حذاء لوفر رسمي",
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "119 د.إ. ",
                                    style: TextStyle(
                                      color: mainColor,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "(تتصمن ضريبة القيمة المضافة)",
                                    style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: mainColor,
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                      ),
                                    ]),
                                width: 310,
                                height: 30,
                                child: Center(
                                  child: Text(
                                    "اطلب خلال 50 دقيقة واحصل عليها فى 17 يونيو",
                                    style: TextStyle(
                                      color: mainColor,
                                      fontSize: 15,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.warning_amber,
                                    color: Colors.red,
                                    size: 20.0,
                                  ),
                                  Text(
                                    "بقى القليل فقط!",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 20.0),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "اشتر الآن وادفع لاحقا",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "استخدم طرق الدفع هذه فى صفحة الدفع",
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: InkWell(
                                  onTap: () {
                                    cubit.opening();
                                  },
                                  child: cubit.isOpen
                                      ? Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black,
                                                  spreadRadius: 1,
                                                  blurRadius: 1,
                                                ),
                                              ]),
                                          width: double.infinity,
                                          height: size.height * 0.26,
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "قسمها على اربع دفعات بدون فوائد",
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                        Text(
                                                          "اختر تابي فى صفحة الدفع",
                                                          style: TextStyle(
                                                            color: Colors.black54,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Image(
                                                          image: AssetImage(
                                                              "assets/img_18.png"),
                                                          width: 80.0,
                                                        ),
                                                        IconButton(
                                                          onPressed: () {},
                                                          icon: Icon(
                                                            Icons.unfold_less,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Image(
                                                  image: AssetImage(
                                                      "assets/img_21.png"),
                                                  width: double.infinity,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "ستصلك رسائل نصية تذكير قصيرة بشان السداد.يمكنك السداد باستخدام يطاقات الخصم"
                                                  "زالائتمان من ماستركارد أو فيزا",
                                                  style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      : Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black,
                                                  spreadRadius: 1,
                                                  blurRadius: 1,
                                                ),
                                              ]),
                                          width: double.infinity,
                                          height: size.height * 0.08,
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "قسمها على اربع دفعات بدون فوائد",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                    Text(
                                                      "اختر تابي فى صفحة الدفع",
                                                      style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Image(
                                                      image: AssetImage(
                                                          "assets/img_18.png"),
                                                      width: 80.0,
                                                    ),
                                                    IconButton(
                                                      onPressed: () {},
                                                      icon: Icon(
                                                        Icons.unfold_more,
                                                        color: Colors.black,
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
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: InkWell(
                                  onTap: () {
                                    cubit.opening1();
                                  },
                                  child: cubit.isOpen1
                                      ? Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black,
                                                  spreadRadius: 1,
                                                  blurRadius: 1,
                                                ),
                                              ]),
                                          width: double.infinity,
                                          height: size.height * 0.26,
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "قسم فاتورتك على 3 دفعات بدون فوائد",
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                        Text(
                                                          "اختر تمارا فى صفحة الدفع",
                                                          style: TextStyle(
                                                            color: Colors.black54,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Image(
                                                          image: AssetImage(
                                                              "assets/img_19.png"),
                                                          width: 80.0,
                                                        ),
                                                        IconButton(
                                                          onPressed: () {},
                                                          icon: Icon(
                                                            Icons.unfold_less,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Image(
                                                  image: AssetImage(
                                                      "assets/img_22.png"),
                                                  width: double.infinity,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "ستصلك رسائل نصية تذكير قصيرة بشان السداد.يمكنك السداد باستخدام يطاقات الخصم"
                                                  "زالائتمان من ماستركارد أو فيزا",
                                                  style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      : Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.deepOrange,
                                                  spreadRadius: 1,
                                                  blurRadius: 1,
                                                ),
                                              ]),
                                          width: double.infinity,
                                          height: size.height * 0.08,
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "قسم فاتورتك على 3 دفعات بدون فوائد",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                    Text(
                                                      "اختر تمارا فى صفحة الدفع",
                                                      style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Image(
                                                      image: AssetImage(
                                                          "assets/img_19.png"),
                                                      width: 80.0,
                                                    ),
                                                    IconButton(
                                                      onPressed: () {},
                                                      icon: Icon(
                                                        Icons.unfold_more,
                                                        color: Colors.black,
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
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: InkWell(
                                  onTap: () {
                                    cubit.opening2();
                                  },
                                  child: cubit.isOpen2
                                      ? Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black,
                                                  spreadRadius: 1,
                                                  blurRadius: 1,
                                                ),
                                              ]),
                                          width: double.infinity,
                                          height: size.height * 0.276,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                5),
                                                        color: Colors.cyan,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.cyan,
                                                            spreadRadius: 1,
                                                            blurRadius: 1,
                                                          ),
                                                        ]),
                                                    width: 60,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "10%",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 20.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          "خصم",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 20.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 5.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "3 دفعات بدون فوائد",
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                        Text(
                                                          "حدد بوست باي عند السداد",
                                                          style: TextStyle(
                                                            color: Colors.black54,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Image(
                                                        image: AssetImage(
                                                            "assets/img_20.png"),
                                                        width: 80.0,
                                                      ),
                                                      IconButton(
                                                        onPressed: () {},
                                                        icon: Icon(
                                                          Icons.unfold_less,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Image(
                                                image: AssetImage(
                                                    "assets/img_23.png"),
                                                width: double.infinity,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "ستصلك رسائل نصية تذكير قصيرة بشان السداد.يمكنك السداد باستخدام يطاقات الخصم"
                                                "زالائتمان من ماستركارد أو فيزا",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.cyan,
                                                  spreadRadius: 1,
                                                  blurRadius: 1,
                                                ),
                                              ]),
                                          width: double.infinity,
                                          height: size.height * 0.09,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(5),
                                                    color: Colors.cyan,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.cyan,
                                                        spreadRadius: 1,
                                                        blurRadius: 1,
                                                      ),
                                                    ]),
                                                width: 60,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "10%",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "خصم",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15.0, bottom: 5.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "3 دفعات بدون فوائد",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                    Text(
                                                      "حدد بوست باي عند السداد",
                                                      style: TextStyle(
                                                        color: Colors.black38,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Image(
                                                    image: AssetImage(
                                                        "assets/img_20.png"),
                                                    width: 80.0,
                                                  ),
                                                  IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons.unfold_more,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MaterialButton(
                                    onPressed: () {},
                                    child: Text(
                                      "التفاصيل",
                                      style: TextStyle(
                                        color: mainColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  MaterialButton(
                                    onPressed: () {},
                                    child: Text(
                                      "المعلومات وتفاصيل العناية",
                                      style: TextStyle(
                                        color: mainColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
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
                                "تقييمات",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black38,
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                        ),
                                      ]),
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "هل لديك المنتج أو قمت باستخدامه؟",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      Text(
                                        "أخبرنا برأيك من خلال تحديد التقييم",
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      RatingBar.builder(
                                        initialRating: 3,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black38,
                                                  spreadRadius: 1,
                                                  blurRadius: 1,
                                                ),
                                              ]),
                                          width: double.infinity,
                                          child: TextFormField(
                                            controller: cubit.commentController,
                                            keyboardType:
                                                TextInputType.multiline,
                                            maxLines: 5,
                                            maxLength: 500,
                                            textInputAction:
                                                TextInputAction.done,
                                            cursorColor: Colors.black38,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Checkbox(
                                            checkColor: Colors.white,
                                            activeColor: Colors.green,
                                            value: cubit.initValue,
                                            onChanged: (value) {
                                              cubit.changeValue(value);
                                            },
                                          ),
                                          Text(
                                            "اسمح بظهور اسمى فى المراجعات/التعليقات",
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: size.height * 0.055,
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          decoration: BoxDecoration(
                                            color: mainColor,
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: MaterialButton(
                                            onPressed: () {},
                                            height: 50.0,
                                            child: const Text(
                                              'اضف مراجعة/تعليق',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "أوافق على ",
                                              style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 14.0,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child: Text(
                                                "الشروط والاحكام ",
                                                style: TextStyle(
                                                  color: mainColor,
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "للمراجعات/التعليقات",
                                              style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 14.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage:
                                              AssetImage('assets/img_24.png'),
                                          radius: 25,
                                          foregroundColor: Colors.black26,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "روبرت وود",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: size.height * 0.09,
                                      height: size.height * 0.048,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(1.0),
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
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "تابع هذه الماركة لتصلك أحدث إصداراتها وآخر مستجدات تشكيلتها الحالية وغيرها الكثير.",
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: (){},
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
            );
          }),
    );
  }
}
