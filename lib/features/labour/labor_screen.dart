import 'package:flutter/material.dart';
import 'package:rozgarlink/features/auth/auth_viewmodel.dart';

class LaborScreen extends StatefulWidget {
  const LaborScreen({super.key});

  @override
  State<LaborScreen> createState() => _LaborScreenState();
}

class _LaborScreenState extends State<LaborScreen> {
  final AuthViewmodel viewmodel = AuthViewmodel();
  final _formKey = GlobalKey<FormState>();

  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text("Labor Login / مزدور لاگ ان"),
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

                /// 👷 LABOR ICON
                const Icon(
                  Icons.engineering,
                  size: 100,
                  color: Color(0xFF1565C0),
                ),

                const SizedBox(height: 15),

                /// TITLE
                const Text(
                  "Welcome Labor",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 40),

                /// EMAIL FIELD
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
                      return "Please enter your email";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                /// PASSWORD FIELD
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

                /// LOGIN BUTTON
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      viewmodel.login();
                    }
                  },

                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 55),
                    backgroundColor: const Color(0xFF1565C0),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),

                  child: const Text(
                    "LOGIN",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 20),

                /// REGISTER BUTTON
                TextButton(
                  onPressed: () {},

                  child: const Text(
                    "Don't have an account? Register",
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
