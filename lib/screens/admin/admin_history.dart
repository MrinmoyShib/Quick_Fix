import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'global_data.dart';

class AdminHistory extends StatelessWidget {
  const AdminHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: historyLogs.isEmpty
                ? const Center(child: Text("No history found"))
                : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: historyLogs.length,
              itemBuilder: (context, index) => _buildHistoryCard(historyLogs[index]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(15, 60, 25, 30),
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [AppColors.darkPurple, AppColors.lightPurple]),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      child: Row(children: [
        IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.pop(context)),
        const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Archive", style: TextStyle(color: Colors.white70, fontSize: 14)),
          Text("History Logs", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
        ]),
      ]),
    );
  }

  Widget _buildHistoryCard(ServiceRequest req) {
    Color statusColor = req.status == "Ongoing" ? Colors.orange : (req.status == "Finished" ? Colors.green : Colors.red);
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 15)]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(req.id, style: const TextStyle(color: AppColors.lightPurple, fontWeight: FontWeight.bold)),
          _buildBadge(req.category),
        ]),
        const SizedBox(height: 5),
        Text(req.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const Divider(height: 25),
        _iconLine(Icons.person_outline, "User: ${req.user}"),
        _iconLine(Icons.location_on_outlined, "Location: ${req.address}"),
        if(req.assignedTech != null) _iconLine(Icons.handyman_outlined, "Tech: ${req.assignedTech}"),
        const SizedBox(height: 20),
        Row(children: [
          Icon(Icons.circle, color: statusColor, size: 12),
          const SizedBox(width: 8),
          Text(req.status, style: TextStyle(color: statusColor, fontWeight: FontWeight.bold)),
        ]),
      ]),
    );
  }

  Widget _iconLine(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(children: [
        Icon(icon, size: 16, color: AppColors.lightPurple),
        const SizedBox(width: 8),
        Expanded(child: Text(text, style: const TextStyle(color: Colors.blueGrey, fontSize: 13))),
      ]),
    );
  }

  Widget _buildBadge(String label) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(color: AppColors.lightPurple.withOpacity(0.05), borderRadius: BorderRadius.circular(10)),
    child: Text(label, style: const TextStyle(color: AppColors.lightPurple, fontWeight: FontWeight.bold, fontSize: 10)),
  );
}