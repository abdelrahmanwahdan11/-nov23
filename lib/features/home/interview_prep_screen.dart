import 'package:flutter/material.dart';
import '../../core/utils/mock_data.dart';
import '../../core/utils/models.dart';
import '../../core/widgets/section_title.dart';

class InterviewPrepScreen extends StatelessWidget {
  const InterviewPrepScreen({super.key, required this.onOpenSettings});
  final VoidCallback onOpenSettings;

  @override
  Widget build(BuildContext context) {
    final cardColor = Theme.of(context).cardColor;
    final primary = Theme.of(context).colorScheme.primary;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interview prep'),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
        actions: [IconButton(onPressed: onOpenSettings, icon: const Icon(Icons.settings_outlined))],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.grey.withOpacity(0.12)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: primary.withOpacity(0.12), borderRadius: BorderRadius.circular(16)),
                  child: Icon(Icons.mic_none, color: primary),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Warm up for bilingual interviews', style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      Text('Shadow, rehearse, and record answers tailored to Turkish clients.',
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                ),
                FilledButton(onPressed: () {}, child: const Text('Start drill')),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const SectionTitle(text: 'Questions to rehearse'),
          ...interviewQuestions.map((q) => _QuestionTile(question: q)),
          const SizedBox(height: 16),
          const SectionTitle(text: 'Session tips'),
          _TipRow(icon: Icons.language, text: 'Lead with Turkish examples, close in English if needed.'),
          _TipRow(icon: Icons.timer, text: 'Keep answers under 90 seconds and flag impact early.'),
          _TipRow(icon: Icons.hearing, text: 'Record and re-listen with a slower playback to spot fillers.'),
        ],
      ),
    );
  }
}

class _QuestionTile extends StatelessWidget {
  const _QuestionTile({required this.question});
  final InterviewQuestion question;

  @override
  Widget build(BuildContext context) {
    final cardColor = Theme.of(context).cardColor;
    final primary = Theme.of(context).colorScheme.primary;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.withOpacity(0.12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(question.question, style: const TextStyle(fontWeight: FontWeight.w700))),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(color: primary.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
                child: Text(question.level, style: TextStyle(color: primary, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(question.answer),
          const SizedBox(height: 10),
          Row(
            children: [
              OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.play_arrow), label: const Text('Shadow')),
              const SizedBox(width: 8),
              OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.mic), label: const Text('Record')), 
            ],
          )
        ],
      ),
    );
  }
}

class _TipRow extends StatelessWidget {
  const _TipRow({required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      trailing: const Icon(Icons.check_circle_outline),
    );
  }
}
