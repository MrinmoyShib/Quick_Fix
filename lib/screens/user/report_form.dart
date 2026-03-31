import 'package:flutter/material.dart';

class ReportForm extends StatefulWidget {
  final String initialCategory;

  const ReportForm({super.key, required this.initialCategory});

  @override
  State<ReportForm> createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  final TextEditingController _descriptionController = TextEditingController();

  bool _isButtonEnabled = false;
  bool _showSuccess = false;

  @override
  void initState() {
    super.initState();
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
    final primaryColor = Colors.purple[800]!;

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        title: const Text("New Request",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Selected Category",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.purple[900],
                        fontSize: 16)),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                  decoration: BoxDecoration(
                    color: Colors.purple[50],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.purple[100]!),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.check_circle, color: primaryColor),
                      const SizedBox(width: 12),
                      Text(
                        widget.initialCategory,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Describe the Problem",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.purple[900],
                            fontSize: 16)),

                  ],
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _descriptionController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "What exactly is broken? (min. 10 chars)",
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: primaryColor, width: 2),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text("Reference Photo (Optional)",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.purple[900],
                        fontSize: 16)),
                const SizedBox(height: 12),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 140,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple[100]!, width: 2),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.camera_alt_outlined,
                            size: 40, color: primaryColor),
                        const SizedBox(height: 8),
                        Text("Tap to upload image",
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w500)),
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
                      backgroundColor: primaryColor,
                      disabledBackgroundColor: Colors.grey[300],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: _isButtonEnabled ? 4 : 0,
                    ),
                    onPressed: _isButtonEnabled ? _handleSubmission : null,
                    child: const Text("Submit Request",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
          if (_showSuccess)
            Positioned.fill(
              child: Container(
                color: Colors.white.withOpacity(0.95),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.check_circle_outline,
                          size: 100, color: Colors.green),
                      const SizedBox(height: 20),
                      Text("Request Sent!",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple[900])),
                      const SizedBox(height: 8),
                      const Text("We're on it. Check 'History' for updates.",
                          style: TextStyle(color: Colors.grey)),
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