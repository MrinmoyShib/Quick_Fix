import 'package:flutter/material.dart';

class RequestDetails extends StatelessWidget {
  const RequestDetails({super.key});

  final Color primaryColor = const Color(0xFF8B5CF6);
  final Color darkColor = const Color(0xFF2E1065);

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
                  _buildRequestCard(context, "QF-8859", "Electrician", "Short Circuit Fix", "Bruce Banner", "House No. 45, Road No. 12, Dhanmondi, Dhaka", "Main breaker keeps tripping."),
                  _buildRequestCard(context, "QF-8860", "Plumbing", "Kitchen Sink Leak", "Diana Prince", "Plot No. 23, Sector 7, Nasirabad, Chattogram", "Pipe crack under the sink."),
                  _buildRequestCard(context, "QF-8861", "Electrician", "Fan Installation", "Barry Allen", "Flat 5B, Building 12, Zindabazar, Sylhet", "Installing two ceiling fans."),
                  _buildRequestCard(context, "QF-8862", "Electrician", "AC Repair", "Thor Odinson", "House No. 15, Road No. 4, Sector 3, Uttara, Dhaka", "AC not working."),
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
        gradient: LinearGradient(colors: [darkColor, primaryColor]),
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
              Text("Management", style: TextStyle(color: Colors.white70, fontSize: 14)),
              Text("New Requests", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRequestCard(BuildContext context, String id, String cat, String title, String user, String addr, String desc) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 15, offset: const Offset(0, 8)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(id, style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold)),
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
              Expanded(child: _btn("Reject", Colors.redAccent, false)),
              const SizedBox(width: 12),
              Expanded(child: _btn("Approve", Colors.green, true)),
            ],
          ),
        ],
      ),
    );
  }

  // --- THE FIX IS IN THIS FUNCTION ---
  Widget _iconLine(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Aligns icon to top if text wraps
        children: [
          Icon(icon, size: 16, color: primaryColor),
          const SizedBox(width: 8),
          // We wrap the text in Expanded to stop the "Yellow Stripe" error
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.blueGrey, fontSize: 13),
              softWrap: true, // This allows the text to go to the next line
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: primaryColor.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
      child: Text(label, style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 10)),
    );
  }

  Widget _btn(String label, Color col, bool isFilled) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: isFilled ? col : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: col),
      ),
      child: Center(
        child: Text(label, style: TextStyle(color: isFilled ? Colors.white : col, fontWeight: FontWeight.bold)),
      ),
    );
  }
}