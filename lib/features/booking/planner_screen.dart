import 'package:flutter/material.dart';
import '../../core/utils/mock_data.dart';
import '../../core/utils/models.dart';
import '../../core/widgets/skeleton_loader.dart';

class PlannerScreen extends StatefulWidget {
  const PlannerScreen({super.key, required this.onOpenSettings});

  final VoidCallback onOpenSettings;

  @override
  State<PlannerScreen> createState() => _PlannerScreenState();
}

class _PlannerScreenState extends State<PlannerScreen> {
  final ValueNotifier<int> selectedDay = ValueNotifier(0);
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Planner'),
        actions: [IconButton(onPressed: widget.onOpenSettings, icon: const Icon(Icons.settings_outlined))],
      ),
      body: Column(
        children: [
          _buildDaySelector(),
          const Divider(height: 1),
          Expanded(
            child: ValueListenableBuilder<int>(
              valueListenable: selectedDay,
              builder: (context, index, _) {
                final day = plannerDays[index];
                return RefreshIndicator(
                  onRefresh: () async {
                    setState(() => loading = true);
                    await Future.delayed(const Duration(milliseconds: 600));
                    setState(() => loading = false);
                  },
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      Row(
                        children: [
                          Text('${day.date.month}/${day.date.day}', style: Theme.of(context).textTheme.titleLarge),
                          const Spacer(),
                          Chip(label: Text(day.focus)),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text('Agenda', style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 8),
                      if (loading)
                        ...List.generate(2, (i) => const Padding(padding: EdgeInsets.symmetric(vertical: 8), child: SkeletonLoader(height: 100)))
                      else
                        ...day.sessions.map((session) => _SessionTile(session: session)),
                      const SizedBox(height: 18),
                      Text('Notes & reminders', style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 8),
                      if (loading)
                        const SkeletonLoader(height: 70)
                      else
                        ...sessionNotes.map(
                          (note) => ListTile(
                            leading: const Icon(Icons.bookmark_border),
                            title: Text(note.title),
                            subtitle: Text('${note.snippet}\n${note.date.toLocal().toString().split(' ').first}'),
                            isThreeLine: true,
                            trailing: IconButton(icon: const Icon(Icons.chevron_right), onPressed: () {}),
                          ),
                        ),
                      const SizedBox(height: 16),
                      FilledButton.icon(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
                            builder: (_) => _AddTaskSheet(onAdd: () => Navigator.pop(context)),
                          );
                        },
                        icon: const Icon(Icons.add_task),
                        label: const Text('Add practice task'),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDaySelector() {
    return SizedBox(
      height: 90,
      child: ValueListenableBuilder<int>(
        valueListenable: selectedDay,
        builder: (context, value, _) {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            scrollDirection: Axis.horizontal,
            itemCount: plannerDays.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (_, index) {
              final day = plannerDays[index];
              final isSelected = value == index;
              return GestureDetector(
                onTap: () => selectedDay.value = index,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(14),
                  width: 110,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black12),
                    boxShadow: [if (isSelected) BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 16, offset: const Offset(0, 8))],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${day.date.month}/${day.date.day}', style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      Text(day.focus, maxLines: 2, textAlign: TextAlign.center, style: TextStyle(color: isSelected ? Colors.white70 : Colors.black87, fontSize: 12)),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _SessionTile extends StatelessWidget {
  const _SessionTile({required this.session});
  final LessonSession session;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 8),
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
                const Chip(label: Text('Reschedulable')),
              ],
            )
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.schedule_send_outlined)),
            Text('\$${session.price.toStringAsFixed(0)}'),
          ],
        ),
      ),
    );
  }
}

class _AddTaskSheet extends StatelessWidget {
  const _AddTaskSheet({required this.onAdd});
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('New practice item', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Spacer(),
              IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close)),
            ],
          ),
          const SizedBox(height: 10),
          TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'e.g., Shadow 2 voice notes', filled: true, fillColor: Color(0xfff5f5f5), border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(14)))),
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () {
              if (controller.text.isNotEmpty) onAdd();
            },
            child: const Text('Save to planner'),
          )
        ],
      ),
    );
  }
}
