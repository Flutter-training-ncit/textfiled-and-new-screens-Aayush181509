/// Create a screen (with scafold) and it should have the following widgets:
/// 1. AppBar with it's title "Testing textfields". Use the widget Textfield or TextFormField
/// 2. body: Should have 2 textfield vertically which ask for Email and password.
/// 3. Button which says "Sign In"
/// 4.When button is pressed user has to be navigated to a new screen which has title "Home"
///

import 'package:android_and_ios/widgets/tab_view_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({Key? key}) : super(key: key);

  @override
  _TextFieldScreenState createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

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
                validator: (value) {
                  if (value == null) {
                    return "this is an email";
                  }

                  if (value.isEmpty) {
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
                validator: (value) {
                  print(value);
                  if (value == null) {
                    return "Password must not be empty";
                  }
                  if (value.isEmpty) {
                    return "Password must not be empty";
                  }
                  if (value.length < 6) {
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
              MaterialButton(
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
                    var value = formKey.currentState!.validate();
                    if (value) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TabViewWidget()),
                      );
                    } else {
                      print("Sorry Please enter correct values");
                    }
                  }
                },
                child: Text(
                  "login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ));
  }
}
