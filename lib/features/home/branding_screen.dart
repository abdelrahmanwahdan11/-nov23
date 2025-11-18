import 'package:flutter/material.dart';
import '../../core/utils/mock_data.dart';

class BrandingScreen extends StatelessWidget {
  const BrandingScreen({super.key, required this.onOpenSettings});

  final VoidCallback onOpenSettings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal branding'),
        actions: [IconButton(onPressed: onOpenSettings, icon: const Icon(Icons.settings_outlined))],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: brandingAssets.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final asset = brandingAssets[index];
          return Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.withOpacity(0.12)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                        child: Icon(Icons.auto_awesome, color: Theme.of(context).colorScheme.primary)),
                    const SizedBox(width: 10),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(asset.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        Text(asset.kind, style: Theme.of(context).textTheme.bodySmall),
                      ],
                    )),
                    Chip(label: Text(asset.badge)),
                  ],
                ),
                const SizedBox(height: 10),
                Text(asset.description),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.link, size: 18),
                    const SizedBox(width: 6),
                    Expanded(child: Text(asset.link, style: const TextStyle(fontWeight: FontWeight.w600))),
                    TextButton(onPressed: () {}, child: const Text('Open')),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
