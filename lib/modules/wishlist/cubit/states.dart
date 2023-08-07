abstract class WishlistStates {}

class WishlistInitialState extends WishlistStates {}

class ChangeState extends WishlistStates {}

class WishlistLoadingState extends WishlistStates {}

class WishlistSuccessState extends WishlistStates {}

class WishlistErrorState extends WishlistStates {}

class RemoveWishlistState extends WishlistStates {}