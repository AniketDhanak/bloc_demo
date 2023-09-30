import 'package:bloc_demo_api/screens/SignInScreen/SignInBloc/sign_in_bloc.dart';
import 'package:bloc_demo_api/screens/SignInScreen/SignInBloc/sign_in_bloc.dart';
import 'package:bloc_demo_api/screens/SignInScreen/SignInBloc/sign_in_events.dart';
import 'package:bloc_demo_api/screens/SignInScreen/SignInBloc/sign_in_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SignInErrorState) {
                    return Text(
                      state.errorMsg,
                      style: TextStyle(color: Colors.red, fontSize: 18),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: emailController,
                onChanged: (value) {
                  BlocProvider.of<SignInBloc>(context).add(
                      SignInTextOnChangeEvent(
                          emailController.text, passwordController.text));
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: "Enter Email-Id",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4))),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: passwordController,
                onChanged: (value) {
                  BlocProvider.of<SignInBloc>(context).add(
                      SignInTextOnChangeEvent(
                          emailController.text, passwordController.text));
                },
                decoration: InputDecoration(
                    hintText: "Enter Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4))),
              ),
              SizedBox(
                height: 10,
              ),
              Center(child: BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {

                  if(state is SignInLoadingState){
                    return CircularProgressIndicator();
                  }
                  return ElevatedButton(
                      onPressed: () {
                        if (state is SignInValidState) {
                          BlocProvider.of<SignInBloc>(context).add(
                              SignInSubmitButtonEvent(emailController.text,
                                  passwordController.text));
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: (state is SignInValidState)
                            ? MaterialStatePropertyAll(Colors.blue)
                            : MaterialStatePropertyAll(Colors.grey),
                      ),
                      child: Text("Submit"));
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
