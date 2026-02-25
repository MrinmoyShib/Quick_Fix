import 'package:flutter/material.dart';
import 'app_colors.dart';

class TechnicianList extends StatelessWidget {
  const TechnicianList({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          _buildheader(context),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _techCard("Steve Rogers", "Electrician", "Available", null, Colors.green),
                  _techCard("Peter Parker", "Plumber", "Busy", "Order #QF-8821", Colors.orange),
                  _techCard("Clark Kent", "Electrician", "Busy", "Order #QF-8750", Colors.orange),
                  _techCard("Tony Stark", "AC Specialist", "Busy", "Order #QF-8910", Colors.orange),
                  _techCard("Bruce Wayne", "General Repair", "Busy", "Order #QF-8800", Colors.orange),
                ],
              ),

            ),
          ),
        ],
      ),
    );
  }

  Widget _buildheader(BuildContext context) => Container(
    padding: const EdgeInsets.fromLTRB(10, 60, 20, 30),
    decoration: BoxDecoration(
        gradient: LinearGradient(colors: [AppColors.darkPurple, AppColors.lightPurple]),
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30))),
    child: Column(children: [
      Row(children: [
        IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.pop(context)),
        const Text("Staff Management", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
      ]),
      const SizedBox(height: 20),
      Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        _sumItem("5", "Total Staff"), _sumItem("1", "Available"), _sumItem("4", "On Task"),
      ]),
    ]),
  );

  Widget _sumItem(String count, String label) => Column(children: [
    Text(count, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
    Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
  ]);

  Widget _techCard(String name, String role, String status, String? order, Color col) {
    bool isFree = status == "Available";
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20),
          border: isFree ? Border.all(color: col.withOpacity(0.3)) : null,
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 5))]),
      child: Row(children: [
        CircleAvatar(backgroundColor: AppColors.lightPurple.withOpacity(0.1), child: Icon(Icons.person, color: AppColors.lightPurple)),
        const SizedBox(width: 15),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(role, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
          if (!isFree && order != null) Text("Current: $order", style: const TextStyle(color: Colors.blueGrey, fontSize: 11, fontWeight: FontWeight.w500)),
        ])),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(color: col.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
          child: Text(status, style: TextStyle(color: col, fontSize: 12, fontWeight: FontWeight.bold)),
        ),
      ]),
    );
  }
}