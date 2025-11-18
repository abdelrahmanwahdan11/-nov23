import 'package:flutter/material.dart';
import '../../core/utils/mock_data.dart';
import '../../core/utils/models.dart';
import '../../core/widgets/section_title.dart';

class StreaksScreen extends StatelessWidget {
  const StreaksScreen({super.key, required this.onOpenSettings});
  final VoidCallback onOpenSettings;

  int _currentStreak() {
    int streak = 0;
    for (final day in streakDays.reversed) {
      if (day.completed) {
        streak++;
      } else {
        break;
      }
    }
    return streak;
  }

  @override
  Widget build(BuildContext context) {
    final streak = _currentStreak();
    final cardColor = Theme.of(context).cardColor;
    final onSurface = Theme.of(context).colorScheme.onSurface;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Streaks'),
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
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary.withOpacity(0.12), borderRadius: BorderRadius.circular(16)),
                  child: Icon(Icons.local_fire_department, color: Theme.of(context).colorScheme.primary),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Current streak', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text('$streak days in a row', style: Theme.of(context).textTheme.bodyLarge),
                      const SizedBox(height: 8),
                      LinearProgressIndicator(value: (streak / streakDays.length).clamp(0.0, 1.0), minHeight: 6),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.emoji_events_outlined), label: const Text('Boost')),
              ],
            ),
          ),
          const SizedBox(height: 18),
          const SectionTitle(text: 'This week'),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: streakDays
                .map(
                  (day) => _StreakChip(
                    day: day,
                    active: day.completed,
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 18),
          const SectionTitle(text: 'Next rewards'),
          ...rewardItems.map((item) => _RewardProgressCard(item: item)),
          const SizedBox(height: 10),
          const SectionTitle(text: 'Momentum tips'),
          Text(
            'Lock your streak with a 5-minute check-in or by marking one drill as done. Double XP days count twice.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: onSurface.withOpacity(0.8)),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.shield_moon_outlined),
            label: const Text('Enable streak freeze'),
          )
        ],
      ),
    );
  }
}

class _StreakChip extends StatelessWidget {
  const _StreakChip({required this.day, required this.active});
  final StreakDay day;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    final label = '${day.date.month}/${day.date.day}';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: active ? color.withOpacity(0.14) : Theme.of(context).chipTheme.backgroundColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: active ? color : Colors.grey.withOpacity(0.25)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(active ? Icons.check_circle : Icons.radio_button_unchecked, size: 18, color: active ? color : Colors.grey),
          const SizedBox(width: 6),
          Text(label, style: TextStyle(color: active ? color : Theme.of(context).colorScheme.onSurface)),
          if (day.doubleXp) ...[
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(color: Colors.green.withOpacity(0.15), borderRadius: BorderRadius.circular(12)),
              child: const Text('2x', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
            )
          ]
        ],
      ),
    );
  }
}

class _RewardProgressCard extends StatelessWidget {
  const _RewardProgressCard({required this.item});
  final RewardItem item;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.12)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: color.withOpacity(0.12), borderRadius: BorderRadius.circular(12)),
            child: Icon(Icons.card_giftcard, color: color),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: Text(item.title, style: const TextStyle(fontWeight: FontWeight.w700))),
                    if (item.tag != null)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(color: Colors.green.withOpacity(0.16), borderRadius: BorderRadius.circular(10)),
                        child: Text(item.tag!, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.w700, fontSize: 12)),
                      ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(item.description, maxLines: 2, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.stars, size: 18, color: color),
                    const SizedBox(width: 6),
                    Text('${item.points} pts'),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(width: 12),
          FilledButton(onPressed: () {}, child: const Text('Redeem')),
        ],
      ),
    );
  }
}
