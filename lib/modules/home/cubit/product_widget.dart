import 'package:clothes_store_app/models/cart_model.dart';
import 'package:clothes_store_app/models/products_model.dart';
import 'package:clothes_store_app/modules/home/cubit/cubit.dart';
import 'package:clothes_store_app/modules/login/login_screen.dart';
import 'package:clothes_store_app/modules/product_details/product_details.dart';
import 'package:clothes_store_app/modules/shopping_cart/cubit/cubit.dart';
import 'package:clothes_store_app/modules/shopping_cart/shopping_cart.dart';
import 'package:clothes_store_app/modules/view_section_product/view_section_product.dart';
import 'package:clothes_store_app/modules/wishlist/cubit/cubit.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:clothes_store_app/shared/network/dio_helper.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatefulWidget {
  final String categoryId;
  final String typeOfProduct;

  const ProductWidget({
    required this.categoryId,
    required this.typeOfProduct,
    super.key,
  });

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  bool isLoading = true;
  bool newIsAdd = true;
  bool newIsWish = true;
  ProductsModel? productsModel;


  Future<void> getProductsHotSale() async {
    try {
      DioHelper.postData(url: "/product/type/${widget.categoryId}", data: {
        "typeOfProduct": widget.typeOfProduct,
      }).then((value) async {
        productsModel = ProductsModel.fromJson(value.data);
        setState(() {
          isLoading = false;
        });
      }).catchError((error) {
        print(error.toString());
      });
    } catch (e) {}
  }

  Future<void> addToCart({
    required String productId,
  }) async {
    try {
      DioHelper.postData(
              url: "/cart",
              data: {
                "product_id": productId,
                "quantity": 1,
              },
              token: token)
          .then((value) async {
      }).whenComplete(() async{
        setState(() {
          cartProductsId.add(productId);
          ShoppingCartCubit.get(context).getDataCart();
        });
      }).catchError((error) {
        print(error.toString());
      });
    } catch (e) {}
  }

  Future<void> addToWish({
    required String productId,
  }) async {
    try {
      DioHelper.postData(
        url: "/wish",
        data: {
          "product_id": productId,
        },
        token: token,
      ).then((value) async {
        setState(() {
          WishlistCubit.get(context).getDataWishlist();
        });
      }).catchError((error) {
        print(error.toString());
      });
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    getProductsHotSale();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return isLoading
        ? Center(
            child: CircularProgressIndicator(
              color: mainColor,
            ),
          )
        : SizedBox(
            height: 350.0,
            child: ListView.separated(
              itemCount: productsModel!.response!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                ProductModel product = productsModel!.response![index];
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    width: size.width * 0.45,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductDetailsScreen(
                                    productId: product.sId!)));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5),
                                  bottomRight: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
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
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      product.desc!.description!,
                                      style: const TextStyle(
                                        color: Colors.black45,
                                        fontSize: 15,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          product.priceBefore!.toString(),
                                          style: const TextStyle(
                                              color: Colors.red,
                                              fontSize: 15,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          product.priceAfter!.toString(),
                                          style: const TextStyle(
                                            color: Colors.green,
                                            fontSize: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            topRight: Radius.circular(5),
                                            bottomLeft: Radius.circular(5),
                                            bottomRight: Radius.circular(5),
                                          ),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.red,
                                              spreadRadius: 1,
                                              blurRadius: 4,
                                              offset: Offset(0, 0),
                                            ),
                                          ]),
                                      width: size.width * 0.2,
                                      height: size.height * 0.03,
                                      child: Center(
                                        child: Text(
                                          "خصم${100 - (product.priceAfter! / product.priceBefore! * 100)}%",
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 15,
                                          ),
                                          maxLines: 1,
                                          textAlign: TextAlign.center,
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
                                          addToCart(
                                            productId: product.sId!,
                                          );
                                        }
                                      },
                                      child: cartProductsId.contains(productsModel!.response![index].sId)? Icon(
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
                                        addToWish(
                                          productId: product.sId!,
                                        );
                                      },
                                      child: wishProductsId.contains(productsModel!.response![index].sId)
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
              separatorBuilder: (context, index2) => const SizedBox(
                width: 5.0,
              ),
            ),
          );
  }
}
