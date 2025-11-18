import 'package:flutter/material.dart';
import '../../core/controllers/payments_controller.dart';
import '../../core/utils/models.dart';
import '../../core/widgets/buttons.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, required this.controller, required this.session, required this.onSuccess});
  final PaymentsController controller;
  final LessonSession session;
  final VoidCallback onSuccess;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pay for session')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: ListTile(
                leading: const CircleAvatar(backgroundImage: NetworkImage('https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg')),
                title: Text('${widget.session.language} • ${widget.session.durationMinutes} min'),
                subtitle: Text('${widget.session.time} on ${widget.session.date.toLocal().toString().split(' ').first}'),
                trailing: Text('\$${widget.session.price.toStringAsFixed(0)}'),
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children: const [
                Chip(label: Text('100% refundable')),
                Chip(label: Text('Free cancellation')),
              ],
            ),
            const SizedBox(height: 20),
            const Text('Pay with'),
            const SizedBox(height: 10),
            Expanded(
              child: Column(
                children: [
                  _payButton('Apple Pay'),
                  _payButton('Klarna'),
                ],
              ),
            ),
            PrimaryButton(
              label: widget.controller.processing ? 'Processing...' : 'Pay with Apple Pay',
              onPressed: widget.controller.processing
                  ? null
                  : () => widget.controller.pay(widget.onSuccess),
            ),
          ],
        ),
      ),
    );
  }

  Widget _payButton(String label) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          const Icon(Icons.credit_card),
          const SizedBox(width: 10),
          Text(label),
          const Spacer(),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}
