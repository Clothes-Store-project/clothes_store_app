import 'package:clothes_store_app/modules/login/login_screen.dart';
import 'package:clothes_store_app/modules/product_details/product_details.dart';
import 'package:clothes_store_app/modules/view_section_product/cubit/cubit.dart';
import 'package:clothes_store_app/modules/view_section_product/cubit/states.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/products_model.dart';

class ViewSectionProductScreen extends StatelessWidget {
  final String categoryId;
  final String typeOfProduct;
  const ViewSectionProductScreen({required this.categoryId, required this.typeOfProduct, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String groupValue = "تخفيضات";
    return BlocProvider(
      create: (BuildContext context) => ViewSectionProductCubit()..getProducts(categoryId: categoryId, typeOfProduct: typeOfProduct),
      child: BlocConsumer<ViewSectionProductCubit, ViewSectionProductStates>(
          listener: (context, state) {},
          builder: (context, state) {
            ViewSectionProductCubit cubit = ViewSectionProductCubit.get(context);
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
                body: cubit.isLoading? Center(child: CircularProgressIndicator(color: mainColor,),) : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(25),
                                              topLeft: Radius.circular(25),
                                            ),
                                          ),
                                          height: size.height * 0.5,
                                          child: SizedBox(
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  ListTile(
                                                    leading: const Text(
                                                      "ترتيب",
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black54,
                                                      ),
                                                    ),
                                                    trailing: IconButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      icon: const Icon(
                                                        Icons.clear_outlined,
                                                        color: Colors.black54,
                                                      ),
                                                    ),
                                                  ),
                                                  const Divider(
                                                    thickness: 0.5,
                                                  ),
                                                  ListTile(
                                                    leading: const Icon(
                                                      Icons.local_offer_outlined,
                                                      color: Colors.black54,
                                                    ),
                                                    title: const Text(
                                                      "تخفيضات",
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black87,
                                                      ),
                                                    ),
                                                    trailing: Radio(
                                                      value: "تخفيضات",
                                                      groupValue: groupValue,
                                                      onChanged:
                                                          (Object? value) {},
                                                    ),
                                                  ),
                                                  const Divider(
                                                    thickness: 0.5,
                                                  ),
                                                  ListTile(
                                                    leading: const Icon(
                                                      Icons.wysiwyg_outlined,
                                                      color: Colors.black54,
                                                    ),
                                                    title: const Text(
                                                      "السعر (الاعلى الى الاقل)",
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black87,
                                                      ),
                                                    ),
                                                    trailing: Radio(
                                                      value:
                                                          "السعر (الاعلى الى الاقل)",
                                                      groupValue: groupValue,
                                                      onChanged:
                                                          (Object? value) {},
                                                    ),
                                                  ),
                                                  const Divider(
                                                    thickness: 0.5,
                                                  ),
                                                  ListTile(
                                                    leading: const Icon(
                                                      Icons.wysiwyg_outlined,
                                                      color: Colors.black54,
                                                    ),
                                                    title: const Text(
                                                      "السعر (الاقل الى الاعلى)",
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black87,
                                                      ),
                                                    ),
                                                    trailing: Radio(
                                                      value:
                                                          "السعر (الاقل الى الاعلى)",
                                                      groupValue: groupValue,
                                                      onChanged:
                                                          (Object? value) {},
                                                    ),
                                                  ),
                                                  const Divider(
                                                    thickness: 0.5,
                                                  ),
                                                  ListTile(
                                                    leading: const Icon(
                                                      Icons
                                                          .local_fire_department_outlined,
                                                      color: Colors.black54,
                                                    ),
                                                    title: const Text(
                                                      "جديد",
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black87,
                                                      ),
                                                    ),
                                                    trailing: Radio(
                                                      value: "جديد",
                                                      groupValue: groupValue,
                                                      onChanged:
                                                          (Object? value) {},
                                                    ),
                                                  ),
                                                  const Divider(
                                                    thickness: 0.5,
                                                  ),
                                                  ListTile(
                                                    leading: const Icon(
                                                      Icons.saved_search_outlined,
                                                      color: Colors.black54,
                                                    ),
                                                    title: const Text(
                                                      "الموصى به",
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black87,
                                                      ),
                                                    ),
                                                    trailing: Radio(
                                                      value: "الموصى به",
                                                      groupValue: groupValue,
                                                      onChanged:
                                                          (Object? value) {},
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
                                    fontSize: 16,
                                    color: mainColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: MaterialButton(
                                onPressed: () {
                                  showModalBottomSheet<void>(
                                    context: context,
                                    builder: (_) {
                                      return Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(25),
                                              topLeft: Radius.circular(25),
                                            ),
                                          ),
                                          height: size.height * 0.5,
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 15, right: 15),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      const Text(
                                                        "تصفية",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.black87,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {},
                                                        child: const Text(
                                                          "مسح",
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const Divider(thickness: 0.3),
                                                ListTile(
                                                  leading: const Text(
                                                    "الفئة",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black87,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  trailing: const Icon(
                                                    Icons.arrow_back_ios_outlined,
                                                    color: Colors.black87,
                                                  ),
                                                  onTap: () {},
                                                ),
                                                const Divider(thickness: 0.5),
                                                ListTile(
                                                  leading: const Text(
                                                    "الماركات",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black87,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  trailing: const Icon(
                                                    Icons.arrow_back_ios_outlined,
                                                    color: Colors.black87,
                                                  ),
                                                  onTap: () {},
                                                ),
                                                const Divider(thickness: 0.5),
                                                ListTile(
                                                  leading: const Text(
                                                    "الألوان",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black87,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  trailing: const Icon(
                                                    Icons.arrow_back_ios_outlined,
                                                    color: Colors.black87,
                                                  ),
                                                  onTap: () {},
                                                ),
                                                const Divider(thickness: 0.5),
                                                ListTile(
                                                  leading: const Text(
                                                    "الاحجام",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black87,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  trailing: const Icon(
                                                    Icons.arrow_back_ios_outlined,
                                                    color: Colors.black87,
                                                  ),
                                                  onTap: () {},
                                                ),
                                                const Divider(thickness: 0.5),
                                                ListTile(
                                                  leading: const Text(
                                                    "أسعار",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black87,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  trailing: const Icon(
                                                    Icons.arrow_back_ios_outlined,
                                                    color: Colors.black87,
                                                  ),
                                                  onTap: () {},
                                                ),
                                                const Divider(thickness: 0.5),
                                                ListTile(
                                                  leading: const Text(
                                                    "المواد المستخدمة",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black87,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  trailing: const Icon(
                                                    Icons.arrow_back_ios_outlined,
                                                    color: Colors.black87,
                                                  ),
                                                  onTap: () {},
                                                ),
                                                const Divider(thickness: 0.5),
                                                ListTile(
                                                  leading: const Text(
                                                    "الستايل",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black87,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  trailing: const Icon(
                                                    Icons.arrow_back_ios_outlined,
                                                    color: Colors.black87,
                                                  ),
                                                  onTap: () {},
                                                ),
                                                const Divider(thickness: 0.5),
                                                ListTile(
                                                  leading: const Text(
                                                    "مناسبة",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black87,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  trailing: const Icon(
                                                    Icons.arrow_back_ios_outlined,
                                                    color: Colors.black87,
                                                  ),
                                                  onTap: () {},
                                                ),
                                                const Divider(thickness: 0.5),
                                                ListTile(
                                                  leading: const Text(
                                                    "آخر ما وصلنا",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black87,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  trailing: const Icon(
                                                    Icons.arrow_back_ios_outlined,
                                                    color: Colors.black87,
                                                  ),
                                                  onTap: () {},
                                                ),
                                                const Divider(thickness: 0.5),
                                                ListTile(
                                                  trailing: CupertinoSwitch(
                                                    value: true,
                                                    onChanged: (bool value) {},
                                                  ),
                                                  leading: const Text(
                                                    "التخفيضات فقط",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w400,
                                                      color: Colors.black87,
                                                    ),
                                                  ),
                                                ),
                                                const Divider(thickness: 0.5),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Text(
                                  "تصفية",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: mainColor,
                                    fontWeight: FontWeight.w400,
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
                        GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.6,
                          ),
                          itemCount: cubit.productsModel!.response!.length,
                          itemBuilder: (context, index) {
                            ProductModel product = cubit.productsModel!.response![index];
                            return Padding(
                              padding: const EdgeInsets.all(5),
                              child: SizedBox(
                                height: 250,
                                width: size.width * 0.33,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ProductDetailsScreen(
                                                productId: product.sId!)));
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              children: [
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
                                                  product.desc!.description!,
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
                                                  children: [Text(
                                                    product.priceBefore!.toString(),
                                                    style: const TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 15,
                                                        decoration: TextDecoration.lineThrough
                                                    ),
                                                  ),
                                                    const SizedBox(width: 10,),
                                                    Text(
                                                      product.priceAfter!.toString(),
                                                      style: const TextStyle(
                                                        color: Colors.green,
                                                        fontSize: 25,
                                                      ),
                                                    ),],
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
                                                  width: size.width * 0.2,
                                                  height: size.height * 0.03,
                                                  child: Center(
                                                    child: Text(
                                                      "خصم${100 - (product.priceAfter! / product.priceBefore! * 100)}%",
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
                                          Container(
                                            width: size.width * 0.1,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: mainColor,
                                            ),
                                            child: TextButton(
                                              onPressed: () {
                                                if (token == null) {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            LoginScreen()),
                                                  );
                                                } else {
                                                  print(product.sId);
                                                  cubit.addToCart(
                                                    productId: product.sId!,
                                                  );
                                                }
                                              },
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
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
}
