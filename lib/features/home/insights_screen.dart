import 'package:flutter/material.dart';
import '../../core/utils/mock_data.dart';
import '../../core/utils/models.dart';
import '../../core/widgets/section_title.dart';

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({super.key, required this.onOpenSettings});
  final VoidCallback onOpenSettings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learning insights'),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
        actions: [IconButton(onPressed: onOpenSettings, icon: const Icon(Icons.settings_outlined))],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SectionTitle(text: 'Momentum'),
          ...insightMetrics.map((metric) => _MetricTile(metric: metric)),
          const SizedBox(height: 12),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Recommendations', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                      const Spacer(),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.refresh)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text('Focus on 2 more listening drills to hit your target and log a journal reflection this week.'),
                  const SizedBox(height: 12),
                  FilledButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.bolt),
                    label: const Text('Launch practice lab'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MetricTile extends StatelessWidget {
  const _MetricTile({required this.metric});
  final InsightMetric metric;

  @override
  Widget build(BuildContext context) {
    final bool positive = metric.isPositive;
    final Color color = positive ? Colors.green : Colors.orange;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.15)),
      ),
      child: Row(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(metric.label, style: const TextStyle(fontWeight: FontWeight.w700)),
            const SizedBox(height: 6),
            Text(metric.value, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 22)),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(positive ? Icons.arrow_upward : Icons.arrow_downward, color: color, size: 18),
                const SizedBox(width: 4),
                Text(metric.delta, style: TextStyle(color: color, fontWeight: FontWeight.w600)),
              ],
            )
          ]),
          const Spacer(),
          Icon(Icons.show_chart, color: Theme.of(context).colorScheme.primary),
        ],
      ),
    );
  }
}
