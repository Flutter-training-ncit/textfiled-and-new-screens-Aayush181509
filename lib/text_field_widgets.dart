/// Create a screen (with scafold) and it should have the following widgets:
/// 1. AppBar with it's title "Testing textfields". Use the widget Textfield or TextFormField
/// 2. body: Should have 2 textfield vertically which ask for Email and password.
/// 3. Button which says "Sign In"
/// 4.When button is pressed user has to be navigated to a new screen which has title "Home"
///

import 'package:android_and_ios/bloc/login/login_cubit.dart';
import 'package:android_and_ios/page_view_widget.dart';
import 'package:android_and_ios/utils/shared_pref.dart';
import 'package:android_and_ios/widgets/tab_view_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({Key? key}) : super(key: key);

  @override
  _TextFieldScreenState createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  LoginCubit loginCubit = LoginCubit();
  bool loginLoading = false;

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back),
          title: Text("Testing Textfields"),
        ),
        body: Form(
          // autovalidateMode: AutovalidateMode.always,
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                textInputAction: TextInputAction.search,
                keyboardType: TextInputType.emailAddress,
                onChanged: (val) {
                  // print(val);
                },
                validator: (isValidated) {
                  if (isValidated == null) {
                    return "this is an email";
                  }

                  if (isValidated.isEmpty) {
                    return "this is an email";
                  }

                  return null;
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.email),
                  labelText: "Enter Email Address",
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  contentPadding: EdgeInsets.all(30),
                  // helperText: "Enter correct password",
                ),
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                validator: (isValidated) {
                  print(isValidated);
                  if (isValidated == null) {
                    return "Password must not be empty";
                  }
                  if (isValidated.isEmpty) {
                    return "Password must not be empty";
                  }
                  if (isValidated.length < 6) {
                    return "Password must be greater than 6 characters.";
                  }

                  return null;
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.password),
                  labelText: "Enter Password",
                  suffixIcon: Icon(Icons.remove_red_eye_outlined),
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  contentPadding: EdgeInsets.all(30),
                  // helperText: "Enter correct password",
                ),
              ),
              SizedBox(
                height: 30,
              ),
              IgnorePointer(
                child: BlocListener(
                  bloc: loginCubit,
                  listener: (context, state) {},
                  child: MaterialButton(
                    minWidth: 150,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    color: Colors.green,
                    padding: EdgeInsets.all(20),
                    onPressed: () {
                      var email = emailController.text;
                      var password = passwordController.text;

                      print(email);
                      print(password);

                      if (formKey.currentState != null) {
                        var isValidated = formKey.currentState!.validate();
                        if (isValidated) {
                          loginCubit.loginWithEmailAndPassword(
                              'aayush', 'root');
                          SharedPref.setUserHasLoggedIn(true);
                          Navigator.pushNamed(context, "/listing_screen");
                        } else {
                          print("Sorry Please enter correct isValidateds");
                        }
                      }
                    },
                    child: Text(
                      "login",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
