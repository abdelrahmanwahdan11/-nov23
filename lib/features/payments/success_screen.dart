import 'package:flutter/material.dart';
import '../../core/widgets/buttons.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1BAF4A),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: const Icon(Icons.check, size: 40, color: Color(0xFF1BAF4A)),
            ),
            const SizedBox(height: 18),
            const Text('Congrats!', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Your lesson is booked', style: TextStyle(color: Colors.white70)),
            const SizedBox(height: 18),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('View lesson details', style: TextStyle(color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: PrimaryButton(label: 'Get Ready For Lesson', onPressed: () => Navigator.pop(context)),
            )
          ],
        ),
      ),
    );
  }
}
