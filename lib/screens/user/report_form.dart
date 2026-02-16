import 'package:flutter/material.dart';

class ReportForm extends StatefulWidget {
  const ReportForm({super.key});

  @override
  State<ReportForm> createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  // 1. Controller to capture what the user types
  final TextEditingController _descriptionController = TextEditingController();

  // 2. Default category
  String _selectedCategory = 'Electric';
  final List<String> _categories = ['Electric', 'Plumbing', 'Furniture', 'Other'];

  @override
  void dispose() {
    _descriptionController.dispose(); // Clean up the controller when the widget is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("New Request")),
      body: SingleChildScrollView( // Prevents overflow when keyboard appears
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Issue Category", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            // Category Selection Dropdown
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              items: _categories.map((String category) {
                return DropdownMenuItem(value: category, child: Text(category));
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedCategory = newValue!;
                });
              },
            ),

            const SizedBox(height: 25),

            const Text("Describe the Problem", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            // Description Text Field
            TextField(
              controller: _descriptionController,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: "e.g. The light in room 302 is flickering...",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 25),

            // Image Upload Placeholder
            const Text("Upload Image (Optional)", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                // We will add image picker logic here later
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Image picker will be added next!")),
                );
              },
              child: Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[100],
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.camera_alt, size: 40, color: Colors.blue),
                    Text("Tap to upload photo"),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Submit Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  // Logic to save the request will go here
                  print("Category: $_selectedCategory");
                  print("Description: ${_descriptionController.text}");

                  // Show success message and go back
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Request Submitted Successfully!")),
                  );
                  Navigator.pop(context);
                },
                child: const Text("Submit Request", style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}