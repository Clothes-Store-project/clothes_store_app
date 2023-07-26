import 'package:clothes_store_app/models/products_model.dart';
import 'package:clothes_store_app/modules/category/cubit/cubit.dart';
import 'package:clothes_store_app/modules/category/cubit/states.dart';
import 'package:clothes_store_app/modules/product_details/product_details.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatelessWidget {
  final String mainCategoryId;

  const CategoryScreen({required this.mainCategoryId, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) =>
          CategoryCubit()..getSubCategory(id: mainCategoryId),
      child: BlocConsumer<CategoryCubit, CategoryStates>(
          listener: (context, state) {},
          builder: (context, state) {
            CategoryCubit cubit = CategoryCubit.get(context);
            return Scaffold(
              backgroundColor: Colors.white,
              body: cubit.isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: mainColor,
                      ),
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.grey.shade300,
                          width: size.width * 0.36,
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: cubit.subCategoryModel!.response!.length,
                            itemBuilder: (context, index) => MaterialButton(
                              onPressed: () {
                                cubit.changeIndex(index);
                              },
                              color: index == cubit.currentIndex
                                  ? Colors.white
                                  : Colors.grey.shade300,
                              focusColor: Colors.white,
                              height: 50,
                              elevation: 0,
                              child: Text(
                                cubit.subCategoryModel!.response![index].name!,
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.black),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                        ),
                        cubit.isLoading2
                            ? SizedBox(
                                width: size.width * 0.63,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: mainColor,
                                  ),
                                ),
                              )
                            : SizedBox(
                                width: size.width * 0.63,
                                child: GridView.builder(
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
                                        width: size.width * 0.3,
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
                                              Row(
                                                children: [
                                                  Text(
                                                    product.priceBefore!
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 15,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    product.priceAfter!
                                                        .toString(),
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
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(5),
                                                      topRight:
                                                          Radius.circular(5),
                                                      bottomLeft:
                                                          Radius.circular(5),
                                                      bottomRight:
                                                          Radius.circular(5),
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
                                                width: 50,
                                                height: 20,
                                                child: Center(
                                                  child: Text(
                                                    "${100 - (product.priceAfter! / product.priceBefore! * 100)}%",
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
                                ),
                              ),
                      ],
                    ),
            );
          }),
    );
  }
}
