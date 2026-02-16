import 'package:flutter/material.dart';
import '../splash_screen/splash_screen.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Profile")),
      body: Column(
        children: [
          const SizedBox(height: 30),

          // 1. Profile Header
          const Center(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            "Shirsha", // Placeholder for the user's name
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Text(
            "shirsha@student.com",
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 30),
          const Divider(),

          // 2. Profile Options List
          Expanded(
            child: ListView(
              children: [
                _profileOption(Icons.settings, "Account Settings"),
                _profileOption(Icons.notifications, "Notifications"),
                _profileOption(Icons.help_outline, "Help & Support"),

                const SizedBox(height: 20),

                // 3. Logout Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[50],
                      foregroundColor: Colors.red,
                      side: const BorderSide(color: Colors.red),
                    ),
                    onPressed: () {
                      // Logic to go back to the very start of the app
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const SplashScreen()),
                            (route) => false, // This clears the entire navigation stack
                      );
                    },
                    icon: const Icon(Icons.logout),
                    label: const Text("Logout"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper function for list items
  Widget _profileOption(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // Placeholder for future settings pages
      },
    );
  }
}