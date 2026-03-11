import 'package:flutter/material.dart';
import 'package:rozgarlink/features/auth/auth_viewmodel.dart';
import 'package:rozgarlink/features/auth/labor_registration-screen.dart';

class LoginScreen extends StatefulWidget {
  final String role;

  const LoginScreen({super.key, required this.role});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthViewmodel viewmodel = AuthViewmodel();
  final _formKey = GlobalKey<FormState>();

  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    IconData icon = widget.role == "labor"
        ? Icons.engineering
        : Icons.business_center;

    String title = widget.role == "labor" ? "Welcome Labor" : "Welcome Client";

    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.role} Login"),
        centerTitle: true,
        backgroundColor: const Color(0xFF1565C0),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Form(
            key: _formKey,

            child: Column(
              children: [
                const SizedBox(height: 40),

                Icon(icon, size: 100, color: const Color(0xFF1565C0)),

                const SizedBox(height: 20),

                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 40),

                TextFormField(
                  controller: viewmodel.emailcontroller,
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter email";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: viewmodel.passwordcontroller,
                  obscureText: isPasswordHidden,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordHidden
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordHidden = !isPasswordHidden;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter password";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 30),

                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      viewmodel.login();
                    }
                  },

                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 55),
                    backgroundColor: const Color(0xFF1565C0),
                  ),

                  child: const Text("LOGIN", style: TextStyle(fontSize: 18)),
                ),

                SizedBox(height: 15),
                TextButton(
                  onPressed: () {
                    if (widget.role == "labor") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const laborregisterscreen(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Client registration coming soon"),
                        ),
                      );
                    }
                  },

                  child: Text(
                    "dont have an account? Registor",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
