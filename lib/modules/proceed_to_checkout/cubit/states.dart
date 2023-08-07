abstract class ProceedToCheckoutStates {}

class ProceedToCheckoutInitialState extends ProceedToCheckoutStates {}

class ChangeState extends ProceedToCheckoutStates {}

class ProceedToCheckoutLoadingState extends ProceedToCheckoutStates {}

class ProceedToCheckoutSuccessState extends ProceedToCheckoutStates {}

class ProceedToCheckoutErrorState extends ProceedToCheckoutStates {}