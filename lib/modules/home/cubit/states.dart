abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class ChangeState extends HomeStates {}

class ProductCategoryLoadingState extends HomeStates {}

class ProductCategorySuccessState extends HomeStates {}

class ProductCategoryErrorState extends HomeStates {}

class ChangeProductsState extends HomeStates {}

class CartLoadingState extends HomeStates {}

class CartSuccessState extends HomeStates {}

class CartErrorState extends HomeStates {}
