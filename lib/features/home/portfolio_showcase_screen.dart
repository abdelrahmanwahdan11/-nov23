import 'package:flutter/material.dart';
import '../../core/utils/mock_data.dart';
import '../../core/utils/models.dart';

class PortfolioShowcaseScreen extends StatelessWidget {
  const PortfolioShowcaseScreen({super.key, required this.onOpenSettings});

  final VoidCallback onOpenSettings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio showcase'),
        actions: [IconButton(onPressed: onOpenSettings, icon: const Icon(Icons.settings_outlined))],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.4),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Ship-ready assets', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
                SizedBox(height: 6),
                Text('Keep your best recordings, notes, and PDFs in one place so mentors can review quickly.'),
              ],
            ),
          ),
          const SizedBox(height: 12),
          ...portfolioItems.map((item) => _PortfolioCard(item: item)).toList(),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.ios_share_outlined),
            label: const Text('Export everything as .zip'),
            style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
          ),
        ],
      ),
    );
  }
}

class _PortfolioCard extends StatelessWidget {
  const _PortfolioCard({required this.item});
  final PortfolioItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.12)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 6))],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(item.coverImage, height: 90, width: 90, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(item.title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(item.status, style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text('${item.category} · ${item.updatedAt}', style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(height: 6),
                Text(item.highlight, maxLines: 2, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 8),
                Row(
                  children: [
                    TextButton.icon(onPressed: () {}, icon: const Icon(Icons.edit_outlined), label: const Text('Edit')),
                    const SizedBox(width: 8),
                    TextButton.icon(onPressed: () {}, icon: const Icon(Icons.visibility_outlined), label: const Text('Preview')),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
