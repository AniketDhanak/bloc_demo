import 'package:bloc_demo_api/screens/SignInScreen/SignInBloc/sign_in_events.dart';
import 'package:bloc_demo_api/screens/SignInScreen/SignInBloc/sign_in_states.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvents, SignInState>{
  SignInBloc() : super(SignInInitState()){
    on<SignInTextOnChangeEvent>((event, emit) {
      if(event.emailValue.isEmpty || !EmailValidator.validate(event.emailValue) ){
        emit(SignInErrorState("Enter valid email-d"));
      }else if(event.passwordValue.isEmpty || event.passwordValue.length < 8){
        emit(SignInErrorState("Enter valid password"));
      }else{
        emit(SignInValidState());
      }
    });
    on<SignInSubmitButtonEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}