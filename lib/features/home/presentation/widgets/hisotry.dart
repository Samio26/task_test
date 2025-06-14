import 'package:flutter/material.dart';

class CustomStepper extends StatelessWidget {
  const CustomStepper({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500, 
      child: Stack(
        children: [
          Positioned(
            left: 14,
            top: 0,
            bottom: 0,
            child: Image.asset(
              'assets/images/timeline.png',
              fit: BoxFit.fill,
              height: double.infinity,
            ),
          ),

          ListView(
            children: [
              buildStep(),
              const SizedBox(height: 40),
              buildStep(),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildStep() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       const SizedBox(width: 50), 
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF0D1B1E),
              border: Border.all(color: Colors.grey.shade700),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Label", style: TextStyle(color: Colors.white70)),
                const SizedBox(height: 4),
                const Text(
                  "Title",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                const Text("Description", style: TextStyle(fontSize: 16, color: Colors.white)),
                const Text("Description", style: TextStyle(fontSize: 16, color: Colors.white)),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  color: const Color(0xFF111517),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    const  Row(
                        children: const [
                          Icon(Icons.attach_file, color: Colors.white70, size: 18),
                          SizedBox(width: 6),
                          Text("Attachments", style: TextStyle(color: Colors.white70)),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(3, (index) {
                          return Container(
                            width: 70,
                            height: 70,
                            color: Colors.grey.shade300,
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
