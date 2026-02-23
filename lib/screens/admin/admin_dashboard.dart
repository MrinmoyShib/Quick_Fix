import 'package:flutter/material.dart';
import 'admin_history.dart';
import 'admin_profile.dart';
import 'technician_list.dart';
import 'request_details.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  // These are your Theme Colors - Easy to explain as "Design Constants"
  final Color darkPurple = const Color(0xFF2E1065);
  final Color lightPurple = const Color(0xFF8B5CF6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50], // The light background
      body: Column(
        children: [
          // --- 1. THE HEADER ---
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(25, 60, 25, 30),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [darkPurple, lightPurple]),
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Quick Fix", style: TextStyle(color: Colors.white70, fontSize: 14)),
                Text("Admin Console", style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
              ],
            ),
          ),

          // --- 2. THE SCROLLABLE CONTENT ---
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("System Overview", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueGrey)),
                  const SizedBox(height: 15),

                  // STATS SECTION
                  Row(
                    children: [
                      _buildStat("Active", "4", Icons.bolt, Colors.amber),
                      const SizedBox(width: 15),
                      _buildStat("Closed", "7", Icons.check_circle, lightPurple),
                    ],
                  ),

                  const SizedBox(height: 30),
                  const Text("Quick Controls", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueGrey)),
                  const SizedBox(height: 15),

                  // THE GRID SECTION (Matches your original 1:1)
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 1.1, // This keeps the cards square-ish
                    children: [
                      _buildCard(context, "Requests", "Manage Tickets", Icons.assignment_late, const RequestDetails()),
                      _buildCard(context, "History", "Past Logs", Icons.history, const AdminHistory()),
                      _buildCard(context, "Profile", "Admin Settings", Icons.person, const AdminProfile()),
                      _buildCard(context, "Techs", "Staff List", Icons.handyman, const TechnicianList()),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- REUSABLE BUILDING BLOCKS ---

  // For the Statistics Boxes
  Widget _buildStat(String label, String val, IconData icon, Color col) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: col.withOpacity(0.1), blurRadius: 10)],
        ),
        child: Row(
          children: [
            Icon(icon, color: col),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(val, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // For the Main Navigation Cards
  Widget _buildCard(BuildContext ctx, String title, String sub, IconData icon, Widget page) {
    return InkWell(
      onTap: () => Navigator.push(ctx, MaterialPageRoute(builder: (_) => page)),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 15)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 35, color: lightPurple),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(sub, style: const TextStyle(color: Colors.grey, fontSize: 11)),
          ],
        ),
      ),
    );
  }
}