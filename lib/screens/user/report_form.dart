import 'package:flutter/material.dart';

class ReportForm extends StatelessWidget {
  const ReportForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Report an Issue")),
      body: const Center(child: Text("Form for Electric/Plumbing/Furniture goes here.")),
    );
  }
}