import 'package:clothes_store_app/models/product_category_model.dart';
import 'package:clothes_store_app/models/products_model.dart';
import 'package:clothes_store_app/models/sub_category_model.dart';
import 'package:clothes_store_app/modules/home/cubit/states.dart';
import 'package:clothes_store_app/shared/network/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  bool isLoading = false;
  bool isWish = false;
  bool isAdd = false;

  List<String> products = [
    "Hot sale",
    "Ai recom",
    "Super deals",
    "Viewed products",
    "First visit products",
  ];

  SubCategoryModel? subCategoryModel;

  void getSubCategory({required String id}) async {
    try {
      print("Hello $id");
      isLoading = true;
      subCategoryModel = null;
      emit(ProductCategoryLoadingState());
      DioHelper.getData(
        url: "/subcategory/main_category/$id",
      ).then((value) async {
        subCategoryModel = SubCategoryModel.fromJson(value.data);
        isLoading = false;
        emit(ProductCategorySuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(ProductCategoryErrorState());
      });
    } catch (e) {}
  }
}