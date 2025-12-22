import 'package:flutter/material.dart';

class SimpleReportDialog extends StatefulWidget {
  const SimpleReportDialog({super.key});

  @override
  State<SimpleReportDialog> createState() => _SimpleReportDialogState();
}

class _SimpleReportDialogState extends State<SimpleReportDialog> {
  int selectedTab = 0;
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color(0xFF242424),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF242424),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 1, color: Colors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.all(11),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tab Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTab("Report Product", 0),
                    const SizedBox(width: 16),
                    _buildTab("Report Seller", 1),
                  ],
                ),

                const SizedBox(height: 24),

                // Description label
                _buildLabel("Description"),

                const SizedBox(height: 8),

                // Text Field
                TextField(
                  controller: descriptionController,
                  maxLines: 4,
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    fillColor: Color(0xFF444444),
                    filled: true,
                    hintText: "Please enter your email address",
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Attach Picture Label
                _buildLabel("Attach Picture"),

                const SizedBox(height: 8),

                // Upload Box
                Container(
                  height: 140,
                  decoration: BoxDecoration(
                    color: Color(0xFF444444),
                    border: Border.all(color: Colors.white, width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Color(0xFF3D4F3A),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.upload,
                            color: Colors.green,
                            size: 32,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Click here",
                              style: TextStyle(
                                color: Colors.green.shade300,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              " to upload or drop media here",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Submit Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle submit
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Submit",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Simple label with *
  Widget _buildLabel(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          text: title,
          style: const TextStyle(color: Colors.white, fontSize: 14),
          children: const [
            TextSpan(
              text: ' *',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }

  // Tab builder
  Widget _buildTab(String title, int index) {
    final isSelected = selectedTab == index;
    return GestureDetector(
      onTap: () => setState(() => selectedTab = index),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            height: 2,
            width: 100,
            color: isSelected ? Colors.green : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
