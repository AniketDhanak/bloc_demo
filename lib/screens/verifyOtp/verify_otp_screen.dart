import 'package:bloc_demo_api/bloc/authBloc/auth_cubit.dart';
import 'package:bloc_demo_api/bloc/authBloc/auth_states.dart';
import 'package:bloc_demo_api/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();

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
              const Text(
                "Firebase Auth Demo",
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: otpController,
                onChanged: (value) {},
                keyboardType: TextInputType.phone,
                maxLength: 10,
                decoration: InputDecoration(
                    hintText: "Enter OTP",
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
                    if (state is AuthLoggedInState) {
                      Navigator.popUntil(context, (route) => route.isFirst);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                    } else if (state is AuthErrorState) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar( SnackBar(content: Text(state.errorMessage)));
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthLoadingState) {
                      return const CircularProgressIndicator();
                    }
                    return ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<AuthCubit>(context)
                              .verifyOtp(otpController.text);
                        },
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blue),
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
