import 'package:clothes_store_app/modules/login/login_screen.dart';
import 'package:clothes_store_app/modules/product_details/product_details.dart';
import 'package:clothes_store_app/modules/view_section_product/cubit/cubit.dart';
import 'package:clothes_store_app/modules/view_section_product/cubit/states.dart';
import 'package:clothes_store_app/modules/view_super_deals/cubit/cubit.dart';
import 'package:clothes_store_app/modules/view_super_deals/cubit/states.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../models/products_model.dart';

/*class ViewSuperDealsScreen extends StatelessWidget {
  final List<String> productName;

  const ViewSuperDealsScreen({
    Key? key,
    required this.productName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String groupValue = "تخفيضات";
    return BlocProvider(
      create: (BuildContext context) =>
          ViewSuperDealsCubit()..getProducts(categoryId: productName[0]),
      child: BlocConsumer<ViewSuperDealsCubit, ViewSuperDealsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            ViewSuperDealsCubit cubit = ViewSuperDealsCubit.get(context);
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0.5,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black54,
                    ),
                  ),
                  title: TextField(
                    keyboardType: TextInputType.text,
                    controller: cubit.searchController,
                    style: const TextStyle(color: Colors.black54, fontSize: 16),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "نساء",
                        hintStyle:
                            const TextStyle(color: Colors.black, fontSize: 13),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        contentPadding: EdgeInsets.zero,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          color: mainColor,
                          size: 20,
                        )),
                  ),
                ),
                backgroundColor: Colors.white,
                body: cubit.isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: mainColor,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: MaterialButton(
                                      onPressed: () {
                                        showModalBottomSheet<void>(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Directionality(
                                              textDirection: TextDirection.rtl,
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(25),
                                                    topLeft:
                                                        Radius.circular(25),
                                                  ),
                                                ),
                                                height: size.height * 0.5,
                                                child: SizedBox(
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        ListTile(
                                                          leading: const Text(
                                                            "ترتيب",
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              color: Colors
                                                                  .black54,
                                                            ),
                                                          ),
                                                          trailing: IconButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            icon: const Icon(
                                                              Icons
                                                                  .clear_outlined,
                                                              color: Colors
                                                                  .black54,
                                                            ),
                                                          ),
                                                        ),
                                                        const Divider(
                                                          thickness: 0.5,
                                                        ),
                                                        ListTile(
                                                          leading: const Icon(
                                                            Icons
                                                                .local_offer_outlined,
                                                            color:
                                                                Colors.black54,
                                                          ),
                                                          title: const Text(
                                                            "تخفيضات",
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              color: Colors
                                                                  .black87,
                                                            ),
                                                          ),
                                                          trailing: Radio(
                                                            value: "تخفيضات",
                                                            groupValue:
                                                                groupValue,
                                                            onChanged: (Object?
                                                                value) {},
                                                          ),
                                                        ),
                                                        const Divider(
                                                          thickness: 0.5,
                                                        ),
                                                        ListTile(
                                                          leading: const Icon(
                                                            Icons
                                                                .wysiwyg_outlined,
                                                            color:
                                                                Colors.black54,
                                                          ),
                                                          title: const Text(
                                                            "السعر (الاعلى الى الاقل)",
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              color: Colors
                                                                  .black87,
                                                            ),
                                                          ),
                                                          trailing: Radio(
                                                            value:
                                                                "السعر (الاعلى الى الاقل)",
                                                            groupValue:
                                                                groupValue,
                                                            onChanged: (Object?
                                                                value) {},
                                                          ),
                                                        ),
                                                        const Divider(
                                                          thickness: 0.5,
                                                        ),
                                                        ListTile(
                                                          leading: const Icon(
                                                            Icons
                                                                .wysiwyg_outlined,
                                                            color:
                                                                Colors.black54,
                                                          ),
                                                          title: const Text(
                                                            "السعر (الاقل الى الاعلى)",
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              color: Colors
                                                                  .black87,
                                                            ),
                                                          ),
                                                          trailing: Radio(
                                                            value:
                                                                "السعر (الاقل الى الاعلى)",
                                                            groupValue:
                                                                groupValue,
                                                            onChanged: (Object?
                                                                value) {},
                                                          ),
                                                        ),
                                                        const Divider(
                                                          thickness: 0.5,
                                                        ),
                                                        ListTile(
                                                          leading: const Icon(
                                                            Icons
                                                                .local_fire_department_outlined,
                                                            color:
                                                                Colors.black54,
                                                          ),
                                                          title: const Text(
                                                            "جديد",
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              color: Colors
                                                                  .black87,
                                                            ),
                                                          ),
                                                          trailing: Radio(
                                                            value: "جديد",
                                                            groupValue:
                                                                groupValue,
                                                            onChanged: (Object?
                                                                value) {},
                                                          ),
                                                        ),
                                                        const Divider(
                                                          thickness: 0.5,
                                                        ),
                                                        ListTile(
                                                          leading: const Icon(
                                                            Icons
                                                                .saved_search_outlined,
                                                            color:
                                                                Colors.black54,
                                                          ),
                                                          title: const Text(
                                                            "الموصى به",
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              color: Colors
                                                                  .black87,
                                                            ),
                                                          ),
                                                          trailing: Radio(
                                                            value: "الموصى به",
                                                            groupValue:
                                                                groupValue,
                                                            onChanged: (Object?
                                                                value) {},
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Text(
                                        "ترتيب",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                          foreground: Paint()
                                            ..style = PaintingStyle.stroke
                                            ..strokeWidth = 1.5
                                            ..color = mainColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                thickness: 0.5,
                              ),
                              Text(
                                "المنتجات المدرجة: ${cubit.productsModel!.response!.length} منتج",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Column(
                                children: List.generate(
                                  productName.length,
                                  (index) => Column(
                                    children: [
                                      ProductWidget(
                                        categoryId: productName[index],
                                        type: cubit.products[index],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
            );
          }),
    );
  }
}*/
