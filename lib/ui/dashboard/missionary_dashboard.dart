import 'package:flutter/material.dart';

class MissionaryDashboard extends StatelessWidget {
  const MissionaryDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Missionary Dashboard")),
      body: const Center(
        child: Text("Welcome, Missionary!"),
      ),
    );
  }
}