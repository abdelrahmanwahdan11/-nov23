import 'package:flutter/material.dart';
import '../../core/utils/mock_data.dart';
import '../../core/utils/models.dart';
import '../../core/widgets/section_title.dart';

class AlumniNetworkScreen extends StatelessWidget {
  const AlumniNetworkScreen({super.key, required this.onOpenSettings});
  final VoidCallback onOpenSettings;

  @override
  Widget build(BuildContext context) {
    final cardColor = Theme.of(context).cardColor;
    final primary = Theme.of(context).colorScheme.primary;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alumni network'),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
        actions: [IconButton(onPressed: onOpenSettings, icon: const Icon(Icons.settings_outlined))],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.grey.withOpacity(0.12)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: primary.withOpacity(0.12), borderRadius: BorderRadius.circular(16)),
                  child: Icon(Icons.groups_2_outlined, color: primary),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Learn from alumni wins', style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      Text('Stories, roles, and habits from recent graduates staying fluent.',
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                ),
                FilledButton(onPressed: () {}, child: const Text('Message')),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const SectionTitle(text: 'Spotlights'),
          ...alumniStories.map((story) => _SpotlightCard(story: story)),
          const SizedBox(height: 12),
          const SectionTitle(text: 'Upcoming meetups'),
          _MeetupCard(title: 'Peer mock interview', time: 'Tonight • 7:00 PM', location: 'Virtual'),
          _MeetupCard(title: 'Portfolio swap', time: 'Thu • 6:30 PM', location: 'Virtual'),
        ],
      ),
    );
  }
}

class _SpotlightCard extends StatelessWidget {
  const _SpotlightCard({required this.story});
  final AlumniSpotlight story;

  @override
  Widget build(BuildContext context) {
    final cardColor = Theme.of(context).cardColor;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.withOpacity(0.12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(radius: 26, backgroundImage: NetworkImage(story.avatarUrl)),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(story.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text('${story.role} • ${story.company}'),
                  ],
                ),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark_border)),
            ],
          ),
          const SizedBox(height: 10),
          Text(story.story),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            children: const [
              Chip(label: Text('Fluency')), Chip(label: Text('Career')), Chip(label: Text('Habits')),
            ],
          ),
        ],
      ),
    );
  }
}

class _MeetupCard extends StatelessWidget {
  const _MeetupCard({required this.title, required this.time, required this.location});
  final String title;
  final String time;
  final String location;

  @override
  Widget build(BuildContext context) {
    final cardColor = Theme.of(context).cardColor;
    final primary = Theme.of(context).colorScheme.primary;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.withOpacity(0.12)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: primary.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
            child: Icon(Icons.event_available_outlined, color: primary),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                Text('$time • $location'),
              ],
            ),
          ),
          OutlinedButton(onPressed: () {}, child: const Text('RSVP')),
        ],
      ),
    );
  }
}
