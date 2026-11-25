import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/models/experience.dart';

class ExperienceDetailScreen extends StatelessWidget {
  const ExperienceDetailScreen({required this.experience, super.key});

  final Experience experience;

  // Mengubah DateTime menjadi teks, contoh: 25/11/2026.
  String _formatDate(DateTime date) {
    final local = date.toLocal();
    return '${local.day}/${local.month}/${local.year}';
  }

  @override
  Widget build(BuildContext context) {
    const labelStyle = TextStyle(fontWeight: FontWeight.bold);
    final startedAt = experience.startedAt;
    final endedAt = experience.endedAt;

    return Scaffold(
      appBar: AppBar(title: Text(experience.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail hanya ditampilkan jika URL-nya tidak kosong.
            if (experience.thumbnail.isNotEmpty) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  experience.thumbnail,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Text('Gagal memuat thumbnail.'),
                ),
              ),
              const SizedBox(height: 16),
            ],
            Text(
              experience.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            const Text('Category', style: labelStyle),
            Text(experienceCategoryLabel(experience.category)),
            const SizedBox(height: 12),
            const Text('Description', style: labelStyle),
            Text(experience.description),
            const SizedBox(height: 12),
            const Text('Period', style: labelStyle),
            Text(
              '${startedAt == null ? '-' : _formatDate(startedAt)}'
              ' - '
              '${endedAt == null ? 'Ongoing' : _formatDate(endedAt)}',
            ),
          ],
        ),
      ),
    );
  }
}
