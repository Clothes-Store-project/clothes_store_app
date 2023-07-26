import 'package:clothes_store_app/models/cart_model.dart';
import 'package:clothes_store_app/models/products_model.dart';
import 'package:clothes_store_app/modules/shopping_cart/cubit/cubit.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:clothes_store_app/shared/network/dio_helper.dart';
import 'package:flutter/material.dart';

class CartWidget extends StatefulWidget {
  final int index;
  final CartModel cartModel;

  const CartWidget({super.key, required this.cartModel, required this.index});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

void plusCounter(){

}

class _CartWidgetState extends State<CartWidget> {
  bool isLoading = true;
  int counter = 0;
  ProductModel? productModel;

  @override
  void initState() {
    super.initState();
    DioHelper.getData(url: "/product/${widget.cartModel.productId}")
        .then((value) {
      productModel = ProductModel.fromJson(value.data);
      setState(() {
        counter = widget.cartModel.quantity!;
        isLoading = false;
      });
    });
  }

  void delete(){
    DioHelper.deleteData(url: "/cart/${widget.cartModel.sId}").then((value) {
      ShoppingCartCubit.get(context).removeCart(widget.index);
    }).catchError((error){
      print(error.toString());
    });
  }

  void plus(){
    print(widget.cartModel.sId);
    DioHelper.putData(url: "/cart/plus/${widget.cartModel.sId}", token: token, data: {}).then((value) {
      setState(() {
        counter++;
      });
      print(value.data);
    }).catchError((error){
      print(error.toString());
    });
  }

  void minus(){
    DioHelper.putData(url: "/cart/minus/${widget.cartModel.sId}", token: token, data: {}).then((value) {
      setState(() {
          counter--;
      });
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
                  height: 150.0,
                  width: 90.0,
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
                        "${productModel!.desc!.descreption}",
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
                              width: 35.0,
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: Colors.black12,
                                  ),
                                ),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  if(counter > 1){
                                    minus();
                                  }
                                },
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                    fontSize: 20.0,
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
                              width: 35.0,
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
                                    fontSize: 20.0,
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
                      padding: const EdgeInsets.only(right: 50.0),
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
