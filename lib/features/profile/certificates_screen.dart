import 'package:flutter/material.dart';
import '../../core/utils/mock_data.dart';

class CertificatesScreen extends StatelessWidget {
  const CertificatesScreen({super.key, required this.onOpenSettings});
  final VoidCallback onOpenSettings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Certificates'),
        actions: [IconButton(onPressed: onOpenSettings, icon: const Icon(Icons.settings_outlined))],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Showcase the badges you earned from tutors and practice labs.',
              style: TextStyle(color: Colors.black54)),
          const SizedBox(height: 16),
          ...certificates.map((cert) => Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.black,
                      child: Text(cert.badge.substring(0, 1), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(cert.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          Text(cert.level, style: const TextStyle(color: Colors.black54)),
                          const SizedBox(height: 4),
                          Text('Issuer: ${cert.issuer}', style: const TextStyle(color: Colors.black54)),
                          Text('Earned: ${_format(cert.earnedOn)}', style: const TextStyle(color: Colors.black54)),
                        ],
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.share_outlined))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

String _format(DateTime date) => '${date.day}/${date.month}/${date.year}';
