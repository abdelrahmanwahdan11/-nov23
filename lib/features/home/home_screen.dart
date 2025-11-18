import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iconly/iconly.dart';
import '../../core/controllers/favorites_controller.dart';
import '../../core/controllers/home_controller.dart';
import '../../core/localization/app_localizations.dart';
import '../../core/utils/mock_data.dart';
import '../../core/utils/models.dart';
import '../../core/widgets/filter_chip.dart';
import '../../core/widgets/section_title.dart';
import '../../core/widgets/skeleton_loader.dart';
import '../../core/widgets/tutor_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.onTutorTap, required this.onOpenSettings, required this.onOpenNotifications, required this.onOpenFavorites, required this.onOpenLearningPath, required this.favoritesController});
  final void Function(Tutor tutor) onTutorTap;
  final VoidCallback onOpenSettings;
  final VoidCallback onOpenNotifications;
  final VoidCallback onOpenFavorites;
  final VoidCallback onOpenLearningPath;
  final FavoritesController favoritesController;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeController controller;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    controller = HomeController()..loadInitial();
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (scrollController.position.pixels > scrollController.position.maxScrollExtent - 200) {
      controller.loadMore();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return RefreshIndicator(
      onRefresh: () async => controller.loadInitial(),
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            leading: IconButton(icon: const Icon(Icons.settings_outlined), onPressed: widget.onOpenSettings),
            title: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: 'Turkish',
                items: const [DropdownMenuItem(value: 'Turkish', child: Text('Turkish'))],
                onChanged: (_) {},
              ),
            ),
            actions: [
              IconButton(onPressed: widget.onOpenNotifications, icon: const Icon(IconlyLight.notification)),
              IconButton(onPressed: widget.onOpenFavorites, icon: const Icon(IconlyLight.heart)),
              const CircleAvatar(backgroundImage: NetworkImage('https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg'))
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 18, offset: const Offset(0, 8))],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(t.translate('home_title'), style: Theme.of(context).textTheme.headlineMedium),
                          const SizedBox(height: 8),
                          const Text('Get matched instantly with verified tutors.'),
                          const SizedBox(height: 14),
                          Row(
                            children: const [
                              Icon(Icons.play_circle_fill),
                              SizedBox(width: 8),
                              Text('Watch intro')
                            ],
                          )
                        ],
                      ),
                    ),
                    Transform(
                      transform: Matrix4.identity()..setEntry(3, 2, 0.001)..rotateY(-0.2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.network('https://images.pexels.com/photos/1181675/pexels-photo-1181675.jpeg', width: 120, height: 120, fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
              ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.05),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionTitle(text: 'Quick actions'),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      _QuickActionChip(icon: Icons.bolt, label: 'Learning path', onTap: widget.onOpenLearningPath),
                      _QuickActionChip(icon: Icons.favorite, label: 'Favorites', onTap: widget.onOpenFavorites),
                      _QuickActionChip(icon: Icons.notifications_active, label: 'Alerts', onTap: widget.onOpenNotifications),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 44,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: const [
                  FilterChipWidget(label: 'Price', selected: true),
                  FilterChipWidget(label: 'Country'),
                  FilterChipWidget(label: 'Native'),
                  FilterChipWidget(label: 'Super tutor'),
                  FilterChipWidget(label: 'Master'),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Text('${mockTutors.length} tutors', style: Theme.of(context).textTheme.bodyMedium),
                  const Spacer(),
                  const Icon(Icons.sort),
                  const SizedBox(width: 6),
                  const Text('Sort by relevance'),
                ],
              ),
            ),
          ),
          StreamBuilder<List<Tutor>>(
            stream: controller.stream,
            builder: (context, snapshot) {
              final data = snapshot.data;
              if (data == null) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate((_, __) => const Padding(
                        padding: EdgeInsets.all(16),
                        child: SkeletonLoader(height: 120),
                      ), childCount: 4),
                );
              }
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final tutor = data[index];
                    final isFav = widget.favoritesController.isFavorite(tutor.id);
                    return TutorCard(
                      tutor: tutor,
                      onTap: () => widget.onTutorTap(tutor),
                      trailing: IconButton(
                        icon: Icon(isFav ? IconlyBold.heart : IconlyLight.heart),
                        onPressed: () {
                          setState(() => widget.favoritesController.toggle(tutor.id));
                        },
                      ),
                    ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.05);
                  },
                  childCount: data.length,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class _QuickActionChip extends StatelessWidget {
  const _QuickActionChip({required this.icon, required this.label, required this.onTap});
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      avatar: Icon(icon, size: 18),
      label: Text(label),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      onPressed: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }
}
