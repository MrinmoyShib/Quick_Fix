import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'global_data.dart';

class TechnicianList extends StatefulWidget {
  const TechnicianList({super.key});
  @override
  State<TechnicianList> createState() => _TechnicianListState();
}

class _TechnicianListState extends State<TechnicianList> {
  @override
  Widget build(BuildContext context) {
    int total = techStaff.length;
    int available = techStaff.where((t) => t.status == "Available").length;
    int onTask = total - available;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          _buildheader(context, total, available, onTask),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: techStaff.length,
              itemBuilder: (context, index) {
                final t = techStaff[index];
                return _techCard(t.name, t.role, t.status, t.currentOrder, t.status == "Available" ? Colors.green : Colors.orange);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildheader(BuildContext context, int total, int avail, int task) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 60, 20, 30),
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [AppColors.darkPurple, AppColors.lightPurple]),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
      child: Column(children: [
        Row(children: [
          IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.pop(context)),
          const Text("Staff Management", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
        ]),
        const SizedBox(height: 20),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          _sumItem("$total", "Total Staff"), _sumItem("$avail", "Available"), _sumItem("$task", "On Task"),
        ]),
      ]),
    );
  }

  Widget _sumItem(String count, String label) {
    return Column(children: [
      Text(count, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
      Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
    ]);
  }

  Widget _techCard(String name, String role, String status, String? order, Color col) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10)]),
      child: Row(children: [
        CircleAvatar(backgroundColor: AppColors.lightPurple.withOpacity(0.1), child: const Icon(Icons.person, color: AppColors.lightPurple)),
        const SizedBox(width: 15),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(role, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
          if (status != "Available") Text("Current: $order", style: const TextStyle(color: Colors.blueGrey, fontSize: 11, fontWeight: FontWeight.w500)),
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