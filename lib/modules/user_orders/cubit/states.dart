abstract class UserOrdersStates {}

class ChangeState extends UserOrdersStates {}

class UserOrdersInitialState extends UserOrdersStates {}

class LoadingUserOrdersState extends UserOrdersStates {}
class SuccessUserOrdersState extends UserOrdersStates {}
class ErrorUserOrdersState extends UserOrdersStates {}