import 'package:flutter/material.dart';
import '../../core/utils/mock_data.dart';
import '../../core/utils/models.dart';
import '../../core/widgets/info_tag.dart';

class SessionDetailsScreen extends StatelessWidget {
  const SessionDetailsScreen({super.key, required this.session, required this.onOpenSettings});

  final LessonSession session;
  final VoidCallback onOpenSettings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Session details'),
        actions: [IconButton(onPressed: onOpenSettings, icon: const Icon(Icons.settings_outlined))],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _SessionSummary(session: session),
          const SizedBox(height: 16),
          Text('Agenda', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          ...sessionSteps.map((step) => _StepTile(step: step)),
          const SizedBox(height: 20),
          Text('Notes', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          _NoteCard(
            title: 'Homework',
            body: 'Record a 2-min intro about your city and upload tomorrow. Focus on past tense.',
          ),
          _NoteCard(
            title: 'Feedback',
            body: 'Great pace! Watch the "th" sound, and keep sentences shorter for clarity.',
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.calendar_month_outlined),
            label: const Text('Reschedule'),
            style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.chat_bubble_outline),
            label: const Text('Message tutor'),
            style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
          )
        ],
      ),
    );
  }
}

class _SessionSummary extends StatelessWidget {
  const _SessionSummary({required this.session});

  final LessonSession session;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 14, offset: const Offset(0, 6))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage('https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg'),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(session.language, style: Theme.of(context).textTheme.titleMedium),
                  Text('${session.durationMinutes} min', style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
              const Spacer(),
              InfoTag(label: session.isTrial ? 'Trial' : 'Paid'),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.calendar_today, size: 18),
              const SizedBox(width: 6),
              Text('${session.date.toLocal().toString().split(' ').first} • ${session.time}'),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.attach_money, size: 18),
              const SizedBox(width: 6),
              Text('${session.price.toStringAsFixed(0)} per lesson'),
            ],
          ),
        ],
      ),
    );
  }
}

class _StepTile extends StatelessWidget {
  const _StepTile({required this.step});

  final SessionStep step;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 6),
      leading: CircleAvatar(
        radius: 18,
        backgroundColor: step.isDone ? Colors.green.shade50 : Colors.grey.shade200,
        child: Icon(step.isDone ? Icons.check : Icons.timelapse, color: step.isDone ? Colors.green : Colors.grey),
      ),
      title: Text(step.label),
      subtitle: Text(step.description),
      trailing: step.isDone
          ? const Icon(Icons.verified, color: Colors.green)
          : OutlinedButton(onPressed: () {}, child: const Text('Mark next')),
    );
  }
}

class _NoteCard extends StatelessWidget {
  const _NoteCard({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(title, style: Theme.of(context).textTheme.titleMedium),
              const Spacer(),
              const Icon(Icons.edit_note, size: 18)
            ],
          ),
          const SizedBox(height: 6),
          Text(body, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
