import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'global_data.dart';

class RequestDetails extends StatefulWidget {
  const RequestDetails({super.key});
  @override
  State<RequestDetails> createState() => _RequestDetailsState();
}

class _RequestDetailsState extends State<RequestDetails> {
  void handleAction(ServiceRequest request, bool approved) {
    setState(() {
      if (approved) {
        var tech = techStaff.firstWhere(
              (t) {
            String role = t.role.toLowerCase();
            String cat = request.category.toLowerCase();
            // This checks if the words match (like Plumb in Plumber and Plumbing)
            bool isMatch = cat.contains(role.substring(0, 5)) || role.contains(cat.substring(0, 5));
            return isMatch && t.status == "Available";
          },
          orElse: () => Technician(name: "None", role: "", status: ""),
        );

        if (tech.name != "None") {
          tech.status = "Busy";
          tech.currentOrder = "Order #${request.id}";
          request.status = "Ongoing";
          request.assignedTech = tech.name;
          historyLogs.insert(0, request);
          pendingRequests.remove(request);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Assigned to ${tech.name}")));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("No technician available!")));
        }
      } else {
        request.status = "Cancelled";
        historyLogs.insert(0, request);
        pendingRequests.remove(request);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: pendingRequests.isEmpty
                ? const Center(child: Text("No new requests", style: TextStyle(color: Colors.grey)))
                : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: pendingRequests.length,
              itemBuilder: (context, index) => _buildRequestCard(pendingRequests[index]),
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
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [AppColors.darkPurple, AppColors.lightPurple]),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      child: Row(
        children: [
          IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.pop(context)),
          const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Management", style: TextStyle(color: Colors.white70, fontSize: 14)),
            Text("New Requests", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
          ]),
        ],
      ),
    );
  }

  Widget _buildRequestCard(ServiceRequest req) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 15)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(req.id, style: const TextStyle(color: AppColors.lightPurple, fontWeight: FontWeight.bold)),
            _buildBadge(req.category),
          ]),
          const SizedBox(height: 5),
          Text(req.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(height: 25),
          _iconLine(Icons.person_outline, "User: ${req.user}"),
          _iconLine(Icons.location_on_outlined, "Location: ${req.address}"),
          const SizedBox(height: 10),
          Text(req.description, style: const TextStyle(fontSize: 14, color: Colors.black87)),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: _btn("Reject", Colors.red, () => handleAction(req, false))),
              const SizedBox(width: 12),
              Expanded(child: _btn("Approve", Colors.green, () => handleAction(req, true))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _iconLine(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(children: [
        Icon(icon, size: 16, color: AppColors.lightPurple),
        const SizedBox(width: 8),
        Expanded(child: Text(text, style: const TextStyle(color: Colors.blueGrey, fontSize: 13))),
      ]),
    );
  }

  Widget _buildBadge(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: AppColors.lightPurple.withOpacity(0.05), borderRadius: BorderRadius.circular(10)),
      child: Text(label, style: const TextStyle(color: AppColors.lightPurple, fontWeight: FontWeight.bold, fontSize: 10)),
    );
  }

  Widget _btn(String label, Color col, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        decoration: BoxDecoration(color: col, borderRadius: BorderRadius.circular(12)),
        child: Center(child: Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      ),
    );
  }
}