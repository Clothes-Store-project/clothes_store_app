import 'package:carousel_slider/carousel_slider.dart';
import 'package:clothes_store_app/models/product_category_model.dart';
import 'package:clothes_store_app/modules/view_data/view_data.dart';
import 'package:clothes_store_app/modules/women/cubit/cubit.dart';
import 'package:clothes_store_app/modules/women/cubit/states.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WomenScreen extends StatelessWidget {
  const WomenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => WomenCubit()..getProductCategory(),
      child: BlocConsumer<WomenCubit, WomenStates>(
          listener: (context, state) {},
          builder: (context, state) {
            WomenCubit cubit = WomenCubit.get(context);
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
                                itemCount: cubit.images.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: size.width * 0.21,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage(
                                            cubit.images[index],
                                          ),
                                        )),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ViewDataScreen()),
                                        );
                                      },
                                      child: const SizedBox(),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                      width: 10.0,
                                    )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: cubit.productCategoryModel!
                                  .productCategory!.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                ProductCategory category = cubit.productCategoryModel!.productCategory![index];
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            category.name!,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16),
                                          ),
                                          InkWell(
                                            onTap: () {},
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
                                    SizedBox(
                                      height: 350.0,
                                      child: ListView.separated(
                                        itemCount: cubit.list2[index].length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index2) {
                                          return Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: SizedBox(
                                              width: size.width * 0.4,
                                              child: InkWell(
                                                onTap: () {},
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              const BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    5),
                                                            topRight:
                                                                Radius.circular(
                                                                    5),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    5),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    5),
                                                          ),
                                                          image:
                                                              DecorationImage(
                                                            image: NetworkImage(
                                                              cubit.list2[index][index2].imageSrc![0]!,
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
                                                      cubit.list2[index][index2].name!,
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                      ),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      cubit.list2[index][index2].desc!,
                                                      style: const TextStyle(
                                                        color: Colors.black45,
                                                        fontSize: 15,
                                                      ),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
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
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        5),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            5),
                                                              ),
                                                              color:
                                                                  Colors.white,
                                                              boxShadow: [
                                                            BoxShadow(
                                                              color: Colors.red,
                                                              spreadRadius: 1,
                                                              blurRadius: 4,
                                                              offset:
                                                                  Offset(0, 0),
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
                                                          textAlign:
                                                              TextAlign.center,
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
                                        separatorBuilder: (context, index2) =>
                                            const SizedBox(
                                          width: 5.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              })
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
