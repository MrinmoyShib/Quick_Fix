import 'package:flutter/material.dart';
import '../splash_screen/splash_screen.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold removed to integrate seamlessly with the BottomNavigationBar in UserHome
    return Column(
      children: [
        const SizedBox(height: 40),

        // Profile Header
        const Center(
          child: CircleAvatar(
            radius: 60,
            backgroundColor: Colors.blue,
            child: Icon(Icons.person, size: 60, color: Colors.white),
          ),
        ),
        const SizedBox(height: 15),
        const Text(
          "Shirsha",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        const Text(
          "shirsha@student.com",
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),

        const SizedBox(height: 40),
        const Divider(indent: 20, endIndent: 20),

        // Profile Options
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            children: [
              _profileOption(Icons.settings, "Account Settings"),
              _profileOption(Icons.notifications, "Notifications"),
              _profileOption(Icons.help_outline, "Help & Support"),

              const SizedBox(height: 30),

              // Logout Button - Handles Authorization Requirement
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    side: const BorderSide(color: Colors.red),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    // Clears the stack and returns to Splash for security
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const SplashScreen()),
                          (route) => false,
                    );
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text("Logout", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _profileOption(IconData icon, String title) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.blue[800]),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {},
    );
  }
}