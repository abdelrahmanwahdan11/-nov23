import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iconly/iconly.dart';
import '../../core/controllers/favorites_controller.dart';
import '../../core/controllers/home_controller.dart';
import '../../core/localization/app_localizations.dart';
import '../../core/utils/mock_data.dart';
import '../../core/utils/models.dart';
import '../../core/widgets/info_tag.dart';
import '../../core/widgets/filter_chip.dart';
import '../../core/widgets/section_title.dart';
import '../../core/widgets/skeleton_loader.dart';
import '../../core/widgets/tutor_card.dart';
import 'fluency_plan_screen.dart';
import 'phrasebook_screen.dart';
import 'mastery_readiness_screen.dart';
import 'portfolio_showcase_screen.dart';
import 'career_center_screen.dart';
import 'interview_prep_screen.dart';
import 'alumni_network_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {super.key,
      required this.onTutorTap,
      required this.onOpenSettings,
      required this.onOpenNotifications,
      required this.onOpenFavorites,
      required this.onOpenLearningPath,
      required this.favoritesController,
      required this.onOpenProgress,
      required this.onOpenPlanner,
      required this.onOpenWallet,
      required this.onOpenResources,
      required this.onOpenCommunity,
      required this.onOpenPractice,
      required this.onOpenLiveEvents,
      required this.onOpenPlacementTest,
      required this.onOpenCertificates,
      required this.onOpenCoachTips,
      required this.onOpenInsights,
      required this.onOpenStreaks,
      required this.onOpenRewards,
      required this.onOpenFeedback,
      required this.onOpenLeaderboard,
      required this.onOpenImmersion,
      required this.onOpenMentorChat,
      required this.onOpenProjects,
      required this.onOpenCapstoneReviews,
      required this.onOpenDownloadKits,
      required this.onOpenCareerCenter,
      required this.onOpenInterviewPrep,
      required this.onOpenAlumniNetwork,
      required this.onOpenSuccessStories,
      required this.onOpenScholarships,
      required this.onOpenInternships,
      required this.onOpenIndustryNews,
      required this.onOpenMobility,
      required this.onOpenBranding});
  final void Function(Tutor tutor) onTutorTap;
  final VoidCallback onOpenSettings;
  final VoidCallback onOpenNotifications;
  final VoidCallback onOpenFavorites;
  final VoidCallback onOpenLearningPath;
  final FavoritesController favoritesController;
  final VoidCallback onOpenProgress;
  final VoidCallback onOpenPlanner;
  final VoidCallback onOpenWallet;
  final VoidCallback onOpenResources;
  final VoidCallback onOpenCommunity;
  final VoidCallback onOpenPractice;
  final VoidCallback onOpenLiveEvents;
  final VoidCallback onOpenPlacementTest;
  final VoidCallback onOpenCertificates;
  final VoidCallback onOpenCoachTips;
  final VoidCallback onOpenInsights;
  final VoidCallback onOpenStreaks;
  final VoidCallback onOpenRewards;
  final VoidCallback onOpenFeedback;
  final VoidCallback onOpenLeaderboard;
  final VoidCallback onOpenImmersion;
  final VoidCallback onOpenMentorChat;
  final VoidCallback onOpenProjects;
  final VoidCallback onOpenCapstoneReviews;
  final VoidCallback onOpenDownloadKits;
  final VoidCallback onOpenCareerCenter;
  final VoidCallback onOpenInterviewPrep;
  final VoidCallback onOpenAlumniNetwork;
  final VoidCallback onOpenSuccessStories;
  final VoidCallback onOpenScholarships;
  final VoidCallback onOpenInternships;
  final VoidCallback onOpenIndustryNews;
  final VoidCallback onOpenMobility;
  final VoidCallback onOpenBranding;

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

  void _openFluencyPlan() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => FluencyPlanScreen(onOpenSettings: widget.onOpenSettings),
    ));
  }

  void _openMastery() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => MasteryReadinessScreen(onOpenSettings: widget.onOpenSettings),
    ));
  }

  void _openPortfolio() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => PortfolioShowcaseScreen(onOpenSettings: widget.onOpenSettings),
    ));
  }

  void _openPhrasebook() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => PhrasebookScreen(onOpenSettings: widget.onOpenSettings),
    ));
  }

  void _openSuccessStories() {
    widget.onOpenSuccessStories();
  }

  void _openScholarships() {
    widget.onOpenScholarships();
  }

  void _openCareerCenter() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => CareerCenterScreen(onOpenSettings: widget.onOpenSettings),
    ));
  }

  void _openInterviewPrep() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => InterviewPrepScreen(onOpenSettings: widget.onOpenSettings),
    ));
  }

  void _openAlumniNetwork() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => AlumniNetworkScreen(onOpenSettings: widget.onOpenSettings),
    ));
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
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).colorScheme.shadow.withOpacity(0.08),
                        blurRadius: 18,
                        offset: const Offset(0, 8))
                  ],
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
                  _QuickActionChip(icon: Icons.insights, label: 'Progress', onTap: widget.onOpenProgress),
                  _QuickActionChip(icon: Icons.local_fire_department_outlined, label: 'Streaks', onTap: widget.onOpenStreaks),
                  _QuickActionChip(icon: Icons.workspace_premium_outlined, label: 'Rewards', onTap: widget.onOpenRewards),
                  _QuickActionChip(icon: Icons.calendar_today, label: 'Planner', onTap: widget.onOpenPlanner),
                  _QuickActionChip(icon: Icons.wallet, label: 'Wallet', onTap: widget.onOpenWallet),
                  _QuickActionChip(icon: Icons.menu_book, label: 'Resources', onTap: widget.onOpenResources),
                  _QuickActionChip(icon: Icons.work_outline, label: 'Career center', onTap: _openCareerCenter),
                  _QuickActionChip(icon: Icons.mic_none_outlined, label: 'Interview prep', onTap: _openInterviewPrep),
                  _QuickActionChip(icon: Icons.groups_2_outlined, label: 'Alumni network', onTap: _openAlumniNetwork),
                  _QuickActionChip(icon: Icons.verified_user_outlined, label: 'Success stories', onTap: _openSuccessStories),
                  _QuickActionChip(icon: Icons.volunteer_activism_outlined, label: 'Scholarships', onTap: _openScholarships),
                  _QuickActionChip(icon: Icons.flight_takeoff_outlined, label: 'Mobility', onTap: widget.onOpenMobility),
                  _QuickActionChip(icon: Icons.campaign_outlined, label: 'Branding', onTap: widget.onOpenBranding),
                  _QuickActionChip(icon: Icons.forum_outlined, label: 'Community', onTap: widget.onOpenCommunity),
                  _QuickActionChip(icon: Icons.emoji_events_outlined, label: 'Leaderboard', onTap: widget.onOpenLeaderboard),
                  _QuickActionChip(icon: Icons.fitness_center_outlined, label: 'Practice lab', onTap: widget.onOpenPractice),
                  _QuickActionChip(icon: Icons.rule_folder_outlined, label: 'Placement test', onTap: widget.onOpenPlacementTest),
                  _QuickActionChip(icon: Icons.lightbulb, label: 'Coach tips', onTap: widget.onOpenCoachTips),
                  _QuickActionChip(icon: Icons.query_stats_outlined, label: 'Insights', onTap: widget.onOpenInsights),
                  _QuickActionChip(icon: Icons.rate_review_outlined, label: 'Feedback', onTap: widget.onOpenFeedback),
                  _QuickActionChip(icon: Icons.event_available_outlined, label: 'Live events', onTap: widget.onOpenLiveEvents),
                  _QuickActionChip(icon: Icons.business_center_outlined, label: 'Internships', onTap: widget.onOpenInternships),
                  _QuickActionChip(icon: Icons.newspaper_outlined, label: 'Industry news', onTap: widget.onOpenIndustryNews),
                  _QuickActionChip(icon: Icons.verified_outlined, label: 'Certificates', onTap: widget.onOpenCertificates),
                  _QuickActionChip(icon: Icons.public, label: 'Immersion', onTap: widget.onOpenImmersion),
                  _QuickActionChip(icon: Icons.rocket_launch_outlined, label: 'Fluency plan', onTap: _openFluencyPlan),
                  _QuickActionChip(icon: Icons.record_voice_over_outlined, label: 'Phrasebook', onTap: _openPhrasebook),
                  _QuickActionChip(icon: Icons.fact_check_outlined, label: 'Capstone review', onTap: widget.onOpenCapstoneReviews),
                  _QuickActionChip(icon: Icons.offline_pin_outlined, label: 'Offline kits', onTap: widget.onOpenDownloadKits),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('Capstone prep', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const Spacer(),
                      TextButton(onPressed: _openFluencyPlan, child: const Text('View plan')),
                    ],
                  ),
                  _FluencyPreview(onTap: _openFluencyPlan),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('Internships & fellowships', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const Spacer(),
                      TextButton(onPressed: widget.onOpenInternships, child: const Text('View all')),
                    ],
                  ),
                  SizedBox(
                    height: 170,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: internshipOpportunities.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        final internship = internshipOpportunities[index];
                        return Container(
                          width: 240,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: Colors.grey.withOpacity(0.12)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.work_outline, color: Theme.of(context).colorScheme.primary),
                                  const SizedBox(width: 8),
                                  Expanded(
                                      child: Text(internship.title,
                                          style: const TextStyle(fontWeight: FontWeight.bold),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis)),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Text('${internship.company} • ${internship.location}',
                                  maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodySmall),
                              const SizedBox(height: 6),
                              Text(internship.description, maxLines: 2, overflow: TextOverflow.ellipsis),
                              const Spacer(),
                              Wrap(
                                spacing: 8,
                                runSpacing: 6,
                                children: [
                                  _InfoPill(label: internship.stipend, icon: Icons.payments_outlined),
                                  _InfoPill(label: internship.deadline, icon: Icons.schedule_outlined),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('Global mobility', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const Spacer(),
                      TextButton(onPressed: widget.onOpenMobility, child: const Text('See guides')),
                    ],
                  ),
                  SizedBox(
                    height: 170,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: mobilityGuides.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        final guide = mobilityGuides[index];
                        return Container(
                          width: 240,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: Colors.grey.withOpacity(0.12)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(backgroundImage: NetworkImage(guide.imageUrl), radius: 20),
                                  const SizedBox(width: 8),
                                  Expanded(
                                      child: Text(guide.country,
                                          style: const TextStyle(fontWeight: FontWeight.bold),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis)),
                                  Chip(label: Text(guide.tag)),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Text('Timeline: ${guide.timeline}', style: Theme.of(context).textTheme.bodySmall),
                              const SizedBox(height: 6),
                              Wrap(
                                spacing: 6,
                                runSpacing: 6,
                                children: guide.checklist
                                    .take(3)
                                    .map((item) => Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                                          decoration: BoxDecoration(
                                            color: Theme.of(context).colorScheme.primary.withOpacity(0.08),
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: Text(item, maxLines: 1, overflow: TextOverflow.ellipsis),
                                        ))
                                    .toList(),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  const Icon(Icons.support_agent, size: 16),
                                  const SizedBox(width: 6),
                                  Expanded(
                                      child: Text(guide.advisor,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context).textTheme.bodySmall)),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('Personal branding', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const Spacer(),
                      TextButton(onPressed: widget.onOpenBranding, child: const Text('All kits')),
                    ],
                  ),
                  ...brandingAssets.take(2).map(
                        (asset) => Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: Colors.grey.withOpacity(0.12)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                      backgroundColor:
                                          Theme.of(context).colorScheme.primary.withOpacity(0.1),
                                      child: Icon(Icons.auto_awesome, color: Theme.of(context).colorScheme.primary)),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(asset.title,
                                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                        Text(asset.kind, style: Theme.of(context).textTheme.bodySmall),
                                      ],
                                    ),
                                  ),
                                  Chip(label: Text(asset.badge)),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(asset.description, maxLines: 2, overflow: TextOverflow.ellipsis),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(Icons.link, size: 16),
                                  const SizedBox(width: 6),
                                  Expanded(
                                      child: Text(asset.link,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(fontWeight: FontWeight.w600))),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('Industry news', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const Spacer(),
                      TextButton(onPressed: widget.onOpenIndustryNews, child: const Text('All updates')),
                    ],
                  ),
                  SizedBox(
                    height: 160,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: industryNews.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        final article = industryNews[index];
                        return Container(
                          width: 240,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: Colors.grey.withOpacity(0.12)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.newspaper_outlined, color: Theme.of(context).colorScheme.primary),
                                  const SizedBox(width: 8),
                                  Expanded(
                                      child: Text(article.title,
                                          style: const TextStyle(fontWeight: FontWeight.bold),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis)),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Text(article.summary, maxLines: 2, overflow: TextOverflow.ellipsis),
                              const Spacer(),
                              Row(
                                children: [
                                  Expanded(child: Text('${article.source} • ${article.publishedAt}', style: Theme.of(context).textTheme.bodySmall, maxLines: 1, overflow: TextOverflow.ellipsis)),
                                  Chip(label: Text(article.tag)),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.withOpacity(0.12)),
                ),
                child: Row(
                  children: [
                    CircleAvatar(radius: 28, backgroundImage: NetworkImage(alumniStories.first.avatarUrl)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Alumni spotlight', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(alumniStories.first.story, maxLines: 2, overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ),
                    OutlinedButton(onPressed: _openAlumniNetwork, child: const Text('View')),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('Success stories', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const Spacer(),
                      TextButton(onPressed: _openSuccessStories, child: const Text('See all')),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.withOpacity(0.12)),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(backgroundImage: NetworkImage(successStories.first.avatarUrl), radius: 28),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(successStories.first.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                              Text(successStories.first.quote, maxLines: 2, overflow: TextOverflow.ellipsis),
                              const SizedBox(height: 6),
                              Wrap(
                                spacing: 6,
                                children: successStories.first.skills
                                    .map((s) => Chip(label: Text(s), visualDensity: VisualDensity.compact))
                                    .toList(),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('Scholarships & grants', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const Spacer(),
                      TextButton(onPressed: _openScholarships, child: const Text('View all')),
                    ],
                  ),
                  SizedBox(
                    height: 160,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: scholarshipOpportunities.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        final opp = scholarshipOpportunities[index];
                        return Container(
                          width: 240,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: Colors.grey.withOpacity(0.12)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.volunteer_activism_outlined,
                                      color: Theme.of(context).colorScheme.primary),
                                  const SizedBox(width: 8),
                                  Expanded(
                                      child: Text(opp.title,
                                          style: const TextStyle(fontWeight: FontWeight.bold),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis)),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Text(opp.summary, maxLines: 2, overflow: TextOverflow.ellipsis),
                              const Spacer(),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: [
                                  _InfoPill(label: opp.amount, icon: Icons.payments_outlined),
                                  _InfoPill(label: opp.deadline, icon: Icons.schedule_outlined),
                                  _InfoPill(label: opp.tag, icon: Icons.bookmark_outline),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('Career runway', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const Spacer(),
                      TextButton(onPressed: _openCareerCenter, child: const Text('Open center')),
                    ],
                  ),
                  SizedBox(
                    height: 160,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: careerGuides.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) => _CareerPreview(guide: careerGuides[index], onTap: _openCareerCenter),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('Portfolio vault', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const Spacer(),
                      TextButton(onPressed: _openPortfolio, child: const Text('Open vault')),
                    ],
                  ),
                  SizedBox(
                    height: 170,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: portfolioItems.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) => _PortfolioPreview(item: portfolioItems[index], onTap: _openPortfolio),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('Final readiness', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const Spacer(),
                      TextButton(onPressed: _openMastery, child: const Text('Checklist')),
                    ],
                  ),
                  SizedBox(
                    height: 190,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: masteryChecklists.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) => _MasteryPreview(item: masteryChecklists[index], onTap: _openMastery),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('Phrasebook spotlight', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const Spacer(),
                      TextButton(onPressed: _openPhrasebook, child: const Text('See all')),
                    ],
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: phraseCategories.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) => _PhrasePreviewCard(
                        category: phraseCategories[index],
                        onTap: _openPhrasebook,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('Capstone reviews', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const Spacer(),
                      TextButton(onPressed: widget.onOpenCapstoneReviews, child: const Text('Open all')),
                    ],
                  ),
                  SizedBox(
                    height: 210,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: capstoneReviews.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) => _CapstonePreview(review: capstoneReviews[index], onTap: widget.onOpenCapstoneReviews),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('Offline kits', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const Spacer(),
                      TextButton(onPressed: widget.onOpenDownloadKits, child: const Text('Manage')),
                    ],
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: downloadableKits.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) => _KitPreview(kit: downloadableKits[index], onTap: widget.onOpenDownloadKits),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('Placement test', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const Spacer(),
                      TextButton(onPressed: widget.onOpenPlacementTest, child: const Text('View')),
                    ],
                  ),
                  _PlacementPreview(onTap: widget.onOpenPlacementTest),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('Live events', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const Spacer(),
                      TextButton(onPressed: widget.onOpenLiveEvents, child: const Text('See all')),
                    ],
                  ),
                  SizedBox(
                    height: 140,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: liveEvents.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) => _LiveEventChip(event: liveEvents[index], onTap: widget.onOpenLiveEvents),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('Community buzz', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const Spacer(),
                      TextButton(onPressed: widget.onOpenCommunity, child: const Text('View all')),
                    ],
                  ),
                  ...communityPosts.take(2).map((post) => _CommunityPreviewCard(post: post)).toList(),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  const Text('Mentor chat', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const Spacer(),
                  TextButton(onPressed: widget.onOpenMentorChat, child: const Text('Open')),
                ]),
                const SizedBox(height: 10),
                _MentorPreview(onOpen: widget.onOpenMentorChat),
              ]),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  const Text('Guided projects', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const Spacer(),
                  TextButton(onPressed: widget.onOpenProjects, child: const Text('See all')),
                ]),
                SizedBox(
                  height: 170,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: guidedProjects.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (context, index) => _ProjectCard(project: guidedProjects[index], onTap: widget.onOpenProjects),
                  ),
                ),
              ]),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('Leaderboard', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const Spacer(),
                      TextButton(onPressed: widget.onOpenLeaderboard, child: const Text('See ranks')),
                    ],
                  ),
                  ...leaderboardEntries.take(3).map((entry) => _LeaderboardPreview(entry: entry)).toList(),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('Immersion sprints', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const Spacer(),
                      TextButton(onPressed: widget.onOpenImmersion, child: const Text('Explore')),
                    ],
                  ),
                  SizedBox(
                    height: 160,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: immersionExperiences.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) => _ImmersionCard(exp: immersionExperiences[index]),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('Practice lab', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const Spacer(),
                      TextButton(onPressed: widget.onOpenPractice, child: const Text('Start')),
                    ],
                  ),
                  SizedBox(
                    height: 140,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: practiceDrills.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        final drill = practiceDrills[index];
                        return _DrillCard(drill: drill);
                      },
                    ),
                  )
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
      avatar: Icon(icon, size: 18, color: Theme.of(context).colorScheme.onSurface),
      label: Text(label, style: TextStyle(color: Theme.of(context).colorScheme.onSurface)),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      onPressed: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.6),
    );
  }
}

class _CommunityPreviewCard extends StatelessWidget {
  const _CommunityPreviewCard({required this.post});
  final CommunityPost post;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundImage: NetworkImage(post.avatarUrl)),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(post.author, style: const TextStyle(fontWeight: FontWeight.w600)),
                      Text(post.timeAgo, style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
                Icon(Icons.thumb_up_alt_outlined, color: Theme.of(context).colorScheme.primary, size: 18),
                const SizedBox(width: 6),
                Text('${post.likes}'),
              ],
            ),
            const SizedBox(height: 12),
            Text(post.title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(post.body, maxLines: 2, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 10),
            Wrap(
              spacing: 6,
              children: post.tags.map((tag) => InfoTag(text: tag)).toList(),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.chat_bubble_outline, size: 18),
                const SizedBox(width: 4),
                Text('${post.comments} comments'),
                const Spacer(),
                TextButton(onPressed: () {}, child: const Text('Open thread')),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _LeaderboardPreview extends StatelessWidget {
  const _LeaderboardPreview({required this.entry});
  final LeaderboardEntry entry;

  @override
  Widget build(BuildContext context) {
    final color = entry.rank == 1
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.secondary.withOpacity(0.4);
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          CircleAvatar(backgroundColor: color.withOpacity(0.12), child: Text('#${entry.rank}', style: TextStyle(color: color))),
          const SizedBox(width: 10),
          CircleAvatar(backgroundImage: NetworkImage(entry.avatarUrl)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(entry.name, style: const TextStyle(fontWeight: FontWeight.w700)),
                Text('${entry.points} pts · ${entry.lessons} lessons',
                    style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
          Text(entry.flag, style: const TextStyle(fontSize: 14))
        ],
      ),
    );
  }
}

class _ImmersionCard extends StatelessWidget {
  const _ImmersionCard({required this.exp});
  final ImmersionExperience exp;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 6),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
            child: Image.network(exp.imageUrl, height: 100, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(exp.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.w700)),
                    ),
                    InfoTag(label: exp.level),
                  ],
                ),
                const SizedBox(height: 6),
                Text(exp.description, maxLines: 2, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.place_outlined, size: 16, color: Theme.of(context).colorScheme.primary),
                    const SizedBox(width: 4),
                    Text(exp.city, style: Theme.of(context).textTheme.bodySmall),
                    const Spacer(),
                    Text(exp.dateLabel, style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _FluencyPreview extends StatelessWidget {
  const _FluencyPreview({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final stage = fluencyStages.first;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow.withOpacity(0.06),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(Icons.rocket_launch_outlined, color: Theme.of(context).colorScheme.primary),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(stage.title, style: const TextStyle(fontWeight: FontWeight.w700)),
                      const SizedBox(height: 4),
                      Text(stage.description, maxLines: 2, overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right),
              ],
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: LinearProgressIndicator(value: stage.progress, minHeight: 8),
            ),
            const SizedBox(height: 6),
            Text(stage.status, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}

class _PhrasePreviewCard extends StatelessWidget {
  const _PhrasePreviewCard({required this.category, required this.onTap});
  final PhraseCategory category;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 220,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Theme.of(context).dividerColor.withOpacity(0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.12),
                  child: Text(category.language.substring(0, 2).toUpperCase(),
                      style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(category.title, style: const TextStyle(fontWeight: FontWeight.w700)),
                      Text(category.contextLabel, style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ...category.phrases.take(2).map((phrase) => Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    children: [
                      Icon(Icons.check, size: 16, color: Theme.of(context).colorScheme.primary),
                      const SizedBox(width: 6),
                      Expanded(child: Text(phrase, maxLines: 1, overflow: TextOverflow.ellipsis)),
                    ],
                  ),
                )),
            const Spacer(),
            Text('Tap to open', style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}

class _CapstonePreview extends StatelessWidget {
  const _CapstonePreview({required this.review, required this.onTap});
  final CapstoneReview review;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 220,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 12, offset: const Offset(0, 8))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
              child: Image.network(review.heroImage, height: 110, width: double.infinity, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(review.status, style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                      ),
                      const Spacer(),
                      const Icon(Icons.fact_check_outlined, size: 18),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(review.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  LinearProgressIndicator(value: review.progress, minHeight: 6, borderRadius: BorderRadius.circular(6)),
                  const SizedBox(height: 6),
                  Text('Mentor ${review.mentor} · Next: ${review.nextStep}', maxLines: 2, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MasteryPreview extends StatelessWidget {
  const _MasteryPreview({required this.item, required this.onTap});
  final MasteryChecklist item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.withOpacity(0.12)),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 12, offset: const Offset(0, 8))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text('Coach ${item.coach}', style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 12)),
                ),
                const Spacer(),
                Icon(Icons.flag_outlined, color: Theme.of(context).colorScheme.primary, size: 18),
              ],
            ),
            const SizedBox(height: 10),
            Text(item.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
            const SizedBox(height: 6),
            Text(item.summary, maxLines: 2, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodySmall),
            const Spacer(),
            LinearProgressIndicator(value: item.progress, minHeight: 6, borderRadius: BorderRadius.circular(8)),
            const SizedBox(height: 6),
            Text('${(item.progress * 100).round()}% ready', style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}

class _PortfolioPreview extends StatelessWidget {
  const _PortfolioPreview({required this.item, required this.onTap});
  final PortfolioItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 210,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.withOpacity(0.12)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(item.coverImage, height: 90, width: double.infinity, fit: BoxFit.cover),
            ),
            const SizedBox(height: 8),
            Text(item.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800)),
            const SizedBox(height: 6),
            Text(item.highlight, maxLines: 2, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodySmall),
            const Spacer(),
            Row(
              children: [
                Text(item.status, style: Theme.of(context).textTheme.bodySmall),
                const Spacer(),
                Icon(Icons.arrow_forward_ios, size: 14, color: Theme.of(context).colorScheme.primary),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _CareerPreview extends StatelessWidget {
  const _CareerPreview({required this.guide, required this.onTap});
  final CareerGuide guide;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.withOpacity(0.12)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.08),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(guide.category, style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 12)),
            ),
            const SizedBox(height: 8),
            Text(guide.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800)),
            const SizedBox(height: 6),
            Text(guide.summary, maxLines: 3, overflow: TextOverflow.ellipsis),
            const Spacer(),
            Row(
              children: [
                Icon(Icons.schedule, size: 16, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 4),
                Text(guide.duration, style: Theme.of(context).textTheme.bodySmall),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios, size: 14),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _KitPreview extends StatelessWidget {
  const _KitPreview({required this.kit, required this.onTap});
  final DownloadableKit kit;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.withOpacity(0.1)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(kit.coverImage, height: 80, width: 70, fit: BoxFit.cover),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(kit.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800)),
                  const SizedBox(height: 6),
                  Text(kit.description, maxLines: 2, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(height: 6),
                  Text('${kit.sizeLabel} · ${kit.updatedAt}', style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlacementPreview extends StatelessWidget {
  const _PlacementPreview({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final done = placementSections.where((e) => e.completed).length;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(14)),
              child: const Icon(Icons.rule, color: Colors.white),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Placement ready',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text('Complete ${placementSections.length - done} steps to unlock tutor matches',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.75))),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: done / placementSections.length,
                    minHeight: 6,
                    backgroundColor: Colors.grey.shade200,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}

class _LiveEventChip extends StatelessWidget {
  const _LiveEventChip({required this.event, required this.onTap});
  final LiveEvent event;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 220,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).colorScheme.shadow.withOpacity(0.07),
                blurRadius: 12,
                offset: const Offset(0, 6))
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(event.coverUrl, height: 90, width: double.infinity, fit: BoxFit.cover),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                    child: Text(event.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold))),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: Colors.green.shade50, borderRadius: BorderRadius.circular(10)),
                  child: Text('${event.spotsLeft} left', style: const TextStyle(color: Colors.green, fontSize: 12)),
                )
              ],
            ),
            const SizedBox(height: 6),
            Text('Host: ${event.host}',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.75))),
            Text('${event.duration} • ${event.mode}',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.75))),
          ],
        ),
      ),
    );
  }
}

class _MentorPreview extends StatelessWidget {
  const _MentorPreview({required this.onOpen});
  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context) {
    final thread = mentorThreads.first;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isDark ? Colors.white12 : Colors.grey.shade200),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          CircleAvatar(backgroundImage: NetworkImage(thread.avatarUrl)),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(thread.title, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(thread.topic, style: Theme.of(context).textTheme.bodySmall),
          ])),
          IconButton(onPressed: onOpen, icon: const Icon(Icons.arrow_forward_ios, size: 16)),
        ]),
        const SizedBox(height: 8),
        Text(
          thread.messages.last.text,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 8),
        Row(children: [
          const Icon(Icons.lock_clock, size: 16),
          const SizedBox(width: 6),
          Text('Last reply ${thread.messages.last.timeLabel}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey)),
          const Spacer(),
          if (thread.unreadCount > 0)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary, borderRadius: BorderRadius.circular(12)),
              child: Text('${thread.unreadCount}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            )
        ])
      ]),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({required this.project, required this.onTap});
  final GuidedProject project;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 240,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: isDark ? Colors.white12 : Colors.grey.shade200),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(project.heroImage, height: 70, width: double.infinity, fit: BoxFit.cover),
          ),
          const SizedBox(height: 10),
          Text(project.title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text('${project.level} • ${project.estimatedMinutes} mins', style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: project.progress,
            minHeight: 6,
            backgroundColor: isDark ? Colors.white12 : Colors.grey.shade200,
          ),
          const SizedBox(height: 8),
          Text(project.tasks.take(2).join(' · '), maxLines: 1, overflow: TextOverflow.ellipsis),
        ]),
      ),
    );
  }
}

class _DrillCard extends StatelessWidget {
  const _DrillCard({required this.drill});
  final PracticeDrill drill;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).colorScheme.shadow.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 6))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(drill.focus, style: Theme.of(context).textTheme.bodySmall),
              const Spacer(),
              if (drill.isNew) const InfoTag(text: 'New'),
            ],
          ),
          const SizedBox(height: 8),
          Text(drill.title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(drill.description, maxLines: 2, overflow: TextOverflow.ellipsis),
          const Spacer(),
          Row(
            children: [
              const Icon(Icons.timer, size: 16),
              const SizedBox(width: 4),
              Text(drill.duration),
              const SizedBox(width: 10),
              const Icon(Icons.bolt, size: 16),
              const SizedBox(width: 4),
              Text(drill.energy),
            ],
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(36), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
            child: Text('Start • ${drill.difficulty}'),
          )
        ],
      ),
    );
  }
}

class _InfoPill extends StatelessWidget {
  const _InfoPill({required this.label, required this.icon});
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [Icon(icon, size: 16), const SizedBox(width: 6), Text(label)],
      ),
    );
  }
}
