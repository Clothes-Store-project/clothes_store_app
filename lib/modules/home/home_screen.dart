import 'package:carousel_slider/carousel_slider.dart';
import 'package:clothes_store_app/models/product_category_model.dart';
import 'package:clothes_store_app/models/products_model.dart';
import 'package:clothes_store_app/modules/home/cubit/product_widget.dart';
import 'package:clothes_store_app/modules/view_section_product/view_section_product.dart';
import 'package:clothes_store_app/modules/view_sub_category/view_sub_category.dart';
import 'package:clothes_store_app/modules/home/cubit/cubit.dart';
import 'package:clothes_store_app/modules/home/cubit/states.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final String mainCategoryId;
  const HomeScreen({required this.mainCategoryId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => HomeCubit()..getSubCategory(id: mainCategoryId),
      child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            HomeCubit cubit = HomeCubit.get(context);
            return Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: cubit.isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: mainColor,
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 100.0,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: cubit.subCategoryModel!.response!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Container(
                                      width: size.width * 0.21,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: mainColor
                                      ),
                                      child: Center(
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ViewSubCategoryScreen(subCategoryId: cubit.subCategoryModel!.response![index].sId!)),
                                            );
                                          },
                                          child: Text(cubit.subCategoryModel!.response![index].name!, style: TextStyle(color: Colors.white),),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                      width: 10.0,
                                    )),
                          ),
                          Column(
                            children: List.generate(cubit.products.length, (index) => Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        cubit.products[index],
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(
                                              builder: (context) =>
                                                  ViewSectionProductScreen(
                                                      categoryId: mainCategoryId,
                                                      typeOfProduct: cubit.products[index])));
                                        },
                                        child: const Text(
                                          "اعرض الكل",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                ProductWidget(categoryId: mainCategoryId, typeOfProduct: cubit.products[index])
                              ],
                            )),
                          )
                        ],
                      ),
              ),
            );
          }),
    );
  }
}

Widget builderWidget(
  String img1,
  String img2,
  String img3,
  String img4,
  String img5,
) {
  return Column(
    children: [
      CarouselSlider(
        items: [
          Image(
            image: AssetImage(img1),
          ),
          Image(
            image: AssetImage(img2),
          ),
          Image(
            image: AssetImage(img3),
          ),
          Image(
            image: AssetImage(img4),
          ),
          Image(
            image: AssetImage(img5),
          ),
        ],
        options: CarouselOptions(
          viewportFraction: 0.4,
          height: 250.0,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(seconds: 1),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
        ),
      ),
    ],
  );
}
