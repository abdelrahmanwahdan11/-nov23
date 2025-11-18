import 'package:flutter/material.dart';
import '../../core/utils/mock_data.dart';
import '../../core/utils/models.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Bookings'),
          bottom: const TabBar(tabs: [Tab(text: 'Upcoming'), Tab(text: 'Past')]),
        ),
        body: TabBarView(
          children: [
            _buildList(mockSessions),
            _buildList(const []),
          ],
        ),
      ),
    );
  }

  Widget _buildList(List<LessonSession> sessions) {
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
              subtitle: Text('${session.time} on ${session.date.toLocal().toString().split(' ').first}'),
              trailing: ElevatedButton(onPressed: () {}, child: const Text('Join')),
            ),
          );
        },
      ),
    );
  }
}
