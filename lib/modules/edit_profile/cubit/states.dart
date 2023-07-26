abstract class EditProfileStates {}

class ChangeState extends EditProfileStates {}

class EditProfileInitialState extends EditProfileStates {}

class LoadingEditState extends EditProfileStates {}
class SuccessEditState extends EditProfileStates {}
class ErrorEditState extends EditProfileStates {}
