import 'package:flutter/material.dart';
import '../../core/utils/mock_data.dart';
import '../../core/utils/models.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key, required this.onOpenSettings});

  final VoidCallback onOpenSettings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet & receipts'),
        actions: [IconButton(onPressed: onOpenSettings, icon: const Icon(Icons.settings_outlined))],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _balanceCard(),
          const SizedBox(height: 18),
          Text('Invoices', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          ...invoices.map((invoice) => _InvoiceTile(invoice: invoice)),
          const SizedBox(height: 18),
          Text('Guides', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          ListTile(
            leading: const Icon(Icons.receipt_long_outlined),
            title: const Text('How refunds work'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.credit_card),
            title: const Text('Add payment method'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _balanceCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 20, offset: const Offset(0, 10))],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: Colors.black,
            child: const Icon(Icons.wallet, color: Colors.white),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Current balance', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: 6),
              Text('\$72 in credits', style: TextStyle(fontSize: 14)),
            ],
          ),
          const Spacer(),
          FilledButton(onPressed: () {}, child: const Text('Top up')),
        ],
      ),
    );
  }
}

class _InvoiceTile extends StatelessWidget {
  const _InvoiceTile({required this.invoice});
  final Invoice invoice;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: const Icon(Icons.picture_as_pdf_outlined),
        title: Text(invoice.label),
        subtitle: Text('${invoice.date.toLocal().toString().split(' ').first} • ${invoice.status}'),
        trailing: Text('\$${invoice.amount.toStringAsFixed(0)}'),
        onTap: () {},
      ),
    );
  }
}
