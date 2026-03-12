import 'package:flutter/material.dart';
import 'package:rozgarlink/features/models/labor_model.dart';

class WorkerDetailScreen extends StatelessWidget {
  final LaborModel labor;

  const WorkerDetailScreen({super.key, required this.labor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("worker detail"),
        backgroundColor: Color(0xFF1565C0),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.engineering, size: 100, color: Color(0xFF1565C0)),

            const SizedBox(height: 20),

            Text("Name: ${labor.name}", style: const TextStyle(fontSize: 20)),

            const SizedBox(height: 10),

            Text("Skill: ${labor.skill}", style: const TextStyle(fontSize: 20)),

            const SizedBox(height: 10),

            Text("City: ${labor.city}", style: const TextStyle(fontSize: 20)),

            const SizedBox(height: 10),

            Text(
              "Daily Wage: ${labor.wage}",
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.call),
                  label: const Text("Call"),
                ),

                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.message),
                  label: const Text("WhatsApp"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
