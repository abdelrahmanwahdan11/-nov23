import 'package:flutter/material.dart';
import '../../core/utils/mock_data.dart';
import '../../core/widgets/buttons.dart';
import '../../core/widgets/goal_card.dart';
import '../../core/localization/app_localizations.dart';

class GoalSelectionScreen extends StatefulWidget {
  const GoalSelectionScreen({super.key, required this.onContinue});
  final VoidCallback onContinue;

  @override
  State<GoalSelectionScreen> createState() => _GoalSelectionScreenState();
}

class _GoalSelectionScreenState extends State<GoalSelectionScreen> {
  String? selectedId;
  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Your goal')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.network('https://images.pexels.com/photos/669610/pexels-photo-669610.jpeg', height: 180, fit: BoxFit.cover),
            const SizedBox(height: 12),
            Text('Tell us what you want to achieve', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 6),
            Text('Personalize your Turkish journey.', style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                children: mockGoals
                    .map((goal) => GoalCard(
                          goal: goal,
                          selected: selectedId == goal.id,
                          onTap: () => setState(() => selectedId = goal.id),
                        ))
                    .toList(),
              ),
            ),
            PrimaryButton(label: t.translate('btn_continue'), onPressed: widget.onContinue),
          ],
        ),
      ),
    );
  }
}
