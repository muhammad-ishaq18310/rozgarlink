import 'package:flutter/material.dart';

class laborregisterscreen extends StatefulWidget {
  const laborregisterscreen({super.key});

  @override
  State<laborregisterscreen> createState() => _laborregisterscreenState();
}

class _laborregisterscreenState extends State<laborregisterscreen> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final TextEditingController cityController = TextEditingController();
  final TextEditingController wageController = TextEditingController();

  String? selectedSkill;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Labor Register / مزدور رجسٹر"),
        backgroundColor: const Color(0xFF1565C0),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formkey,

            child: Column(
              children: [
                SizedBox(height: 20),
                Icon(Icons.engineering, size: 90, color: Color(0xFF1565C0)),
                SizedBox(height: 20),
                Text(
                  "create labor account",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "Full name",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter your full name";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    labelText: "Phone Number",
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter your phone number";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                DropdownButtonFormField<String>(
                  value: selectedSkill,
                  decoration: InputDecoration(
                    labelText: "Select Skill",
                    prefixIcon: Icon(Icons.build),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  items:
                      [
                        "Mason",
                        "Electrician",
                        "Plumber",
                        "Painter",
                        "Carpenter",
                        "Driver",
                        "Welder",
                      ].map((skill) {
                        return DropdownMenuItem(
                          value: skill,
                          child: Text(skill),
                        );
                      }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedSkill = value;
                    });
                  },
                ),
                SizedBox(height: 20),

                TextFormField(
                  controller: cityController,
                  decoration: InputDecoration(
                    labelText: "City",
                    prefixIcon: const Icon(Icons.location_city),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                /// DAILY WAGE
                TextFormField(
                  controller: wageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Daily Wage",
                    prefixIcon: const Icon(Icons.money),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                /// REGISTER BUTTON
                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      print(nameController.text);
                      print(phoneController.text);
                      print(selectedSkill);
                    }
                  },

                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 55),
                    backgroundColor: const Color(0xFF1565C0),
                  ),

                  child: const Text("REGISTER", style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
