import 'package:flutter/material.dart';
import '../../core/utils/mock_data.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key, required this.onOpenSettings});

  final VoidCallback onOpenSettings;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guided projects'),
        actions: [IconButton(onPressed: onOpenSettings, icon: const Icon(Icons.settings_outlined))],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: guidedProjects.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final project = guidedProjects[index];
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: isDark ? Colors.white12 : Colors.grey.shade200),
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(project.heroImage, width: 72, height: 72, fit: BoxFit.cover),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(project.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 4),
                    Text('${project.level} · ${project.estimatedMinutes} mins',
                        style: TextStyle(color: Theme.of(context).textTheme.bodySmall?.color)),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(value: project.progress, minHeight: 6,
                        backgroundColor: isDark ? Colors.white12 : Colors.grey.shade200),
                  ]),
                ),
                const SizedBox(width: 8),
                IconButton(onPressed: () {}, icon: const Icon(Icons.play_circle_fill_outlined)),
              ]),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 6,
                children:
                    project.tasks.map((task) => Chip(label: Text(task), backgroundColor: isDark ? Colors.white12 : Colors.grey.shade100)).toList(),
              ),
            ]),
          );
        },
      ),
    );
  }
}
