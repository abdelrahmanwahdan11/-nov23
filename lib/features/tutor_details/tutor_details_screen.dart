import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/controllers/booking_controller.dart';
import '../../core/controllers/tutor_details_controller.dart';
import '../../core/utils/models.dart';
import '../../core/widgets/buttons.dart';
import '../../core/widgets/info_tag.dart';

class TutorDetailsScreen extends StatefulWidget {
  const TutorDetailsScreen({super.key, required this.tutor, required this.onBook});
  final Tutor tutor;
  final VoidCallback onBook;

  @override
  State<TutorDetailsScreen> createState() => _TutorDetailsScreenState();
}

class _TutorDetailsScreenState extends State<TutorDetailsScreen> {
  late final TutorDetailsController controller;
  final BookingController booking = BookingController();

  @override
  void initState() {
    super.initState();
    controller = TutorDetailsController()..load(widget.tutor.id);
  }

  @override
  Widget build(BuildContext context) {
    final tutor = controller.current ?? widget.tutor;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(tutor.videoThumbnailUrl, fit: BoxFit.cover),
                  const Center(
                    child: Icon(Icons.play_circle_fill, size: 64, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                transitionBuilder: (child, animation) => RotationYTransition(turns: animation, child: child),
                child: controller.flipped
                    ? _buildBackSide(context, tutor)
                    : _buildFrontSide(context, tutor),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: PrimaryButton(label: 'Book trial lesson', onPressed: widget.onBook),
      ),
    );
  }

  Widget _buildFrontSide(BuildContext context, Tutor tutor) {
    return Column(
      key: const ValueKey('front'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Hero(
              tag: tutor.id,
              child: GestureDetector(
                onTap: () => setState(() => controller.toggleFlip()),
                child: CircleAvatar(radius: 36, backgroundImage: NetworkImage(tutor.avatarUrl)),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tutor.name, style: Theme.of(context).textTheme.headlineSmall),
                Text('${tutor.flagEmoji} ${tutor.country}'),
              ],
            ),
            const Spacer(),
            IconButton(
              icon: Icon(controller.favorite ? Icons.favorite : Icons.favorite_border),
              onPressed: () => setState(() => controller.toggleFavorite()),
            )
          ],
        ),
        const SizedBox(height: 12),
        Wrap(
          children: [
            if (tutor.isSuperTutor) const InfoTag(text: 'Super tutor'),
            if (tutor.isTopRated) const InfoTag(text: 'Top 10'),
            if (tutor.isPopularChoice) const InfoTag(text: 'Popular choice'),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Chip(label: Text('\$${tutor.pricePerLesson.toStringAsFixed(0)}/lesson')),
            const SizedBox(width: 8),
            const Icon(Icons.star, color: Colors.amber),
            Text('${tutor.rating} (${tutor.reviewsCount})'),
          ],
        ),
        const SizedBox(height: 12),
        Text(tutor.aboutMe),
        const SizedBox(height: 16),
        Container(
          height: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(image: NetworkImage(tutor.locationImageUrl), fit: BoxFit.cover),
          ),
        )
      ],
    );
  }

  Widget _buildBackSide(BuildContext context, Tutor tutor) {
    return Container(
      key: const ValueKey('back'),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Why students love this tutor', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('Great structure, engaging stories, and tailored corrections for every level.'),
          const SizedBox(height: 16),
          PrimaryButton(label: 'AI insight', onPressed: () => _showAiSheet(context)),
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: () => setState(() => controller.toggleFlip()),
            child: const Text('Back'),
          )
        ],
      ),
    );
  }

  void _showAiSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('AI insights', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            Text('Future AI will summarize availability, tone, and best learning path for you. For now this is a placeholder.'),
          ],
        ),
      ),
    );
  }
}

class RotationYTransition extends StatelessWidget {
  const RotationYTransition({super.key, required this.turns, required this.child});
  final Animation<double> turns;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: turns,
      builder: (context, child) {
        final angle = turns.value * 3.1415;
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(angle),
          child: child,
        );
      },
      child: child,
    );
  }
}
