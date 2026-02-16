import 'package:flutter/material.dart';

class MyRequests extends StatelessWidget {
  const MyRequests({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> dummyRequests = [
      {"id": "001", "category": "Electric", "status": "Pending", "date": "Oct 24, 2025", "desc": "Light flickering in Room 202"},
      {"id": "002", "category": "Plumbing", "status": "In Progress", "date": "Oct 22, 2025", "desc": "Leaky tap in the bathroom"},
      {"id": "003", "category": "Furniture", "status": "Fixed", "date": "Oct 15, 2025", "desc": "Broken chair leg"},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: dummyRequests.length,
      itemBuilder: (context, index) {
        final item = dummyRequests[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 2
              )
            ],
          ),
          // 1. Material widget allows the ink splash and hover color to appear correctly
          child: Material(
            color: Colors.transparent, // Keeps the Container's white background
            child: InkWell(
              borderRadius: BorderRadius.circular(15), // Matches Container shape
              onTap: () => _showStatusTimeline(context, item),
              // 2. Explicitly setting hover color for a nice blue tint on PC
              hoverColor: Colors.blue[50],
              child: ListTile(
                // Important: remove the internal onTap so InkWell handles it for better hovering
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                leading: CircleAvatar(
                  backgroundColor: Colors.blue[50],
                  child: Icon(_getCategoryIcon(item['category']!), color: Colors.blue[800]),
                ),
                title: Text(
                    "${item['category']} Issue",
                    style: const TextStyle(fontWeight: FontWeight.bold)
                ),
                subtitle: Text("ID: #${item['id']} • ${item['date']}"),
                trailing: _buildStatusBadge(item['status']!),
              ),
            ),
          ),
        );
      },
    );
  }

  // --- THE TIMELINE BOTTOM SHEET ---
  void _showStatusTimeline(BuildContext context, Map<String, String> item) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25))
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Ticket #${item['id']} Status",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900]
                  )
              ),
              const SizedBox(height: 5),
              Text(item['desc']!, style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 25),

              _timelineStep("Reported", item['date']!, true),
              _timelineStep("Technician Assigned", "Pending Assignment", item['status'] != 'Pending'),
              _timelineStep("Work in Progress", "Waiting to start", item['status'] == 'In Progress' || item['status'] == 'Fixed'),
              _timelineStep("Resolved", "Final Check", item['status'] == 'Fixed'),
            ],
          ),
        );
      },
    );
  }

  Widget _timelineStep(String title, String subtitle, bool isDone) {
    return Row(
      children: [
        Column(
          children: [
            Icon(
                isDone ? Icons.check_circle : Icons.radio_button_unchecked,
                color: isDone ? Colors.blue : Colors.grey
            ),
            Container(width: 2, height: 30, color: Colors.grey[300]),
          ],
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isDone ? Colors.black : Colors.grey
                )
            ),
            Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
            const SizedBox(height: 20),
          ],
        )
      ],
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Electric': return Icons.flash_on;
      case 'Plumbing': return Icons.water_drop;
      case 'Furniture': return Icons.chair;
      default: return Icons.build;
    }
  }

  Widget _buildStatusBadge(String status) {
    Color color = status == 'Fixed'
        ? Colors.green
        : (status == 'In Progress' ? Colors.orange : Colors.red);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Text(
          status,
          style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 11)
      ),
    );
  }
}