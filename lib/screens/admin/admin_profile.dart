import 'package:flutter/material.dart';

class AdminProfile extends StatelessWidget {
  const AdminProfile({super.key});

  final Color adminAccent = const Color(0xFF2E1065); // Midnight Purple
  final Color adminPrimary = const Color(0xFF8B5CF6); // Electric Violet

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  _field("Full Name", "Mrinmoy", Icons.person),
                  _field("Employee ID", "QF-10", Icons.badge),
                  _field("Phone", "+8801234567890", Icons.phone),
                  _field("Access", "Admin", Icons.shield),
                  const SizedBox(height: 30),
                  _actionButton(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 60, bottom: 30),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [adminAccent, adminPrimary]),
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      child: Column(
        children: [
          Align(alignment: Alignment.topLeft, child: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.pop(context))),
          const CircleAvatar(radius: 50, backgroundColor: Colors.white24, child: Icon(Icons.person, size: 60, color: Colors.white)),
          const SizedBox(height: 10),
          const Text("System Admin", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
          const Text("mrinmoy.admin@quickfix.com", style: TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }

  // REUSABLE FIELD: This is the "Smart" way to code
  Widget _field(String label, String val, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)]),
      child: TextField(
        controller: TextEditingController(text: val),
        decoration: InputDecoration(labelText: label, prefixIcon: Icon(icon, color: adminPrimary), border: InputBorder.none, contentPadding: const EdgeInsets.all(15)),
      ),
    );
  }

  Widget _actionButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: adminPrimary, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
        onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Profile Updated"))),
        child: const Text("Save Changes", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}