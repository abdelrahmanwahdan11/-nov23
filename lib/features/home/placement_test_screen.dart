import 'package:flutter/material.dart';
import '../../core/utils/mock_data.dart';
import '../../core/utils/models.dart';

class PlacementTestScreen extends StatelessWidget {
  const PlacementTestScreen({super.key, required this.onOpenSettings});
  final VoidCallback onOpenSettings;

  double get _completion => placementSections.where((e) => e.completed).length / placementSections.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Placement test'),
        actions: [IconButton(onPressed: onOpenSettings, icon: const Icon(Icons.settings_outlined))],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 14, offset: const Offset(0, 8))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.assessment_outlined),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text('Find your level in 10 minutes',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 18)),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text('We will run a mini interview, listening check, and share a tailored tutor short-list.'),
                const SizedBox(height: 14),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: LinearProgressIndicator(value: _completion, minHeight: 8),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text('Preview questions'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(_completion == 0 ? 'Start now' : 'Resume'),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 18),
          const Text('Sections', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 10),
          ...placementSections.map((section) => _SectionTile(section: section)),
        ],
      ),
    );
  }
}

class _SectionTile extends StatelessWidget {
  const _SectionTile({required this.section});
  final PlacementSection section;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: section.completed ? Colors.green.shade100 : Colors.grey.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(section.completed ? Icons.check_circle : Icons.radio_button_unchecked,
              color: section.completed ? Colors.green : Colors.grey),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(section.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text(section.subtitle, style: const TextStyle(color: Colors.black54)),
              ],
            ),
          ),
          Text(section.completed ? 'Done' : 'Pending', style: TextStyle(color: section.completed ? Colors.green : Colors.orange)),
        ],
      ),
    );
  }
}
