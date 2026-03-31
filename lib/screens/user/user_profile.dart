import 'package:flutter/material.dart';


class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Colors.purple[800]!;

    return Column(
      children: [

        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple[900]!, Colors.purple[600]!],
            ),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.purple.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              )
            ],
          ),
          padding: const EdgeInsets.only(top: 60, bottom: 30),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 55,
                backgroundColor: Colors.white24,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 55, color: Colors.purple),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "Shirsha",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
              const Text(
                "shirsha@student.com",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),

              const SizedBox(height: 25),


              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white10),
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


        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            children: [
              _profileOption(context, Icons.settings, "Account Settings", Colors.orange, null),
              _profileOption(context, Icons.notifications, "Notifications", Colors.blue, null),

              // Added random help content
              _profileOption(context, Icons.help_outline, "Help & Support", Colors.green, () {
                _showInfoSheet(context, "Help & Support", [
                  "• How to report: Select a category from the home screen.",
                  "• Response time: Maintenance usually responds within 24 hours.",
                  "• Emergency: Call the campus helpline for urgent leaks.",
                  "• App Version: v1.0.4 (Quick-Fix Beta)"
                ]);
              }),


              _profileOption(context, Icons.security, "Privacy Policy", Colors.purple, () {
                _showInfoSheet(context, "Privacy Policy", [
                  "• We collect image data for repair validation only.",
                  "• Your location is used to identify the dorm wing.",
                  "• Data is deleted 30 days after the issue is marked 'Fixed'.",
                  "• We do not share data with third-party advertisers."
                ]);
              }),

              const SizedBox(height: 30),


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
                  onPressed: () {
                    // Logic to return to splash/login
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
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

  Widget _statItem(String label, String value) {
    return Column(
      children: [
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 11)),
      ],
    );
  }

  Widget _divider() {
    return Container(height: 30, width: 1, color: Colors.white24);
  }

  Widget _profileOption(BuildContext context, IconData icon, String title, Color color, VoidCallback? onTap) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: Colors.grey[200]!)),
      color: Colors.white,
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color, size: 22),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
        onTap: onTap ?? () {},
      ),
    );
  }

  // A clean bottom sheet to show the "random stuff" for Help/Privacy
  void _showInfoSheet(BuildContext context, String title, List<String> points) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple[900])),
            const SizedBox(height: 15),
            ...points.map((p) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(p, style: const TextStyle(fontSize: 15, color: Colors.black87)),
            )),
            const SizedBox(height: 20),
            Center(
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Got it"),
              ),
            )
          ],
        ),
      ),
    );
  }
}