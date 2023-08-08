abstract class ProceedToCheckoutStates {}

class ProceedToCheckoutInitialState extends ProceedToCheckoutStates {}

class ChangeState extends ProceedToCheckoutStates {}

class CreateOrderLoadingState extends ProceedToCheckoutStates {}

class CreateOrderSuccessState extends ProceedToCheckoutStates {}

class CreateOrderErrorState extends ProceedToCheckoutStates {}