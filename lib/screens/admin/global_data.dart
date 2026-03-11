import 'package:flutter/material.dart';

class ServiceRequest {
  String id, category, title, user, address, description, status;
  String? assignedTech;
  ServiceRequest({
    required this.id, required this.category, required this.title,
    required this.user, required this.address, required this.description,
    required this.status, this.assignedTech,
  });
}

class Technician {
  String name, role, status;
  String? currentOrder;
  Technician({required this.name, required this.role, required this.status, this.currentOrder});
}

// 7 NEW REQUESTS
List<ServiceRequest> pendingRequests = [
  ServiceRequest(id: "QF-8859", category: "Electrician", title: "Short Circuit Fix", user: "Bruce Banner", address: "Dhanmondi, Dhaka", description: "Main breaker trips.", status: "Pending"),
  ServiceRequest(id: "QF-8860", category: "Plumbing", title: "Kitchen Sink Leak", user: "Diana Prince", address: "Nasirabad, Chattogram", description: "Pipe crack.", status: "Pending"),
  ServiceRequest(id: "QF-8861", category: "Electrician", title: "Fan Installation", user: "Barry Allen", address: "Zindabazar, Sylhet", description: "Two fans.", status: "Pending"),
  ServiceRequest(id: "QF-8862", category: "AC Specialist", title: "AC Repair", user: "Thor Odinson", address: "Uttara, Dhaka", description: "Not cooling.", status: "Pending"),
  ServiceRequest(id: "QF-8863", category: "Plumbing", title: "Toilet Flush", user: "Arthur Curry", address: "Banani, Dhaka", description: "Flush tank fix.", status: "Pending"),
  ServiceRequest(id: "QF-8864", category: "AC Specialist", title: "Full Servicing", user: "Wanda Maximoff", address: "Gulshan, Dhaka", description: "Cleaning.", status: "Pending"),
  ServiceRequest(id: "QF-8865", category: "General Repair", title: "Door Hinge", user: "Steve Rogers", address: "Mirpur, Dhaka", description: "Squeaky noise.", status: "Pending"),
];

// PRE-FILLED HISTORY (7 ITEMS)
List<ServiceRequest> historyLogs = [
  ServiceRequest(id: "QF-1001", category: "Furniture", title: "Sofa Repair", user: "John Doe", address: "Dhaka", description: "Fabric change", status: "Finished"),
  ServiceRequest(id: "QF-1002", category: "Plumbing", title: "Tap Leak", user: "Jane Smith", address: "Chattogram", description: "Washroom tap", status: "Finished"),
  ServiceRequest(id: "QF-1003", category: "Electrician", title: "Light Fix", user: "Mike Ross", address: "Sylhet", description: "Bulb socket", status: "Cancelled"),
  ServiceRequest(id: "QF-1004", category: "General Repair", title: "Wall Paint", user: "Harvey Specter", address: "Dhaka", description: "Touch up", status: "Finished"),
  ServiceRequest(id: "QF-1005", category: "AC Specialist", title: "Filter Clean", user: "Rachel Zane", address: "Rajshahi", description: "Dusty filter", status: "Finished"),
  ServiceRequest(id: "QF-1006", category: "Plumbing", title: "Pipe Burst", user: "Donna Paulsen", address: "Cumilla", description: "Kitchen pipe", status: "Cancelled"),
  ServiceRequest(id: "QF-1007", category: "Electrician", title: "Wiring Check", user: "Louis Litt", address: "Dhaka", description: "Old house", status: "Finished"),
];

List<Technician> techStaff = [
  Technician(name: "Steve Rogers", role: "Electrician", status: "Available"),
  Technician(name: "Peter Parker", role: "Plumber", status: "Available"),
  Technician(name: "Clark Kent", role: "Electrician", status: "Available"),
  Technician(name: "Tony Stark", role: "AC Specialist", status: "Available"),
  Technician(name: "Bruce Wayne", role: "General Repair", status: "Available"),
];