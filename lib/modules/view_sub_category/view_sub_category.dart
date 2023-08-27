import 'package:clothes_store_app/modules/login/login_screen.dart';
import 'package:clothes_store_app/modules/product_details/product_details.dart';
import 'package:clothes_store_app/modules/view_sub_category/cubit/cubit.dart';
import 'package:clothes_store_app/modules/view_sub_category/cubit/states.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../models/products_model.dart';

class ViewSubCategoryScreen extends StatelessWidget {
  final String subCategoryId;
  final String subCategoryName;

  const ViewSubCategoryScreen({
    required this.subCategoryId,
    Key? key,
    required this.subCategoryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String groupValue = "تخفيضات";
    return BlocProvider(
      create: (BuildContext context) =>
          ViewSubCategoryCubit()..getProducts(subCategoryId: subCategoryId),
      child: BlocConsumer<ViewSubCategoryCubit, ViewSubCategoryStates>(
          listener: (context, state) {},
          builder: (context, state) {
            ViewSubCategoryCubit cubit = ViewSubCategoryCubit.get(context);
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0.5,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black54,
                    ),
                  ),
                  title: TextField(
                    keyboardType: TextInputType.text,
                    controller: cubit.searchController,
                    style: const TextStyle(color: Colors.black54, fontSize: 16),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "نساء",
                        hintStyle:
                            const TextStyle(color: Colors.black, fontSize: 13),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        contentPadding: EdgeInsets.zero,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          color: mainColor,
                          size: 20,
                        )),
                  ),
                ),
                backgroundColor: Colors.white,
                body: cubit.isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: mainColor,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  subCategoryName,
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const Divider(
                                  thickness: 0.5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: MaterialButton(
                                        onPressed: () {
                                          showModalBottomSheet<void>(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Directionality(
                                                textDirection:
                                                    TextDirection.rtl,
                                                child: Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(25),
                                                      topLeft:
                                                          Radius.circular(25),
                                                    ),
                                                  ),
                                                  height: size.height * 0.5,
                                                  child: SizedBox(
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          ListTile(
                                                            leading: const Text(
                                                              "ترتيب",
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .black54,
                                                              ),
                                                            ),
                                                            trailing:
                                                                IconButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              icon: const Icon(
                                                                Icons
                                                                    .clear_outlined,
                                                                color: Colors
                                                                    .black54,
                                                              ),
                                                            ),
                                                          ),
                                                          const Divider(
                                                            thickness: 0.5,
                                                          ),
                                                          ListTile(
                                                            onTap: (){
                                                              cubit.changeIndex(0);
                                                              print(cubit.isSelected);
                                                            },
                                                            leading: const Icon(
                                                              Icons
                                                                  .local_offer_outlined,
                                                              color: Colors
                                                                  .black54,
                                                            ),
                                                            title: const Text(
                                                              "تخفيضات",
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .black87,
                                                              ),
                                                            ),
                                                            trailing: cubit
                                                                .isSelected == 0
                                                                ? Icon(Icons
                                                                .radio_button_checked,color: Colors.blue,)
                                                                : Icon(Icons
                                                                .radio_button_off),
                                                          ),
                                                          const Divider(
                                                            thickness: 0.5,
                                                          ),
                                                          ListTile(
                                                            onTap: (){
                                                              cubit.changeIndex(1);
                                                              print(cubit.isSelected);
                                                            },
                                                            leading: const Icon(
                                                              Icons
                                                                  .wysiwyg_outlined,
                                                              color: Colors
                                                                  .black54,
                                                            ),
                                                            title: const Text(
                                                              "السعر (الاعلى الى الاقل)",
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .black87,
                                                              ),
                                                            ),
                                                            trailing: cubit
                                                                .isSelected == 1
                                                                ? Icon(Icons
                                                                .radio_button_checked,color: Colors.blue,)
                                                                : Icon(Icons
                                                                .radio_button_off),
                                                          ),
                                                          const Divider(
                                                            thickness: 0.5,
                                                          ),
                                                          ListTile(
                                                            onTap: (){
                                                              cubit.changeIndex(2);
                                                              print(2);
                                                            },
                                                            leading: const Icon(
                                                              Icons
                                                                  .wysiwyg_outlined,
                                                              color: Colors
                                                                  .black54,
                                                            ),
                                                            title: const Text(
                                                              "السعر (الاقل الى الاعلى)",
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .black87,
                                                              ),
                                                            ),
                                                            trailing: cubit
                                                                .isSelected == 2
                                                                ? Icon(Icons
                                                                .radio_button_checked,color: Colors.blue,)
                                                                : Icon(Icons
                                                                .radio_button_off),
                                                          ),
                                                          const Divider(
                                                            thickness: 0.5,
                                                          ),
                                                          ListTile(
                                                            onTap: (){
                                                              print(3);
                                                              cubit.changeIndex(3);
                                                            },
                                                            leading: const Icon(
                                                              Icons
                                                                  .local_fire_department_outlined,
                                                              color: Colors
                                                                  .black54,
                                                            ),
                                                            title: const Text(
                                                              "جديد",
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .black87,
                                                              ),
                                                            ),
                                                            trailing: cubit
                                                                .isSelected == 3
                                                                ? Icon(Icons
                                                                .radio_button_checked,color: Colors.blue,)
                                                                : Icon(Icons
                                                                .radio_button_off),
                                                          ),
                                                          const Divider(
                                                            thickness: 0.5,
                                                          ),
                                                          ListTile(
                                                            onTap: (){
                                                              print(4);
                                                              cubit.changeIndex(4);
                                                            },
                                                            leading: const Icon(
                                                              Icons
                                                                  .saved_search_outlined,
                                                              color: Colors
                                                                  .black54,
                                                            ),
                                                            title: const Text(
                                                              "الموصى به",
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .black87,
                                                              ),
                                                            ),
                                                            trailing: cubit
                                                                .isSelected == 4
                                                                ? Icon(Icons
                                                                .radio_button_checked,color: Colors.blue,)
                                                                : Icon(Icons
                                                                .radio_button_off),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Text(
                                          "ترتيب",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            foreground: Paint()
                                              ..style = PaintingStyle.stroke
                                              ..strokeWidth = 1.5
                                              ..color = mainColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  thickness: 0.5,
                                ),
                                Text(
                                  "المنتجات المدرجة: ${cubit.productsModel!.response!.length} منتج",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.6,
                                  ),
                                  itemCount:
                                      cubit.productsModel!.response!.length,
                                  itemBuilder: (context, index) {
                                    ProductModel product =
                                        cubit.productsModel!.response![index];
                                    return Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: SizedBox(
                                        height: 250,
                                        width: size.width * 0.33,
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ProductDetailsScreen(
                                                            productId:
                                                                product.sId!)));
                                          },
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(5),
                                                      topRight:
                                                          Radius.circular(5),
                                                      bottomRight:
                                                          Radius.circular(5),
                                                      bottomLeft:
                                                          Radius.circular(5),
                                                    ),
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                        product.imageSrc![0]!,
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          product.name!,
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 15,
                                                          ),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          product.desc!
                                                              .description!,
                                                          style:
                                                              const TextStyle(
                                                            color:
                                                                Colors.black45,
                                                            fontSize: 15,
                                                          ),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              product
                                                                  .priceBefore!
                                                                  .toString(),
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .red,
                                                                  fontSize: 15,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .lineThrough),
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              product
                                                                  .priceAfter!
                                                                  .toString(),
                                                              style:
                                                                  const TextStyle(
                                                                color: Colors
                                                                    .green,
                                                                fontSize: 25,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
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
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            5),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            5),
                                                                  ),
                                                                  color: Colors
                                                                      .white,
                                                                  boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .red,
                                                                  spreadRadius:
                                                                      1,
                                                                  blurRadius: 4,
                                                                  offset:
                                                                      Offset(
                                                                          0, 0),
                                                                ),
                                                              ]),
                                                          width:
                                                              size.width * 0.25,
                                                          height: size.height *
                                                              0.03,
                                                          child: Center(
                                                            child: Text(
                                                              "خصم %${100 - (product.priceAfter! / product.priceBefore! * 100).ceilToDouble()}",
                                                              style: TextStyle(
                                                                color:
                                                                    Colors.red,
                                                                fontSize: 15,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: size.width * 0.1,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(10),
                                                          color: mainColor,
                                                        ),
                                                        child: TextButton(
                                                          onPressed: () {
                                                            if (token == null) {
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (context) =>
                                                                        LoginScreen()),
                                                              );
                                                            } else {
                                                              print(product.sId);
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
                                                                  productId: product.sId!,
                                                                );
                                                              });
                                                            }
                                                          },
                                                          child: cartProductsId.contains(
                                                              product.sId)
                                                              ? Icon(
                                                            Icons.done,
                                                            color: Colors.white,
                                                          )
                                                              : Icon(
                                                            Icons.add,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10.0,
                                                      ),
                                                      Container(
                                                        width: size.width * 0.1,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(10),
                                                          color: mainColor,
                                                        ),
                                                        child: TextButton(
                                                          onPressed: () {
                                                            print(product.sId);
                                                            Fluttertoast.showToast(
                                                              msg: "Product Added to wishlist",
                                                              toastLength: Toast.LENGTH_SHORT,
                                                              gravity: ToastGravity.BOTTOM,
                                                              timeInSecForIosWeb: 1,
                                                              backgroundColor: Colors.green,
                                                              textColor: Colors.white,
                                                              fontSize: 16,
                                                            ).whenComplete(() {
                                                              cubit.addToWish(
                                                                productId: product.sId!,
                                                              );
                                                            });
                                                          },
                                                          child: wishProductsId.contains(
                                                              product.sId)
                                                              ? Icon(
                                                            Icons.favorite,
                                                            color: Colors.redAccent,
                                                          )
                                                              : Icon(
                                                            Icons.favorite_border_outlined,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
              ),
            );
          }),
    );
  }
}
