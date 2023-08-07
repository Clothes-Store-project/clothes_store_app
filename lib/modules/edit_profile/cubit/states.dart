abstract class EditProfileStates {}

class ChangeState extends EditProfileStates {}

class EditProfileInitialState extends EditProfileStates {}

class LoadingEditState extends EditProfileStates {}
class LogoutState extends EditProfileStates {}
class SuccessEditState extends EditProfileStates {}
class ErrorEditState extends EditProfileStates {}

class LoadingViewState extends EditProfileStates {}
class SuccessViewState extends EditProfileStates {}
class ErrorViewState extends EditProfileStates {}
