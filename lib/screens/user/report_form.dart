import 'package:flutter/material.dart';

class ReportForm extends StatefulWidget {
  // Added an optional parameter to receive the category from Home
  final String? initialCategory;

  const ReportForm({super.key, this.initialCategory});

  @override
  State<ReportForm> createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  final TextEditingController _descriptionController = TextEditingController();

  // We use late so we can initialize it based on the widget parameter
  late String _selectedCategory;
  final List<String> _categories = ['Electric', 'Plumbing', 'Furniture', 'Other'];

  bool _isButtonEnabled = false;
  bool _showSuccess = false;

  @override
  void initState() {
    super.initState();
    // Use the passed category if it exists, otherwise default to 'Electric'
    _selectedCategory = widget.initialCategory ?? 'Electric';
    _descriptionController.addListener(_validateForm);
  }

  void _validateForm() {
    final bool isDescriptionValid = _descriptionController.text.trim().length >= 10;
    if (isDescriptionValid != _isButtonEnabled) {
      setState(() {
        _isButtonEnabled = isDescriptionValid;
      });
    }
  }

  @override
  void dispose() {
    _descriptionController.removeListener(_validateForm);
    _descriptionController.dispose();
    super.dispose();
  }

  void _handleSubmission() async {
    setState(() {
      _showSuccess = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Request", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[800],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Issue Category",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[900])),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: _selectedCategory,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blue[50],
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                    prefixIcon: const Icon(Icons.category, color: Colors.blue),
                  ),
                  items: _categories.map((String category) {
                    return DropdownMenuItem(value: category, child: Text(category));
                  }).toList(),
                  onChanged: (newValue) => setState(() => _selectedCategory = newValue!),
                ),

                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Describe the Problem",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[900])),
                    Text(
                      "${_descriptionController.text.length}/10",
                      style: TextStyle(
                        color: _isButtonEnabled ? Colors.green : Colors.red,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _descriptionController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: "Describe the issue here (min. 10 characters)...",
                    filled: true,
                    fillColor: Colors.blue[50],
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                  ),
                ),

                const SizedBox(height: 25),

                Text("Upload Image (Optional)",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[900])),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue[200]!, width: 2),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue[50]?.withOpacity(0.5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_a_photo, size: 40, color: Colors.blue[700]),
                        const SizedBox(height: 8),
                        Text("Add photo for reference", style: TextStyle(color: Colors.blue[700])),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isButtonEnabled ? Colors.blue[800] : Colors.grey,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: _isButtonEnabled ? 5 : 0,
                    ),
                    onPressed: _isButtonEnabled ? _handleSubmission : null,
                    child: const Text("Submit Request", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
          if (_showSuccess)
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: _showSuccess ? 1.0 : 0.0,
              child: Container(
                color: Colors.white.withOpacity(0.9),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TweenAnimationBuilder(
                        duration: const Duration(milliseconds: 600),
                        tween: Tween<double>(begin: 0, end: 1),
                        builder: (context, double value, child) {
                          return Transform.scale(
                            scale: value,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.blue[800],
                              child: const Icon(Icons.check, size: 60, color: Colors.white),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      Text("Request Submitted!", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue[800])),
                      const Text("We will notify you soon.", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}