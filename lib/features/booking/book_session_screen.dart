import 'package:flutter/material.dart';
import '../../core/controllers/booking_controller.dart';
import '../../core/widgets/buttons.dart';

class BookSessionScreen extends StatefulWidget {
  const BookSessionScreen({super.key, required this.controller, required this.onConfirm, this.onOpenSettings});
  final BookingController controller;
  final VoidCallback onConfirm;
  final VoidCallback? onOpenSettings;

  @override
  State<BookSessionScreen> createState() => _BookSessionScreenState();
}

class _BookSessionScreenState extends State<BookSessionScreen> {
  @override
  Widget build(BuildContext context) {
    final days = List.generate(7, (i) => DateTime.now().add(Duration(days: i)));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book session'),
        actions: [if (widget.onOpenSettings != null) IconButton(onPressed: widget.onOpenSettings, icon: const Icon(Icons.settings_outlined))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Choose language'),
            const SizedBox(height: 10),
            ToggleButtons(
              borderRadius: BorderRadius.circular(14),
              isSelected: ['Turkish', 'English'].map((l) => widget.controller.selectedLanguage == l).toList(),
              onPressed: (index) => setState(() => widget.controller.selectLanguage(index == 0 ? 'Turkish' : 'English')),
              children: const [Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text('Turkish')), Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text('English'))],
            ),
            const SizedBox(height: 16),
            const Text('Duration'),
            const SizedBox(height: 10),
            ToggleButtons(
              borderRadius: BorderRadius.circular(14),
              isSelected: [25, 30, 60].map((d) => widget.controller.duration == d).toList(),
              onPressed: (index) => setState(() => widget.controller.selectDuration([25, 30, 60][index])),
              children: const [Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text('25 min')), Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text('30 min')), Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text('60 min'))],
            ),
            const SizedBox(height: 16),
            const Text('Date'),
            const SizedBox(height: 10),
            SizedBox(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: days.length,
                itemBuilder: (_, index) {
                  final day = days[index];
                  final selected = widget.controller.date?.day == day.day;
                  return GestureDetector(
                    onTap: () => setState(() => widget.controller.selectDate(day)),
                    child: Container(
                      width: 64,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: selected ? Colors.black : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('${day.day}', style: TextStyle(color: selected ? Colors.white : Colors.black, fontWeight: FontWeight.bold)),
                            Text(['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'][day.weekday % 7],
                                style: TextStyle(color: selected ? Colors.white70 : Colors.grey)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            const Text('Time'),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: widget.controller.times
                  .map(
                    (time) => ChoiceChip(
                      label: Text(time),
                      selected: widget.controller.time == time,
                      onSelected: (_) => setState(() => widget.controller.selectTime(time)),
                    ),
                  )
                  .toList(),
            ),
            const Spacer(),
            PrimaryButton(
              label: 'Confirm Booking',
              onPressed: widget.controller.ready ? widget.onConfirm : null,
            )
          ],
        ),
      ),
    );
  }
}
