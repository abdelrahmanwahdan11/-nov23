import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../utils/models.dart';
import 'info_tag.dart';

class TutorCard extends StatelessWidget {
  const TutorCard({super.key, required this.tutor, this.onTap, this.trailing});
  final Tutor tutor;
  final VoidCallback? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tutor.id,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 5))],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(tutor.avatarUrl, width: 72, height: 72, fit: BoxFit.cover),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text(tutor.name, style: Theme.of(context).textTheme.titleMedium)),
                        if (trailing != null) trailing!,
                      ],
                    ),
                    const SizedBox(height: 6),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: [
                        if (tutor.isSuperTutor) const InfoTag(text: 'Super tutor'),
                        if (tutor.isTopRated) const InfoTag(text: 'Top tutor'),
                        if (tutor.isPopularChoice) const InfoTag(text: 'Popular choice'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(tutor.shortDescription, style: Theme.of(context).textTheme.bodySmall),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: AppColors.lightBackground,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Text('\$${tutor.pricePerLesson.toStringAsFixed(0)}/lesson'),
                        ),
                        const SizedBox(width: 10),
                        Icon(Icons.star, color: Colors.amber.shade600, size: 18),
                        Text('${tutor.rating} (${tutor.reviewsCount})'),
                        const Spacer(),
                        Text('${tutor.studentsCount} students', style: Theme.of(context).textTheme.bodySmall),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
