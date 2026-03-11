import 'dart:async';
import 'package:flutter/material.dart';

class SplashViewModel {
  void navigateToNext(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/roleSelection');
    });
  }
}
