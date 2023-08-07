import 'package:clothes_store_app/models/cart_model.dart';
import 'package:clothes_store_app/models/products_model.dart';
import 'package:clothes_store_app/models/wish_model.dart';
import 'package:clothes_store_app/modules/shopping_cart/cubit/cubit.dart';
import 'package:clothes_store_app/modules/wishlist/cubit/cubit.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:clothes_store_app/shared/network/dio_helper.dart';
import 'package:flutter/material.dart';

class WishlistWidget extends StatefulWidget {
  final int index;
  final WishModel wishModel;

  const WishlistWidget({super.key, required this.wishModel, required this.index});

  @override
  State<WishlistWidget> createState() => _WishlistWidgetState();
}

class _WishlistWidgetState extends State<WishlistWidget> {
  bool isLoading = true;
  ProductModel? productModel;

  @override
  void initState() {
    super.initState();
    DioHelper.getData(url: "/product/${widget.wishModel.productId}")
        .then((value) {
      productModel = ProductModel.fromJson(value.data);
      setState(() {
        isLoading = false;
      });
    });
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
          .then((value) async {})
          .catchError((error) {
        print(error.toString()  );
      });
    } catch (e) {}
  }

  void delete(){
    DioHelper.deleteData(url: "/wish/${widget.wishModel.sId}").then((value) {
      WishlistCubit.get(context).removeWishlist(widget.index);
    }).catchError((error){
      print(error.toString());
    });
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
        : Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: size.height * 0.17,
                  width: size.width * 0.21,
                  child: Image(
                    image: NetworkImage("${productModel!.imageSrc![0]}"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${productModel!.name}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'regular',
                        ),
                      ),
                      Text(
                        "${productModel!.desc!.description}",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontFamily: 'regular',
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "السعر: ",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black54,
                              fontFamily: 'regular',
                            ),
                          ),
                          Text(
                            "${productModel!.priceAfter}",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.red,
                              fontFamily: 'regular',
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: size.width * 0.4,
                        height: size.height * 0.04,
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(color: Colors.black12),
                            left: BorderSide(color: Colors.black12),
                            top: BorderSide(color: Colors.black12),
                            bottom: BorderSide(color: Colors.black12),
                          ),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: size.height * 0.05,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              addToCart(productId: productModel!.sId!);
                            },
                            child: const Text(
                              'Add To Cart',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 45.0),
                      child: IconButton(
                        onPressed: () {
                          delete();
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.black26,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
