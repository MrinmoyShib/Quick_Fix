import 'package:flutter/material.dart';
import 'report_form.dart';
import 'my_requests.dart';
import 'user_profile.dart';

class UserHome extends StatelessWidget {
  const UserHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quick-Fix Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UserProfile()),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "What needs fixing?",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // 1. Categories Grid
            Expanded(
              flex: 2,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _categoryCard(context, "Electric", Icons.electrical_services, Colors.orange),
                  _categoryCard(context, "Plumbing", Icons.plumbing, Colors.blue),
                  _categoryCard(context, "Furniture", Icons.chair, Colors.brown),
                  _categoryCard(context, "Other", Icons.more_horiz, Colors.grey),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 2. Recent Activity Section
            const Text(
              "Recent Requests",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyRequests()),
                    ),
                    child: const Text("View All Request History"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // A helper function to build the category cards quickly
  Widget _categoryCard(BuildContext context, String title, IconData icon, Color color) {
    return InkWell(
      onTap: () {
        // We pass the category name to the form so it knows what was clicked
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ReportForm()),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: color),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}