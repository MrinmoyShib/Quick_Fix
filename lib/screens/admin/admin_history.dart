import 'package:flutter/material.dart';
import 'app_colors.dart';

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
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _buildHistoryCard(context, "QF-8750", "Electrician", "Short Circuit Fix", "Stephen Strange", "Flat 4A, House 15, Road 62, Gulshan-2, Dhaka", "Main breaker keeps tripping.", "Ongoing"),
                  _buildHistoryCard(context, "QF-8910", "Electrician", "AC installation", "Oliver Queen", "120 CDA Residential Area, Agrabad, Chattogram", "Need a new AC to be installed.", "Ongoing"),
                  _buildHistoryCard(context, "QF-8821", "Plumbing", "Kitchen Sink Leak", "Hal Jordan", "House 78, Block-E, Road 11, Banani, Dhaka", "Pipe crack.", "Ongoing"),
                  _buildHistoryCard(context, "QF-8800", "Electrician", "Fan Installation", "Natasha Romanoff", "House 12, Main Road, Kumarpara, Sylhet", "Installing fans.", "Ongoing"),
                  _buildHistoryCard(context, "QF-1003", "Furniture", "Sofa Reupholstery", "Arthur Curry", "Holding 45, Kandirpar, Cumilla Sadar, Cumilla", "Fabric change.", "Finished"),
                  _buildHistoryCard(context, "QF-1006", "Plumbing", "Toilet Flush Repair", "Billy Batson", "Plot 22, Board Bazar, Gazipur City Corporation", "Flush tank fix.", "Finished"),
                  _buildHistoryCard(context, "QF-1005", "Furniture", "Broken Chair Leg", "Wade Wilson", "House 09, Sector 02, Upashahar, Rajshahi", "Leg reinforcement.", "Cancelled"),
                ],
              ),
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
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [AppColors.darkPurple, AppColors.lightPurple]),
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
            onPressed: () => Navigator.pop(context),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Archive", style: TextStyle(color: Colors.white70, fontSize: 14)),
              Text("History Logs", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryCard(BuildContext context, String id, String cat, String title, String user, String addr, String desc, String status) {
    // Logic for status styling
    Color statusColor = Colors.orange;
    IconData statusIcon = Icons.sync;

    if (status == "Finished") {
      statusColor = Colors.green;
      statusIcon = Icons.check_circle;
    } else if (status == "Cancelled") {
      statusColor = Colors.red;
      statusIcon = Icons.cancel;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 15),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(id, style: TextStyle(color: AppColors.lightPurple, fontWeight: FontWeight.bold)),
              _buildBadge(cat),
            ],
          ),
          const SizedBox(height: 5),
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(height: 25),

          _iconLine(Icons.person_outline, "User: $user"),
          _iconLine(Icons.location_on_outlined, "Location: $addr"),

          const SizedBox(height: 10),
          Text(desc, style: const TextStyle(fontSize: 14, color: Colors.black87)),
          const SizedBox(height: 20),

          Row(
            children: [
              Icon(statusIcon, color: statusColor, size: 18),
              const SizedBox(width: 8),
              Text(status, style: TextStyle(color: statusColor, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _iconLine(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: AppColors.lightPurple),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.blueGrey, fontSize: 13),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.lightPurple.withOpacity(0.03),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: TextStyle(color: AppColors.lightPurple, fontWeight: FontWeight.bold, fontSize: 10),
      ),
    );
  }
}