import 'package:flutter/material.dart';
import '../../core/utils/mock_data.dart';

class IndustryNewsScreen extends StatelessWidget {
  const IndustryNewsScreen({super.key, required this.onOpenSettings});

  final VoidCallback onOpenSettings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Industry news'),
        actions: [IconButton(onPressed: onOpenSettings, icon: const Icon(Icons.settings_outlined))],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: industryNews.length,
        itemBuilder: (context, index) {
          final article = industryNews[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 14),
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(article.imageUrl, width: 64, height: 64, fit: BoxFit.cover),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(article.title,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          const SizedBox(height: 4),
                          Text('${article.source} • ${article.publishedAt}',
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                    ),
                    Chip(label: Text(article.tag)),
                  ],
                ),
                const SizedBox(height: 10),
                Text(article.summary),
                const SizedBox(height: 8),
                Row(
                  children: [
                    ElevatedButton(onPressed: () {}, child: const Text('Read more')),
                    const SizedBox(width: 10),
                    TextButton(onPressed: () {}, child: const Text('Save')),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
