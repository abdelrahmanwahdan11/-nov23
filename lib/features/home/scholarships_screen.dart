import 'package:flutter/material.dart';
import '../../core/utils/mock_data.dart';

class ScholarshipsScreen extends StatelessWidget {
  const ScholarshipsScreen({super.key, required this.onOpenSettings});

  final VoidCallback onOpenSettings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scholarships & grants'),
        actions: [IconButton(onPressed: onOpenSettings, icon: const Icon(Icons.settings_outlined))],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: scholarshipOpportunities.length,
        itemBuilder: (context, index) {
          final opp = scholarshipOpportunities[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 14),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.withOpacity(0.12)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                      child: const Icon(Icons.volunteer_activism_outlined),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(opp.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          Text('${opp.provider} • ${opp.level}', style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                    ),
                    Chip(label: Text(opp.tag)),
                  ],
                ),
                const SizedBox(height: 10),
                Text(opp.summary),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _Badge(label: opp.amount, icon: Icons.payments_outlined),
                    const SizedBox(width: 8),
                    _Badge(label: opp.deadline, icon: Icons.schedule_outlined),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Details'),
                    ),
                    const SizedBox(width: 10),
                    TextButton(onPressed: () {}, child: const Text('Save for later')),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.label, required this.icon});
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.06),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [Icon(icon, size: 16), const SizedBox(width: 6), Text(label)],
      ),
    );
  }
}
