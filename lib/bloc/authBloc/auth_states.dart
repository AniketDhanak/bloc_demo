import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthStates {}

class AuthInitState extends AuthStates{}
class AuthLoadingState extends AuthStates{}
class AuthLoggedInState extends AuthStates{
  final User firebaseUser;
  AuthLoggedInState(this.firebaseUser);
}
class AuthErrorState extends AuthStates{
  String errorMessage;
  AuthErrorState(this.errorMessage);
}
class AuthCodeSentState extends AuthStates{}
class AuthCodeVerifiedState extends AuthStates{}
class AuthLoggedOutState extends AuthStates{}

