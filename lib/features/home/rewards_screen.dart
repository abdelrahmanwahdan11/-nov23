import 'package:flutter/material.dart';
import '../../core/utils/mock_data.dart';
import '../../core/utils/models.dart';
import '../../core/widgets/section_title.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key, required this.onOpenSettings});
  final VoidCallback onOpenSettings;

  @override
  Widget build(BuildContext context) {
    final cardColor = Theme.of(context).cardColor;
    final primary = Theme.of(context).colorScheme.primary;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rewards'),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
        actions: [IconButton(onPressed: onOpenSettings, icon: const Icon(Icons.settings_outlined))],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.grey.withOpacity(0.12)),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: primary.withOpacity(0.14),
                  child: Icon(Icons.workspace_premium_outlined, color: primary, size: 32),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('You have'),
                      Text('620 points', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      Text('Earn points with streaks, feedback, and attending events.', style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                ),
                FilledButton(onPressed: () {}, child: const Text('Earn more'))
              ],
            ),
          ),
          const SizedBox(height: 18),
          const SectionTitle(text: 'Available rewards'),
          ...rewardItems.map((item) => _RewardTile(item: item)),
          const SizedBox(height: 12),
          const SectionTitle(text: 'How to earn'),
          ListTile(
            leading: const Icon(Icons.timer_outlined),
            title: const Text('Complete a practice drill'),
            subtitle: const Text('+20 pts • auto-applied'),
            trailing: OutlinedButton(onPressed: () {}, child: const Text('Try now')),
          ),
          ListTile(
            leading: const Icon(Icons.event_available_outlined),
            title: const Text('Join a live event'),
            subtitle: const Text('+45 pts • RSVP early'),
            trailing: OutlinedButton(onPressed: () {}, child: const Text('View events')),
          ),
          ListTile(
            leading: const Icon(Icons.rate_review_outlined),
            title: const Text('Share weekly feedback'),
            subtitle: const Text('+30 pts • unlock bonus draws'),
            trailing: OutlinedButton(onPressed: () {}, child: const Text('Open survey')),
          ),
        ],
      ),
    );
  }
}

class _RewardTile extends StatelessWidget {
  const _RewardTile({required this.item});
  final RewardItem item;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.withOpacity(0.12)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: primary.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
            child: const Icon(Icons.card_giftcard),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: Text(item.title, style: const TextStyle(fontWeight: FontWeight.w700))),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(color: Colors.orange.withOpacity(0.14), borderRadius: BorderRadius.circular(10)),
                      child: Text('${item.points} pts', style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(item.description, maxLines: 2, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          const SizedBox(width: 10),
          FilledButton(onPressed: () {}, child: const Text('Redeem')),
        ],
      ),
    );
  }
}
