import 'package:bloc_demo_api/bloc/authBloc/auth_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _verificationId;

  AuthCubit() : super(AuthInitState()){
    User? currentUser = _auth.currentUser;
    if(currentUser != null){
      emit(AuthLoggedInState(currentUser));
    }else{
      emit(AuthLoggedOutState());
    }
  }

  void sendOtp(String mobile) async {
    emit(AuthLoadingState());
    await _auth.verifyPhoneNumber(
        phoneNumber: mobile,
        codeSent: (verificationId, forceResendingToken) {
          _verificationId = verificationId;
          emit(AuthCodeSentState());
        },
        verificationCompleted: (phoneAuthCredential) {
          signIn(phoneAuthCredential);
        },
        verificationFailed: (exception) {
          emit(AuthErrorState(exception.message.toString()));
        },
        codeAutoRetrievalTimeout: (verificationId) {
          _verificationId = _verificationId;
        });
  }

  void verifyOtp(String otp) async {
    emit(AuthLoadingState());
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!, smsCode: otp);
    signIn(credential);
  }

  void signIn(PhoneAuthCredential phoneAuthCredential) async {
    try{
     UserCredential userCredential = await _auth.signInWithCredential(phoneAuthCredential);
      if(userCredential.user != null){
        emit(AuthLoggedInState(userCredential.user!));
      }
    } on FirebaseAuthException catch(error){
      emit(AuthErrorState(error.message.toString()));
    }
  }

  void logOut()async{
    await _auth.signOut();
    emit(AuthLoggedOutState());
  }
}
