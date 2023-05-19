import 'package:carousel_slider/carousel_slider.dart';
import 'package:clothes_store_app/modules/women/cubit/cubit.dart';
import 'package:clothes_store_app/modules/women/cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WomenScreen extends StatelessWidget {
  const WomenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => WomenCubit(),
      child: BlocConsumer<WomenCubit, WomenStates>(
          listener: (context, state) {},
          builder: (context, state) {
            WomenCubit cubit = WomenCubit.get(context);
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
                      image: AssetImage('assets/img_1.png'),
                      width: double.infinity,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    const Image(
                      image: AssetImage('assets/img.png'),
                      width: double.infinity,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    const Image(
                      image: AssetImage('assets/img_2.png'),
                      width: double.infinity,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "عروض لفترة محدودة",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              "اعرض الكل",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16),
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
                                              'assets/img_3.jpg',
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
                                      "كوتون",
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
                                      "Tencel Shorts High Rise Pocket",
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
                                      child: const Text(
                                        "خصم %50 ",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 15,
                                        ),
                                        textAlign: TextAlign.center,
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
                      image: AssetImage('assets/img_3.png'),
                      width: double.infinity,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 200.0,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 100,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/img_5.jpg',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 20.0,
                          ),
                          itemCount: 3,
                        ),
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
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16),
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
                                                'assets/img_6.jpg',
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
                                        "اديداس اوريجنالز",
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
                                        "بنطال فضفاض",
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
                                        child: const Text(
                                          "خصم %50 ",
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 15,
                                          ),
                                          textAlign: TextAlign.center,
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
                        image: AssetImage('assets/women-nb-desktop-ar.jpg'),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
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
                      condition: Image.asset("img_8.jpg") != null,
                      builder: (context) => builderWidget(),
                      fallback: (context) =>
                          Center(child: CircularProgressIndicator()),
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

Widget builderWidget() {
  return Column(
    children: [
      CarouselSlider(
        items: [
          Image(
            image: AssetImage('assets/img_6.jpg'),
          ),
          Image(
            image: AssetImage('assets/img_5.jpg'),
          ),
          Image(
            image: AssetImage('assets/img_5.jpg'),
          ),
          Image(
            image: AssetImage('assets/img_8.jpg'),
          ),
          Image(
            image: AssetImage('assets/img_5.jpg'),
          ),
        ],
        options: CarouselOptions(
          height: 250.0,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(seconds: 1),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
        ),
      ),
    ],
  );
}
