import 'package:flutter/material.dart';
import 'package:rozgarlink/features/auth/login%20screen.dart';

class RoleSelectionViewmodel {
  void selectLabor(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen(role: "labor")),
    );
  }

  void selectClient(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(role: "client"),
      ),
    );
  }
}
