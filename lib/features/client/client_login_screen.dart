import 'package:flutter/material.dart';
import 'package:rozgarlink/features/auth/auth_viewmodel.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen({super.key});

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  final AuthViewmodel viewmodel = AuthViewmodel();
  final _formKey = GlobalKey<FormState>();

  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text("Client Login / کلائنٹ لاگ ان"),
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

                /// CLIENT ICON
                const Icon(
                  Icons.business_center,
                  size: 100,
                  color: Color(0xFF1565C0),
                ),

                const SizedBox(height: 15),

                /// TITLE
                const Text(
                  "Welcome Client",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 40),

                /// EMAIL
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

                /// PASSWORD
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
