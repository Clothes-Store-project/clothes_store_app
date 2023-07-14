abstract class ProductDetailsStates {}

class ProductDetailsInitialState extends ProductDetailsStates {}

class ChangeState extends ProductDetailsStates {}

class ProductLoadingState extends ProductDetailsStates {}

class ProductSuccessState extends ProductDetailsStates {}

class ProductErrorState extends ProductDetailsStates {}
