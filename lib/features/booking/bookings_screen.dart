import 'package:flutter/material.dart';
import '../../core/utils/mock_data.dart';
import '../../core/utils/models.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key, required this.onOpenSettings, required this.onOpenSession, required this.onOpenPlanner});

  final VoidCallback onOpenSettings;
  final void Function(LessonSession session) onOpenSession;
  final VoidCallback onOpenPlanner;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Bookings'),
          actions: [
            IconButton(onPressed: onOpenPlanner, icon: const Icon(Icons.calendar_month_outlined)),
            IconButton(onPressed: onOpenSettings, icon: const Icon(Icons.settings_outlined)),
          ],
          bottom: const TabBar(tabs: [Tab(text: 'Upcoming'), Tab(text: 'Past')]),
        ),
        body: TabBarView(
          children: [
            _buildList(mockSessions),
            _buildList(pastSessions, isPast: true),
          ],
        ),
      ),
    );
  }

  Widget _buildList(List<LessonSession> sessions, {bool isPast = false}) {
    if (sessions.isEmpty) return const Center(child: Text('No sessions'));
    return RefreshIndicator(
      onRefresh: () async {},
      child: ListView.builder(
        itemCount: sessions.length,
        itemBuilder: (_, index) {
          final session = sessions[index];
          return Card(
            margin: const EdgeInsets.all(12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: ListTile(
              leading: const CircleAvatar(backgroundImage: NetworkImage('https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg')),
              title: Text('${session.language} • ${session.durationMinutes} min'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${session.time} on ${session.date.toLocal().toString().split(' ').first}'),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Chip(label: Text(session.isTrial ? 'Trial' : 'Paid')),
                      const SizedBox(width: 6),
                      Chip(label: Text(isPast ? 'Completed' : 'Confirmed')),
                    ],
                  )
                ],
              ),
              trailing: isPast
                  ? TextButton(onPressed: () => onOpenSession(session), child: const Text('Details'))
                  : ElevatedButton(onPressed: () => onOpenSession(session), child: const Text('Join')),
            ),
          );
        },
      ),
    );
  }
}
