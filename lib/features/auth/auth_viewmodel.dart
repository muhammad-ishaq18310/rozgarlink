import 'package:flutter/material.dart';
import 'package:rozgarlink/data/repositories/auth_repository.dart';

class AuthViewmodel extends ChangeNotifier {
  final AuthRepository _repository = AuthRepository();
  bool isloading = false;
  String? errorMessage;

  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  // login function

  Future<void> login(BuildContext context) async {
    isloading = true;
    errorMessage = null;
    notifyListeners();

    // repositry

    String? error = await _repository.login(
      email: emailcontroller.text.trim(),
      password: passwordcontroller.text.trim(),
    );

    // hide lodaing

    isloading = false;
    notifyListeners();

    // check result

    if (error == null) {
      String uid = _repository.getCurrentUser()!.uid;
      String? role = await _repository.getUserRole(uid);

      // navigate

      if (role == 'labor') {
        Navigator.pushReplacementNamed(context, '/laborHome');
      } else {
        Navigator.pushReplacementNamed(context, '/clientHome');
      }
    } else {
      errorMessage = error;
      notifyListeners();
    }
  }

  Future<void> register(
    BuildContext context, {
    required String name,
    required String phone,
    required String skill,
    required String city,
    required String wage,
  }) async {
    isloading = true;
    errorMessage = null;
    notifyListeners();
    String? error = await _repository.registerLabor(
      email: emailcontroller.text.trim(),
      password: passwordcontroller.text.trim(),
      name: name,
      phone: phone,
      skill: skill,
      city: city,
      wage: wage,
    );

    isloading = false;
    notifyListeners();

    if (error == null) {
      // Success! Go to labor home
      Navigator.pushReplacementNamed(context, '/laborHome');
    } else {
      errorMessage = error;
      notifyListeners();
    }
  }
}
