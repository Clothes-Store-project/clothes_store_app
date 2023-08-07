abstract class OrderDetailsStates {}

class ChangeState extends OrderDetailsStates {}

class OrderDetailsInitialState extends OrderDetailsStates {}

class OrderDetailsLoadingState extends OrderDetailsStates {}

class OrderDetailsSuccessState extends OrderDetailsStates {}

class OrderDetailsErrorState extends OrderDetailsStates {}