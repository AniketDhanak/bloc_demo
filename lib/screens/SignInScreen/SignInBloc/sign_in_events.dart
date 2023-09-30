abstract class SignInEvents{}

class SignInTextOnChangeEvent extends SignInEvents{
  String emailValue;
  String passwordValue;
  SignInTextOnChangeEvent(this.emailValue,this.passwordValue);
}

class SignInSubmitButtonEvent extends SignInEvents{
  String emailValue;
  String passwordValue;
  SignInSubmitButtonEvent(this.emailValue,this.passwordValue);
}