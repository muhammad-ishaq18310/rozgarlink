import 'package:flutter/material.dart';

class AuthViewmodel {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  void login() {
    String email = emailcontroller.text;
    String password = passwordcontroller.text;

    print(email);
    print(password);
  }
}
