abstract class ProfileStates {}

class ProfileInitialState extends ProfileStates {}

class ChangeState extends ProfileStates {}
class LoadingProfileState extends ProfileStates {}
class SuccessProfileState extends ProfileStates {}
class ErrorProfileState extends ProfileStates {}