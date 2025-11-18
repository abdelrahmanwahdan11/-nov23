import 'package:flutter/material.dart';
import '../../core/utils/mock_data.dart';
import '../../core/utils/models.dart';

class PhrasebookScreen extends StatefulWidget {
  const PhrasebookScreen({super.key, required this.onOpenSettings});

  final VoidCallback onOpenSettings;

  @override
  State<PhrasebookScreen> createState() => _PhrasebookScreenState();
}

class _PhrasebookScreenState extends State<PhrasebookScreen> {
  String filter = 'All';

  @override
  Widget build(BuildContext context) {
    final filtered = filter == 'All'
        ? phraseCategories
        : phraseCategories.where((c) => c.language == filter).toList();
    final languages = ['All', ...{for (final c in phraseCategories) c.language}];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phrasebook'),
        actions: [IconButton(onPressed: widget.onOpenSettings, icon: const Icon(Icons.settings_outlined))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: languages
                  .map((lang) => ChoiceChip(
                        label: Text(lang),
                        selected: filter == lang,
                        onSelected: (_) => setState(() => filter = lang),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (_, index) {
                  final item = filtered[index];
                  return _PhraseCard(category: item);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PhraseCard extends StatelessWidget {
  const _PhraseCard({required this.category});
  final PhraseCategory category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                child: Text(category.language.substring(0, 2).toUpperCase(),
                    style: TextStyle(color: Theme.of(context).colorScheme.primary)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(category.title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                    const SizedBox(height: 4),
                    Text(category.contextLabel, style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ),
              const Icon(Icons.translate),
            ],
          ),
          const SizedBox(height: 12),
          ...category.phrases.map((phrase) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle_outline, size: 18),
                    const SizedBox(width: 8),
                    Expanded(child: Text(phrase)),
                  ],
                ),
              )),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.volume_up_outlined),
              label: const Text('Practice aloud'),
            ),
          )
        ],
      ),
    );
  }
}
