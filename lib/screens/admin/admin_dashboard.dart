import 'package:flutter/material.dart';
import 'global_data.dart';
import 'admin_history.dart';
import 'admin_profile.dart';
import 'technician_list.dart';
import 'request_details.dart';
import 'app_colors.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});
  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    int activeCount = historyLogs.where((e) => e.status == "Ongoing").length;
    // Closed = Finished + Cancelled
    int closedCount = historyLogs.where((e) => e.status == "Finished" || e.status == "Cancelled").length;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildHeader(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("System Overview", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueGrey)),
                const SizedBox(height: 15),
                Row(
                  children: [
                    _buildStat("Active", "$activeCount", Icons.bolt, Colors.amber),
                    const SizedBox(width: 15),
                    _buildStat("Closed", "$closedCount", Icons.check_circle, AppColors.lightPurple),
                  ],
                ),
                const SizedBox(height: 30),
                const Text("Quick Controls", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueGrey)),
                const SizedBox(height: 15),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.1,
                  children: [
                    _buildCard(context, "Requests", "New (${pendingRequests.length})", Icons.assignment_late, const RequestDetails()),
                    _buildCard(context, "History", "Past Logs", Icons.history, const AdminHistory()),
                    _buildCard(context, "Profile", "Admin Settings", Icons.person, const AdminProfile()),
                    _buildCard(context, "Techs", "Staff List", Icons.handyman, const TechnicianList()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(25, 60, 25, 30),
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [AppColors.darkPurple, AppColors.lightPurple]),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      child: const Column(children: [
        Text("Quick Fix", style: TextStyle(color: Colors.white70, fontSize: 14)),
        Text("Admin Console", style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
      ]),
    );
  }

  Widget _buildStat(String label, String val, IconData icon, Color col) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: col.withOpacity(0.1), blurRadius: 10)]),
        child: Row(children: [
          Icon(icon, color: col),
          const SizedBox(width: 10),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(val, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ]),
        ]),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, String sub, IconData icon, Widget page) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => page)).then((_) => setState(() {})),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10)]),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(icon, size: 30, color: AppColors.lightPurple),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          Text(sub, textAlign: TextAlign.center, style: const TextStyle(color: Colors.grey, fontSize: 10)),
        ]),
      ),
    );
  }
}