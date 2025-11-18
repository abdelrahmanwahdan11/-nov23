import 'package:flutter/material.dart';
import '../../core/utils/mock_data.dart';
import '../../core/utils/models.dart';
import '../../core/widgets/section_title.dart';

class CapstoneReviewScreen extends StatelessWidget {
  const CapstoneReviewScreen({super.key, required this.onOpenSettings});
  final VoidCallback onOpenSettings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Capstone reviews'),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
        actions: [IconButton(onPressed: onOpenSettings, icon: const Icon(Icons.settings_outlined))],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SectionTitle(text: 'Mentor feedback in progress'),
          ...capstoneReviews.map((review) => _CapstoneCard(review: review)),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add_chart_outlined),
            label: const Text('Schedule new submission'),
          ),
        ],
      ),
    );
  }
}

class _CapstoneCard extends StatelessWidget {
  const _CapstoneCard({required this.review});
  final CapstoneReview review;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme.primary;
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.withOpacity(0.08)),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
            child: Image.network(review.heroImage, height: 150, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(review.status, style: TextStyle(color: color, fontWeight: FontWeight.w700)),
                    ),
                    const Spacer(),
                    Text('Mentor ${review.mentor}', style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
                  ],
                ),
                const SizedBox(height: 10),
                Text(review.title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
                const SizedBox(height: 8),
                LinearProgressIndicator(value: review.progress, minHeight: 8, borderRadius: BorderRadius.circular(8)),
                const SizedBox(height: 6),
                Text('${(review.progress * 100).round()}% complete · Next: ${review.nextStep}'),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: review.milestones
                      .map((m) => Chip(label: Text(m), backgroundColor: theme.colorScheme.surfaceVariant.withOpacity(0.4)))
                      .toList(),
                ),
                const SizedBox(height: 12),
                Row(
                  children: const [
                    Icon(Icons.mic_none),
                    SizedBox(width: 8),
                    Text('Re-record clip'),
                    Spacer(),
                    Icon(Icons.comment_bank_outlined),
                    SizedBox(width: 6),
                    Text('Review notes'),
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
