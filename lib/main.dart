import 'package:flutter/material.dart';
import 'package:rozgarlink/features/auth/role_slection_screen.dart';
import 'features/splash/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

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
      },
    );
  }
}
