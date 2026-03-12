import 'package:flutter/material.dart';
import 'package:rozgarlink/data/labor_data.dart';
import 'package:rozgarlink/features/client/worker_detail_screen.dart';

class ClientHomeScreen extends StatelessWidget {
  const ClientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Available Workers"),
        backgroundColor: Color(0xFF1565C0),
      ),

      body: laborList.isEmpty
          ? const Center(
              child: Text(
                "No workers registered yet",
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: laborList.length,
              itemBuilder: (context, index) {
                final labor = laborList[index];

                return Card(
                  margin: const EdgeInsets.all(10),
                  elevation: 3,

                  child: ListTile(
                    leading: const Icon(
                      Icons.engineering,
                      size: 40,
                      color: Color(0xFF1565C0),
                    ),

                    title: Text(
                      labor.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),

                    subtitle: Text(
                      "${labor.skill} • ${labor.city}\nDaily Wage: ${labor.wage}",
                    ),

                    trailing: const Icon(Icons.arrow_forward_ios),

                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              WorkerDetailScreen(labor: labor),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
