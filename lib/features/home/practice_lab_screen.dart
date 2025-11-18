import 'package:flutter/material.dart';
import '../../core/utils/mock_data.dart';
import '../../core/utils/models.dart';
import '../../core/widgets/info_tag.dart';

class PracticeLabScreen extends StatelessWidget {
  const PracticeLabScreen({super.key, required this.onOpenSettings});
  final VoidCallback onOpenSettings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practice lab'),
        actions: [IconButton(onPressed: onOpenSettings, icon: const Icon(Icons.settings_outlined))],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 12, offset: const Offset(0, 6))],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Mini drills you can finish today', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 6),
                      Text('Layer short shadowing, role-play, and feedback to prep for your next tutor call.'),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network('https://images.pexels.com/photos/1181675/pexels-photo-1181675.jpeg', width: 120, height: 120, fit: BoxFit.cover),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              InfoTag(text: 'Low energy'),
              InfoTag(text: 'Speaking'),
              InfoTag(text: 'Travel'),
              InfoTag(text: 'Career'),
              InfoTag(text: 'Pronunciation'),
            ],
          ),
          const SizedBox(height: 12),
          ...practiceDrills.map((drill) => _PracticeCard(drill: drill)).toList(),
          const SizedBox(height: 12),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            child: ListTile(
              title: const Text('Pair with your tutor'),
              subtitle: const Text('Share the drill link so they can review your notes live.'),
              leading: const Icon(Icons.link),
              trailing: ElevatedButton(onPressed: () {}, child: const Text('Share')),
            ),
          )
        ],
      ),
    );
  }
}

class _PracticeCard extends StatelessWidget {
  const _PracticeCard({required this.drill});
  final PracticeDrill drill;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(drill.focus, style: Theme.of(context).textTheme.bodySmall),
                const Spacer(),
                InfoTag(text: drill.difficulty),
              ],
            ),
            const SizedBox(height: 8),
            Text(drill.title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(drill.description),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.timer, size: 16),
                const SizedBox(width: 4),
                Text(drill.duration),
                const SizedBox(width: 12),
                const Icon(Icons.bolt, size: 16),
                const SizedBox(width: 4),
                Text(drill.energy),
                if (drill.isNew) ...const [SizedBox(width: 12), InfoTag(text: 'New')],
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.visibility_outlined), label: const Text('Preview')),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(44)),
                    child: const Text('Start drill'),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
