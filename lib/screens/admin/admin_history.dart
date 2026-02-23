import 'package:flutter/material.dart';
import 'app_colors.dart';

class AdminHistory extends StatelessWidget {
  const AdminHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          // --- HEADER SECTION ---
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(15, 60, 25, 30),
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xFF2E1065), Color(0xFF8B5CF6)]),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
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
          ),

          // --- LIST OF CARDS ---
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _simpleCard("QF-8750", "Electrician", "Short Circuit Fix", "Stephen Strange", "Flat 4A, House 15, Road 62, Gulshan-2, Dhaka", "Main breaker keeps tripping.", "Ongoing"),
                  _simpleCard("QF-8910", "Electrician", "AC installation", "Oliver Queen", "120 CDA Residential Area, Agrabad, Chattogram", "Need a new AC to be installed.", "Ongoing"),
                  _simpleCard("QF-8821", "Plumbing", "Kitchen Sink Leak", "Hal Jordan", "House 78, Block-E, Road 11, Banani, Dhaka", "Pipe crack.", "Ongoing"),
                  _simpleCard("QF-8800", "Electrician", "Fan Installation", "Natasha Romanoff", "House 12, Main Road, Kumarpara, Sylhet", "Installing fans.", "Ongoing"),
                  _simpleCard("QF-1003", "Furniture", "Sofa Reupholstery", "Arthur Curry", "Holding 45, Kandirpar, Cumilla Sadar, Cumilla", "Fabric change.", "Finished"),
                  _simpleCard("QF-1006", "Plumbing", "Toilet Flush Repair", "Billy Batson", "Plot 22, Board Bazar, Gazipur City Corporation", "Flush tank fix.", "Finished"),
                  _simpleCard("QF-1005", "Furniture", "Broken Chair Leg", "Wade Wilson", "House 09, Sector 02, Upashahar, Rajshahi", "Leg reinforcement.", "Cancelled"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- REUSABLE CARD DESIGN ---
  Widget _simpleCard(String id, String cat, String title, String name, String addr, String desc, String status) {
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
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 15, offset: const Offset(0, 8))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(id, style: const TextStyle(color: Color(0xFF8B5CF6), fontWeight: FontWeight.bold)),
              _badge(cat),
            ],
          ),
          const SizedBox(height: 5),
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(height: 25),

          // --- FIXED: Wrapped in Row + Expanded to handle long text ---
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("User: ", style: TextStyle(color: Colors.blueGrey, fontSize: 13, fontWeight: FontWeight.bold)),
              Expanded(child: Text(name, style: const TextStyle(color: Colors.blueGrey, fontSize: 13))),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Location: ", style: TextStyle(color: Colors.blueGrey, fontSize: 13, fontWeight: FontWeight.bold)),
              Expanded(child: Text(addr, style: const TextStyle(color: Colors.blueGrey, fontSize: 13))),
            ],
          ),

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

  Widget _badge(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: const Color(0xFF8B5CF6).withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
      child: Text(label, style: const TextStyle(color: Color(0xFF8B5CF6), fontWeight: FontWeight.bold, fontSize: 10)),
    );
  }
}