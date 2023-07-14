import 'package:clothes_store_app/models/products_model.dart';
import 'package:clothes_store_app/modules/product_details/product_details.dart';
import 'package:clothes_store_app/modules/view_section_product/view_section_product.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:clothes_store_app/shared/network/dio_helper.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatefulWidget {
  final String categoryId;
  final String typeOfProduct;

  const ProductWidget(
      {required this.categoryId, required this.typeOfProduct, super.key});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  bool isLoading = true;
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
                    width: size.width * 0.4,
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
                            product.desc!.descreption!,
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
                          const Text(
                            "د.أ. 178",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                            ),
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
                            width: 80,
                            height: 20,
                            child: const Center(
                              child: Text(
                                "خصم %50 ",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                                ),
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
