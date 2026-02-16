import 'package:flutter/material.dart';
import 'report_form.dart';
import 'my_requests.dart';
import 'user_profile.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  int _selectedIndex = 0;

  // The list of pages that the BottomNavigationBar will toggle
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      _buildHomeContent(), // Index 0
      const MyRequests(),   // Index 1
      const UserProfile(),  // Index 2
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quick-Fix",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue[800],
        centerTitle: true,
        elevation: 0,
        // Optional: Ensure no back arrow appears on the home screen
        automaticallyImplyLeading: false,
      ),
      body: _pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue[800],
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Requests'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildHomeContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Welcome Back!",
            style: TextStyle(fontSize: 16, color: Colors.blueGrey),
          ),
          const Text(
            "What needs fixing?",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          const SizedBox(height: 25),

          // Categories Grid
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            children: [
              _categoryCard("Electric", Icons.electrical_services, Colors.blue[700]!),
              _categoryCard("Plumbing", Icons.plumbing, Colors.blue[500]!),
              _categoryCard("Furniture", Icons.chair, Colors.blue[300]!),
              _categoryCard("Other", Icons.more_horiz, Colors.blue[100]!),
            ],
          ),

          const SizedBox(height: 30),

          const Text(
            "Quick Actions",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueGrey),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.blue[700]!, Colors.blue[400]!]),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.blue.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4)
                )
              ],
            ),
            child: Column(
              children: [
                const Text("Need immediate help?",
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue[800]
                  ),
                  // Passing 'Other' as default for the generic quick action button
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ReportForm(initialCategory: 'Other')
                      )
                  ),
                  child: const Text("Create New Ticket"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryCard(String title, IconData icon, Color color) {
    return InkWell(
      // Passing the category title to the ReportForm
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ReportForm(initialCategory: title)
          )
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 2
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.1),
              radius: 30,
              child: Icon(icon, size: 35, color: color),
            ),
            const SizedBox(height: 12),
            Text(title,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900]
                )
            ),
          ],
        ),
      ),
    );
  }
}