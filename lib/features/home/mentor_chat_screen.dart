import 'package:flutter/material.dart';
import '../../core/utils/mock_data.dart';
import '../../core/utils/models.dart';

class MentorChatScreen extends StatelessWidget {
  const MentorChatScreen({super.key, required this.onOpenSettings});

  final VoidCallback onOpenSettings;

  @override
  Widget build(BuildContext context) {
    final surface = Theme.of(context).cardColor;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black87;
    final accent = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mentor chat'),
        actions: [IconButton(onPressed: onOpenSettings, icon: const Icon(Icons.settings_outlined))],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Threads', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 12),
          ...mentorThreads.map((thread) => _ThreadTile(thread: thread, textColor: textColor, accent: accent)),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: surface,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: isDark ? Colors.white12 : Colors.grey.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('Latest exchange', style: TextStyle(fontWeight: FontWeight.bold)),
                    const Spacer(),
                    TextButton(onPressed: () {}, child: const Text('View all')),
                  ],
                ),
                const SizedBox(height: 12),
                ..._buildMessagesPreview(mentorThreads.first.messages, textColor, isDark, accent),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildMessagesPreview(
      List<MentorMessage> messages, Color textColor, bool isDark, Color accent) {
    return messages
        .take(4)
        .map((m) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: m.isMentor ? accent.withOpacity(isDark ? 0.18 : 0.1) : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.withOpacity(0.2)),
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(
                  children: [
                    Text(m.author, style: TextStyle(fontWeight: FontWeight.w700, color: textColor)),
                    const Spacer(),
                    Text(m.timeLabel, style: TextStyle(color: textColor.withOpacity(0.7), fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 6),
                Text(m.text, style: TextStyle(color: textColor.withOpacity(0.9))),
              ]),
            ))
        .toList();
  }
}

class _ThreadTile extends StatelessWidget {
  const _ThreadTile({required this.thread, required this.textColor, required this.accent});

  final MentorThread thread;
  final Color textColor;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isDark ? Colors.white12 : Colors.grey.shade200),
      ),
      child: Row(
        children: [
          CircleAvatar(backgroundImage: NetworkImage(thread.avatarUrl)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(thread.title, style: TextStyle(fontWeight: FontWeight.w700, color: textColor)),
              const SizedBox(height: 4),
              Text(thread.topic, style: TextStyle(color: textColor.withOpacity(0.7))),
            ]),
          ),
          if (thread.unreadCount > 0)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(color: accent, borderRadius: BorderRadius.circular(12)),
              child: Text('${thread.unreadCount}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            )
          else
            const Icon(Icons.check_circle, color: Colors.green),
        ],
      ),
    );
  }
}
