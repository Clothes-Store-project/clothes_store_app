import 'package:clothes_store_app/models/cart_model.dart';
import 'package:clothes_store_app/models/products_model.dart';
import 'package:clothes_store_app/modules/shopping_cart/cubit/cubit.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:clothes_store_app/shared/network/dio_helper.dart';
import 'package:flutter/material.dart';

class CartWidget extends StatefulWidget {
  final int index;
  final bool isRemove;
  final CartModel cartModel;

  const CartWidget({
    super.key,
    required this.cartModel,
    required this.index,
    required this.isRemove,
  });

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  bool isLoading = true;
  int counter = 0;
  ProductModel? productModel;

  List<num> z = [];

  @override
  void initState() {
    super.initState();
    if(mounted){
      if(ShoppingCartCubit.get(context).isRemove == true){
        ShoppingCartCubit.get(context).z1 = 0;
      }
      getProducts();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void getProducts(){
    DioHelper.getData(url: "/product/${widget.cartModel.productId}")
        .then((value) {
      productModel = ProductModel.fromJson(value.data);
      setState(() {
        z.add(widget.cartModel.quantity! * productModel!.priceAfter!);
        for (int i = 0; i < z.length; i++) {
          ShoppingCartCubit.get(context).z1 += z[i];
        }
        /*ShoppingCartCubit.get(context)
            .changeTotal(ShoppingCartCubit.get(context).x);*/
        ShoppingCartCubit.get(context)
            .changeTotal(ShoppingCartCubit.get(context).z1);
        print(ShoppingCartCubit.get(context).z1);
        counter = widget.cartModel.quantity!;
        isLoading = false;
      });
    });
  }

  Color hexToColor(String hexString) {
    return Color(int.parse(hexString, radix: 16)).withOpacity(1.0);
  }

  void delete(String id) {
    DioHelper.deleteData(url: "/cart/${widget.cartModel.sId}").then((value) {
      ShoppingCartCubit.get(context).removeCart(id);
      setState(() {
        ShoppingCartCubit.get(context).z1 += -counter * productModel!.priceAfter!;
        print(ShoppingCartCubit.get(context).z1);
        ShoppingCartCubit.get(context)
            .changeTotal(ShoppingCartCubit.get(context).z1);
      });
    }).catchError((error) {
      print(error.toString());
    });
  }

  void plus() {
    print(widget.cartModel.sId);
    DioHelper.putData(
      url: "/cart/plus/${widget.cartModel.sId}",
      token: token,
      data: {},
    ).then((value) {
      setState(() {
        counter++;
        ShoppingCartCubit.get(context).z1 += productModel!.priceAfter!;
        print(ShoppingCartCubit.get(context).z1);
        ShoppingCartCubit.get(context)
            .changeTotal(ShoppingCartCubit.get(context).z1);
      });
    }).catchError((error) {
      print(error.toString());
    });
  }

  void minus() {
    DioHelper.putData(
      url: "/cart/minus/${widget.cartModel.sId}",
      token: token,
      data: {},
    ).then((value) {
      setState(() {
        if (counter > 1) {
          counter--;
          ShoppingCartCubit.get(context).z1 -= productModel!.priceAfter!;
          print(ShoppingCartCubit.get(context).z1);
          ShoppingCartCubit.get(context)
              .changeTotal(ShoppingCartCubit.get(context).z1);
        }
      });
    }).catchError((error) {
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
                      Container(
                        width: size.width * 0.4,
                        child: Text(
                          "${productModel!.name}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'regular',
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      SizedBox(height: 15.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          widget.cartModel.size != ""? Container(
                            width: size.width * 0.15,
                            height: size.height * 0.04,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black,
                            ),
                            child: Center(
                              child: Text(
                                "${widget.cartModel.size}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'regular',
                                ),
                              ),
                            ),
                          ) : SizedBox(height: 15.0,),
                          SizedBox(
                            width: 10.0,
                          ),
                          widget.cartModel.color! != ""? Container(
                            width: size.width * 0.1,
                            height: size.height * 0.04,
                            decoration: BoxDecoration(
                              color: hexToColor(widget.cartModel.color!.replaceAll("#", "")),
                              border: Border.all(color: Colors.black38,),
                            ),
                          ) : SizedBox(),
                        ],
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
                        width: size.width * 0.3,
                        height: size.height * 0.04,
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(color: Colors.black12),
                            left: BorderSide(color: Colors.black12),
                            top: BorderSide(color: Colors.black12),
                            bottom: BorderSide(color: Colors.black12),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: size.width * 0.1,
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: Colors.black12,
                                  ),
                                ),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  minus();
                                },
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "${counter}",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black54,
                                fontFamily: 'regular',
                              ),
                            ),
                            Container(
                              width: size.width * 0.1,
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    color: Colors.black12,
                                  ),
                                ),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  plus();
                                },
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                          ],
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
                          delete(productModel!.sId!);
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
