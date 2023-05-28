import 'package:clothes_store_app/modules/view_data/cubit/cubit.dart';
import 'package:clothes_store_app/modules/view_data/cubit/states.dart';
import 'package:clothes_store_app/shared/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewDataScreen extends StatelessWidget {
  const ViewDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String groupValue = "تخفيضات";
    return BlocProvider(
      create: (BuildContext context) => ViewDataCubit(),
      child: BlocConsumer<ViewDataCubit, ViewDataStates>(
          listener: (context, state) {},
          builder: (context, state) {
            ViewDataCubit cubit = ViewDataCubit.get(context);
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
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
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
                        const Text(
                          "المنتجات المدرجة: 60 منتج",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
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
                          height: 15.0,
                        ),
                        GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.4,
                          ),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(5),
                              child: SizedBox(
                                height: 250,
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
                                        "ذا جيفينج موفمنت",
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
                                        "تيشرت بقصة مريحة",
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
                                        "د.أ. 82",
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
