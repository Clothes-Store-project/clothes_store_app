import 'package:carousel_slider/carousel_slider.dart';
import 'package:clothes_store_app/modules/kids/cubit/cubit.dart';
import 'package:clothes_store_app/modules/kids/cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KidsScreen extends StatelessWidget {
  const KidsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => KidsCubit(),
      child: BlocConsumer<KidsCubit, KidsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            KidsCubit cubit = KidsCubit.get(context);
            return Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Column(
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
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                                width: 10.0,
                              )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Image(
                      image: AssetImage('assets/kids/img_1.jpg'),
                      width: double.infinity,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: double.infinity,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "ماركات تتصدر القائمة",
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "مختارة بعناية لتلبى احتياجاتك",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ConditionalBuilder(
                      condition: Image.asset("assets/kids/img_2.jpg") != null,
                      builder: (context) => builderWidget(
                        "assets/kids/img_2.jpg",
                        "assets/kids/img_3.jpg",
                        "assets/kids/img_4.jpg",
                        "assets/kids/img_2.jpg",
                        "assets/kids/img_3.jpg",
                      ),
                      fallback: (context) =>
                      const Center(child: CircularProgressIndicator()),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "الاكثر مبيعا",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              "اعرض الكل",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 350.0,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5),
                            child: SizedBox(
                              width: size.width * 0.33,
                              child: InkWell(
                                onTap: () {},
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            topRight: Radius.circular(5),
                                            bottomRight: Radius.circular(5),
                                            bottomLeft: Radius.circular(5),
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              'assets/kids/img_5.jpg',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      "فيلورجا",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      "كريم سكن يونيفاى 50 مل",
                                      style: TextStyle(
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
                                      "د.أ. 452",
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
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 5.0,
                        ),
                        itemCount: 8,
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    const Image(
                      image: AssetImage('assets/men/img_3.jpg'),
                      width: double.infinity,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(
                            image: AssetImage('assets/men/img_4.jpg'),
                            width: 115,
                          ),
                          Image(
                            image: AssetImage('assets/men/img_4.jpg'),
                            width: 115,
                          ),
                          Image(
                            image: AssetImage('assets/men/img_4.jpg'),
                            width: 115,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "أفضل مختارات الملابس",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              "اعرض الكل",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                        height: 350.0,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(
                                width: size.width * 0.33,
                                child: InkWell(
                                  onTap: () {},
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              topRight: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
                                              bottomLeft: Radius.circular(5),
                                            ),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                'assets/men/img_5.jpg',
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text(
                                        "سفنتي فايف بيسيكس",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text(
                                        "تيشرت كت كاجوال",
                                        style: TextStyle(
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
                                        "د.أ. 13",
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
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 5.0,
                          ),
                          itemCount: 8,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      child: const Image(
                        image: AssetImage('assets/men/img_6.jpg'),
                        width: double.infinity,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: double.infinity,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "ماركات تتصدر القائمة",
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "مختارة بعناية لتلبى احتياجاتك",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ConditionalBuilder(
                      condition: Image.asset("assets/men/img_7.jpg") != null,
                      builder: (context) => builderWidget(
                        "assets/men/img_7.jpg",
                        "assets/men/img_8.jpg",
                        "assets/men/img_9.jpg",
                        "assets/men/img_10.jpg",
                        "assets/men/img_7.jpg",
                      ),
                      fallback: (context) =>
                          const Center(child: CircularProgressIndicator()),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      child: const Image(
                        image: AssetImage('assets/men/img_11.jpg'),
                        width: double.infinity,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      child: const Image(
                        image: AssetImage('assets/men/img_12.jpg'),
                        width: double.infinity,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      child: const Image(
                        image: AssetImage('assets/men/img_13.jpg'),
                        width: double.infinity,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      child: const Image(
                        image: AssetImage('assets/men/img_14.jpg'),
                        width: double.infinity,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(
                            image: AssetImage('assets/men/img_4.jpg'),
                            width: 115,
                          ),
                          Image(
                            image: AssetImage('assets/men/img_4.jpg'),
                            width: 115,
                          ),
                          Image(
                            image: AssetImage('assets/men/img_4.jpg'),
                            width: 115,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "افضل مختارات التصاميم الرياضية",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              "اعرض الكل",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                        height: 350.0,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(
                                width: size.width * 0.33,
                                child: InkWell(
                                  onTap: () {},
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              topRight: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
                                              bottomLeft: Radius.circular(5),
                                            ),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                'assets/men/img_15.jpg',
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text(
                                        "اديداس",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text(
                                        "شبشب بشعار الماركة للجنسين",
                                        style: TextStyle(
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
                                        "د.أ. 84",
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
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 5.0,
                          ),
                          itemCount: 8,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: double.infinity,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "أختيارت المحرر لهذا الشهر",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'منتجات وستايلات ترحب بالموسم انتقاها خبراء الموضة من'
                                  '\nمختلف الفئات لك خصيصا لتغطى احتياجاتك هذا الموسم.',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ConditionalBuilder(
                      condition: Image.asset("assets/men/img_16.jpg") != null,
                      builder: (context) => builderWidget(
                        "assets/men/img_16.jpg",
                        "assets/men/img_17.jpg",
                        "assets/men/img_18.jpg",
                        "assets/men/img_16.jpg",
                        "assets/men/img_17.jpg",
                      ),
                      fallback: (context) =>
                          const Center(child: CircularProgressIndicator()),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
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
