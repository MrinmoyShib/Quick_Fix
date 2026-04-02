import 'package:flutter/material.dart';

class MyRequests extends StatelessWidget {
  const MyRequests({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Colors.purple[800]!;

    final List<Map<String, String>> dummyRequests = [
      {"id": "001", "category": "Electric", "status": "Pending", "date": "Oct 24, 2025", "desc": "Light flickering in Room 202"},
      {"id": "002", "category": "Plumbing", "status": "In Progress", "date": "Oct 22, 2025", "desc": "Leaky tap in the bathroom"},
      {"id": "003", "category": "Furniture", "status": "Fixed", "date": "Oct 15, 2025", "desc": "Broken chair leg"},
    ];

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      itemCount: dummyRequests.length,
      itemBuilder: (context, index) {
        final item = dummyRequests[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 10,
                  offset: const Offset(0, 4)
              )
            ],
            border: Border.all(color: Colors.grey[100]!),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () => _showStatusTimeline(context, item, primaryColor),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    // Icon Circle
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: primaryColor.withOpacity(0.1),
                      child: Icon(_getCategoryIcon(item['category']!), color: primaryColor, size: 28),
                    ),
                    const SizedBox(width: 16),
                    // Text Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "${item['category']} Issue",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.purple[900])
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "ID: #${item['id']} • ${item['date']}",
                            style: TextStyle(color: Colors.grey[600], fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    // Status Badge
                    _buildStatusBadge(item['status']!),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showStatusTimeline(BuildContext context, Map<String, String> item, Color primaryColor) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))
      ),
      builder: (context) {
        bool isPending = item['status'] == 'Pending';
        bool isInProgress = item['status'] == 'In Progress';
        bool isFixed = item['status'] == 'Fixed';

        return Padding(
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(height: 25),
              Text(
                  "Ticket Status",
                  style: TextStyle(fontSize: 14, color: Colors.purple[300], fontWeight: FontWeight.bold, letterSpacing: 1)
              ),
              Text(
                  "Ref: #${item['id']}",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.purple[900])
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: Colors.grey[50], borderRadius: BorderRadius.circular(10)),
                child: Text(item['desc']!, style: TextStyle(color: Colors.grey[700], fontStyle: FontStyle.italic)),
              ),
              const SizedBox(height: 30),

              _timelineStep("Reported Successfully", item['date']!, true, primaryColor),
              _timelineStep("Technician Assigned", isPending ? "Waiting for staff..." : "Staff member: John Doe", !isPending, primaryColor),
              _timelineStep("Repair in Progress", isInProgress || isFixed ? "Technician is on site" : "Queued", isFixed || isInProgress, primaryColor),
              _timelineStep("Resolved & Closed", isFixed ? "Issue fixed by technician" : "Pending final check", isFixed, primaryColor),
            ],
          ),
        );
      },
    );
  }

  Widget _timelineStep(String title, String subtitle, bool isDone, Color activeColor) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Column(
            children: [
              Icon(
                  isDone ? Icons.check_circle : Icons.circle_outlined,
                  color: isDone ? activeColor : Colors.grey[300],
                  size: 24
              ),
              Expanded(
                child: Container(width: 2, color: Colors.grey[200]),
              ),
            ],
          ),
          const SizedBox(width: 15),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: isDone ? Colors.black87 : Colors.grey[400]
                    )
                ),
                Text(subtitle, style: TextStyle(fontSize: 12, color: isDone ? Colors.grey[600] : Colors.grey[400])),
              ],
            ),
          )
        ],
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Electric': return Icons.bolt_rounded;
      case 'Plumbing': return Icons.water_drop_rounded;
      case 'Furniture': return Icons.chair_alt_rounded;
      default: return Icons.construction_rounded;
    }
  }

  Widget _buildStatusBadge(String status) {
    Color color;
    switch(status) {
      case 'Fixed': color = Colors.green[600]!; break;
      case 'In Progress': color = Colors.orange[700]!; break;
      default: color = Colors.red[400]!;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: color.withOpacity(0.3), blurRadius: 4, offset: const Offset(0, 2))
          ]
      ),
      child: Text(
          status,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10)
      ),
    );
  }
}