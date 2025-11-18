import 'package:flutter/material.dart';
import '../../core/utils/mock_data.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Help & support')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            child: ListTile(
              leading: const Icon(Icons.forum_outlined),
              title: const Text('Ask the team'),
              subtitle: const Text('Leave us a message, we respond within a few hours.'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
          ),
          const SizedBox(height: 12),
          Text('Popular questions', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          ...faqs.map(
            (faq) => ExpansionTile(
              title: Text(faq.question),
              childrenPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              children: [Text(faq.answer, style: Theme.of(context).textTheme.bodySmall)],
            ),
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text('Privacy'),
            subtitle: const Text('We do not connect to external services yet.'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.article_outlined),
            title: const Text('Terms of use'),
            subtitle: const Text('Review how bookings and cancellations work.'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
