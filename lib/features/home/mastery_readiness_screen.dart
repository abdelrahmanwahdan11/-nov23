import 'package:flutter/material.dart';
import '../../core/utils/mock_data.dart';
import '../../core/utils/models.dart';

class MasteryReadinessScreen extends StatelessWidget {
  const MasteryReadinessScreen({super.key, required this.onOpenSettings});

  final VoidCallback onOpenSettings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Final readiness'),
        actions: [IconButton(onPressed: onOpenSettings, icon: const Icon(Icons.settings_outlined))],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.06),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Dial in your final defense', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
                SizedBox(height: 8),
                Text('Use the checklist to simulate a final defense, tighten weak spots, and ship your capstone with confidence.'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ...masteryChecklists.map((item) => _ChecklistCard(item: item)).toList(),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.play_circle_outline),
            label: const Text('Start mock defense now'),
            style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
          ),
        ],
      ),
    );
  }
}

class _ChecklistCard extends StatelessWidget {
  const _ChecklistCard({required this.item});
  final MasteryChecklist item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.12)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 6))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(item.summary, style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text('Coach ${item.coach}', style: TextStyle(color: Theme.of(context).colorScheme.primary)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            value: item.progress,
            minHeight: 6,
            borderRadius: BorderRadius.circular(8),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 6,
            children: item.actions
                .map<Widget>((action) => Chip(
                      label: Text(action),
                      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.06),
                      labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface),
                    ))
                .toList(),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text('${(item.progress * 100).round()}% ready', style: Theme.of(context).textTheme.bodySmall),
              const Spacer(),
              TextButton.icon(onPressed: () {}, icon: const Icon(Icons.check_circle_outline), label: const Text('Mark step done')),
            ],
          ),
        ],
      ),
    );
  }
}
