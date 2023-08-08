abstract class ShoppingCartStates {}

class ShoppingCartInitialState extends ShoppingCartStates {}

class ChangeState extends ShoppingCartStates {}

class ChangeTotalState extends ShoppingCartStates {}

class ChangePlusState extends ShoppingCartStates {}
class CartProductState extends ShoppingCartStates {}

class ChangeMinusState extends ShoppingCartStates {}

class CartLoadingState extends ShoppingCartStates {}

class CartSuccessState extends ShoppingCartStates {}

class CartErrorState extends ShoppingCartStates {}

class RemoveCartState extends ShoppingCartStates {}
