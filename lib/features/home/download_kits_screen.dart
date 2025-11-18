import 'package:flutter/material.dart';
import '../../core/utils/mock_data.dart';
import '../../core/utils/models.dart';
import '../../core/widgets/section_title.dart';

class DownloadKitsScreen extends StatelessWidget {
  const DownloadKitsScreen({super.key, required this.onOpenSettings});
  final VoidCallback onOpenSettings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Offline kits'),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
        actions: [IconButton(onPressed: onOpenSettings, icon: const Icon(Icons.settings_outlined))],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SectionTitle(text: 'Keep learning anywhere'),
          ...downloadableKits.map((kit) => _KitCard(kit: kit)),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.cloud_download_outlined),
            label: const Text('Check space & auto-sync'),
          )
        ],
      ),
    );
  }
}

class _KitCard extends StatelessWidget {
  const _KitCard({required this.kit});
  final DownloadableKit kit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.network(kit.coverImage, height: 80, width: 80, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(kit.title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
                    const Spacer(),
                    if (kit.isPinned)
                      Icon(Icons.push_pin_outlined, color: theme.colorScheme.primary),
                  ],
                ),
                const SizedBox(height: 6),
                Text(kit.description),
                const SizedBox(height: 6),
                Text('${kit.sizeLabel} · ${kit.updatedAt}', style: theme.textTheme.bodySmall),
                const SizedBox(height: 6),
                Row(
                  children: const [
                    Icon(Icons.check_circle, color: Colors.green),
                    SizedBox(width: 6),
                    Text('Ready to open'),
                    Spacer(),
                    Icon(Icons.file_download_done),
                    SizedBox(width: 4),
                    Text('Sync'),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
