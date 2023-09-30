import 'package:bloc_demo_api/bloc/authBloc/auth_cubit.dart';
import 'package:bloc_demo_api/bloc/authBloc/auth_states.dart';
import 'package:bloc_demo_api/screens/verifyOtp/verify_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController mobileController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text("Firebase Auth Demo",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24
                ),),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: mobileController,
                onChanged: (value) {},
                keyboardType: TextInputType.phone,
                maxLength: 10,
                decoration: InputDecoration(
                    hintText: "Enter contact number",
                    counterText: '',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4))),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: BlocConsumer<AuthCubit, AuthStates>(
                  listener: (context, state) {
                    if(state is AuthCodeSentState){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const VerifyOtpScreen()));
                    }
                  },
                  builder: (context, state) {
                    if(state is AuthLoadingState){
                      return const Center(child: CircularProgressIndicator());
                    }
                    return ElevatedButton(
                        onPressed: () {
                          String mobile = "+91${mobileController.text}";
                          BlocProvider.of<AuthCubit>(context).sendOtp(mobile);

                        },
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors
                              .blue),
                        ),
                        child: const Text("Submit"));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
