import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../../core/utils/mock_data.dart';
import '../../core/utils/models.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  Color _badgeColor(String type) {
    switch (type) {
      case 'reminder':
        return Colors.orange.shade200;
      case 'insight':
        return Colors.green.shade200;
      default:
        return Colors.blue.shade200;
    }
  }

  IconData _badgeIcon(String type) {
    switch (type) {
      case 'reminder':
        return IconlyLight.time_circle;
      case 'insight':
        return IconlyLight.discovery;
      default:
        return IconlyLight.notification;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Updates & alerts'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: mockNotifications.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final AppNotification notification = mockNotifications[index];
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 12, offset: const Offset(0, 4))],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: _badgeColor(notification.type),
                  child: Icon(_badgeIcon(notification.type), color: Colors.black87),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(notification.title, style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 6),
                      Text(notification.body, style: Theme.of(context).textTheme.bodySmall),
                      const SizedBox(height: 8),
                      Text(
                        '${notification.timestamp.hour.toString().padLeft(2, '0')}:${notification.timestamp.minute.toString().padLeft(2, '0')} · ${notification.timestamp.month}/${notification.timestamp.day}',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
