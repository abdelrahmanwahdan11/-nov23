import 'package:flutter/material.dart';
import '../../core/utils/mock_data.dart';
import '../../core/utils/models.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key, required this.onOpenSettings});
  final VoidCallback onOpenSettings;

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final Map<String, String> selections = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weekly feedback'),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
        actions: [IconButton(onPressed: widget.onOpenSettings, icon: const Icon(Icons.settings_outlined))],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.withOpacity(0.12)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Help us tune your plan', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text('No emails, no spam. Your picks will only adjust recommendations and reward bonuses.', style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ...surveyQuestions.map((q) => _QuestionCard(question: q, selection: selections[q.id], onSelect: (value) {
                setState(() => selections[q.id] = value);
              })),
          const SizedBox(height: 12),
          FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.send_outlined), label: const Text('Submit feedback')),
          const SizedBox(height: 6),
          OutlinedButton.icon(
            onPressed: () => setState(() => selections.clear()),
            icon: const Icon(Icons.restart_alt),
            label: const Text('Reset answers'),
          )
        ],
      ),
    );
  }
}

class _QuestionCard extends StatelessWidget {
  const _QuestionCard({required this.question, required this.selection, required this.onSelect});
  final SurveyQuestion question;
  final String? selection;
  final ValueChanged<String> onSelect;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.withOpacity(0.12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(question.prompt, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: question.options
                .map((option) => ChoiceChip(
                      label: Text(option),
                      selected: selection == option,
                      selectedColor: primary.withOpacity(0.16),
                      labelStyle: TextStyle(color: selection == option ? primary : null),
                      onSelected: (_) => onSelect(option),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
