import 'package:flutter/material.dart';
import '../../core/utils/mock_data.dart';
import '../../core/utils/models.dart';

class ProgressDashboardScreen extends StatelessWidget {
  const ProgressDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress dashboard')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _StatRow(),
          const SizedBox(height: 16),
          Text('Achievements', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          ...achievements.map((achievement) => _AchievementCard(achievement: achievement)),
          const SizedBox(height: 20),
          Text('Weekly streak', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          const _StreakBar(),
        ],
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(child: _StatCard(title: 'Minutes', value: '145')),
        SizedBox(width: 12),
        Expanded(child: _StatCard(title: 'Words saved', value: '38')),
        SizedBox(width: 12),
        Expanded(child: _StatCard(title: 'Streak', value: '5d')),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 6),
          Text(value, style: Theme.of(context).textTheme.headlineSmall),
        ],
      ),
    );
  }
}

class _AchievementCard extends StatelessWidget {
  const _AchievementCard({required this.achievement});

  final Achievement achievement;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(achievement.earned ? Icons.emoji_events : Icons.hourglass_bottom, color: achievement.earned ? Colors.amber : Colors.grey),
              const SizedBox(width: 10),
              Text(achievement.title, style: Theme.of(context).textTheme.titleMedium),
              const Spacer(),
              Text('${(achievement.progress * 100).toInt()}%'),
            ],
          ),
          const SizedBox(height: 8),
          Text(achievement.subtitle, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: LinearProgressIndicator(
              minHeight: 8,
              value: achievement.progress,
              backgroundColor: Colors.grey.shade200,
            ),
          ),
        ],
      ),
    );
  }
}

class _StreakBar extends StatelessWidget {
  const _StreakBar();

  @override
  Widget build(BuildContext context) {
    final days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    final completed = [true, true, true, false, true, false, false];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(days.length, (index) {
        final done = completed[index];
        return Column(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: done ? Colors.green : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(done ? Icons.check : Icons.circle_outlined, color: done ? Colors.white : Colors.grey),
            ),
            const SizedBox(height: 6),
            Text(days[index]),
          ],
        );
      }),
    );
  }
}
