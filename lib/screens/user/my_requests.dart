import 'package:flutter/material.dart';

class MyRequests extends StatelessWidget {
  const MyRequests({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data to simulate existing requests
    final List<Map<String, String>> dummyRequests = [
      {"id": "001", "category": "Electric", "status": "Pending", "date": "Oct 24, 2025"},
      {"id": "002", "category": "Plumbing", "status": "In Progress", "date": "Oct 22, 2025"},
      {"id": "003", "category": "Furniture", "status": "Fixed", "date": "Oct 15, 2025"},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("My Request History")),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: dummyRequests.length,
        itemBuilder: (context, index) {
          final item = dummyRequests[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Icon(
                _getCategoryIcon(item['category']!),
                color: Colors.blue,
              ),
              title: Text("${item['category']} Request #${item['id']}"),
              subtitle: Text("Reported on: ${item['date']}"),
              trailing: _buildStatusBadge(item['status']!),
            ),
          );
        },
      ),
    );
  }

  // Helper to get the right icon based on category
  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Electric': return Icons.electrical_services;
      case 'Plumbing': return Icons.plumbing;
      case 'Furniture': return Icons.chair;
      default: return Icons.build;
    }
  }

  // Helper to build a colored status badge
  Widget _buildStatusBadge(String status) {
    Color badgeColor;
    if (status == 'Fixed') {
      badgeColor = Colors.green;
    } else if (status == 'In Progress') {
      badgeColor = Colors.orange;
    } else {
      badgeColor = Colors.red;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: badgeColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: badgeColor),
      ),
      child: Text(
        status,
        style: TextStyle(color: badgeColor, fontWeight: FontWeight.bold, fontSize: 12),
      ),
    );
  }
}