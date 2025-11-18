import 'package:flutter/material.dart';
import '../../core/utils/mock_data.dart';
import '../../core/utils/models.dart';
import '../../core/widgets/section_title.dart';

class ResourcesScreen extends StatefulWidget {
  const ResourcesScreen({super.key, required this.onOpenSettings});
  final VoidCallback onOpenSettings;

  @override
  State<ResourcesScreen> createState() => _ResourcesScreenState();
}

class _ResourcesScreenState extends State<ResourcesScreen> {
  final Set<String> downloaded = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resources'),
        actions: [IconButton(onPressed: widget.onOpenSettings, icon: const Icon(Icons.settings_outlined))],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SectionTitle(text: 'Self-study boosters'),
          const SizedBox(height: 8),
          ...mockResources.map((resource) => _ResourceCard(
                resource: resource,
                downloaded: downloaded.contains(resource.id),
                onToggle: () {
                  setState(() {
                    if (downloaded.contains(resource.id)) {
                      downloaded.remove(resource.id);
                    } else {
                      downloaded.add(resource.id);
                    }
                  });
                },
              )),
        ],
      ),
    );
  }
}

class _ResourceCard extends StatelessWidget {
  const _ResourceCard({required this.resource, required this.downloaded, required this.onToggle});
  final ResourceItem resource;
  final bool downloaded;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Chip(label: Text(resource.type)),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.timer, size: 16),
                      const SizedBox(width: 4),
                      Text(resource.duration),
                    ],
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: onToggle,
                  icon: Icon(downloaded ? Icons.check_circle : Icons.file_download_outlined),
                  color: downloaded ? Colors.green : null,
                )
              ],
            ),
            const SizedBox(height: 6),
            Text(resource.title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 6),
            Text(resource.description, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade700)),
            const SizedBox(height: 12),
            Row(
              children: [
                ElevatedButton(onPressed: onToggle, child: Text(downloaded ? 'Open' : 'Download')),
                const SizedBox(width: 10),
                TextButton(onPressed: () {}, child: const Text('Add to planner'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
