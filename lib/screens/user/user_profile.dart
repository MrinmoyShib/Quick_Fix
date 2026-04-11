import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    signOut() async {
      await FirebaseAuth.instance.signOut();
    }

    return Column(
      children: [
        // --- 1. THE PROFILE HEADER CARD ---
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue[800]!, Colors.blue[600]!],
            ),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              )
            ],
          ),
          padding: const EdgeInsets.only(top: 50, bottom: 30),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 55,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person, size: 55, color: Colors.white),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                user?.displayName ?? "Shirsha",
                style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
              Text(
                user?.email ?? "shirsha@student.com",
                style: const TextStyle(color: Colors.white70, fontSize: 16),
              ),

              const SizedBox(height: 25),

              // --- 2. THE STATISTICS ROW ---
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _statItem("Total", "03"),
                    _divider(),
                    _statItem("Pending", "01"),
                    _divider(),
                    _statItem("In Progress", "01"),
                    _divider(),
                    _statItem("Fixed", "01"),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // --- 3. PROFILE OPTIONS LIST ---
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            children: [
              _profileOption(Icons.settings, "Account Settings", Colors.orange),
              _profileOption(Icons.notifications, "Notifications", Colors.blue),
              _profileOption(Icons.help_outline, "Help & Support", Colors.green),
              _profileOption(Icons.security, "Privacy Policy", Colors.purple),

              const SizedBox(height: 30),

              // Logout Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    side: const BorderSide(color: Colors.red, width: 1.5),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                    ),
                  ),
                  onPressed: () => signOut(),
                  icon: const Icon(Icons.logout),
                  label: const Text(
                      "Logout",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }

  // Helper for Statistic Items
  Widget _statItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 11),
        ),
      ],
    );
  }

  // Vertical Divider for Stats
  Widget _divider() {
    return Container(height: 30, width: 1, color: Colors.white24);
  }

  // Refined Profile Option Helper
  Widget _profileOption(IconData icon, String title, Color color) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.grey[50],
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color, size: 22),
        ),
        title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
        onTap: () {},
      ),
    );
  }
}
