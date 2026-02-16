import 'package:flutter/material.dart';

class MyRequests extends StatelessWidget {
  const MyRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Request History")),
      body: const Center(child: Text("List of Pending/Fixed issues will appear here.")),
    );
  }
}