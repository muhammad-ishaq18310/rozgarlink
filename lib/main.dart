import 'package:flutter/material.dart';
import 'package:rozgarlink/features/auth/role_slection_screen.dart';
import 'package:rozgarlink/features/client/client_login_screen.dart';
import 'package:rozgarlink/features/labour/labor_screen.dart';
import 'features/splash/splash_view.dart';

void main() {
  runApp(const RozgarLinkApp());
}

class RozgarLinkApp extends StatelessWidget {
  const RozgarLinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RozgarLink',
      theme: ThemeData(
        primaryColor: const Color(0xFF1565C0),
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashView(),
        '/roleSelection': (context) => RoleSlectionScreen(),
        '/laborlogin': (context) => LaborScreen(),
        '/clientlogin': (context) => ClientScreen(),
      },
    );
  }
}
