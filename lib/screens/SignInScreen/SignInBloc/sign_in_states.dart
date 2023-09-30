abstract class SignInState {}

class SignInErrorState extends SignInState {
  String errorMsg;

  SignInErrorState(this.errorMsg);
}

class SignInInitState extends SignInState {}

class SignInValidState extends SignInState {}

class SignInLoadingState extends SignInState {}
