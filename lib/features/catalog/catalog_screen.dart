import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../../core/controllers/catalog_controller.dart';
import '../../core/controllers/favorites_controller.dart';
import '../../core/utils/models.dart';
import '../../core/widgets/filter_chip.dart';
import '../../core/widgets/tutor_card.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key, required this.controller, required this.onCompare, required this.onTutorTap, required this.favoritesController, required this.onOpenSettings});
  final CatalogController controller;
  final VoidCallback onCompare;
  final void Function(Tutor tutor) onTutorTap;
  final FavoritesController favoritesController;
  final VoidCallback onOpenSettings;

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  bool grid = false;

  @override
  Widget build(BuildContext context) {
    final tutors = widget.controller.tutors;
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: const InputDecoration(prefixIcon: Icon(IconlyLight.search), hintText: 'Search tutors'),
          onChanged: (value) => setState(() {}),
        ),
        actions: [
          IconButton(onPressed: widget.onOpenSettings, icon: const Icon(Icons.settings_outlined)),
          IconButton(icon: Icon(grid ? Icons.view_list : Icons.grid_view), onPressed: () => setState(() => grid = !grid)),
        ],
      ),
      floatingActionButton: widget.controller.selectedForComparison.length >= 2
          ? FloatingActionButton.extended(
              onPressed: widget.onCompare,
              label: Text('Compare (${widget.controller.selectedForComparison.length})'),
              icon: const Icon(Icons.compare),
            )
          : null,
      body: Column(
        children: [
          SizedBox(
            height: 42,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: const [
                FilterChipWidget(label: 'Price'),
                FilterChipWidget(label: 'Country'),
                FilterChipWidget(label: 'Rating'),
                FilterChipWidget(label: 'Availability'),
              ],
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {},
              child: grid
                  ? GridView.builder(
                      padding: const EdgeInsets.all(12),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemCount: tutors.length,
                      itemBuilder: (_, index) => _buildSelectableCard(tutors[index]),
                    )
                  : ListView.builder(
                      itemCount: tutors.length,
                      itemBuilder: (_, index) => _buildSelectableCard(tutors[index]),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectableCard(Tutor tutor) {
    final selected = widget.controller.selectedForComparison.contains(tutor);
    return AnimatedBuilder(
      animation: widget.favoritesController,
      builder: (context, _) {
        final isFav = widget.favoritesController.isFavorite(tutor.id);
        return TutorCard(
          tutor: tutor,
          onTap: () => widget.onTutorTap(tutor),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  icon: Icon(isFav ? IconlyBold.heart : IconlyLight.heart),
                  onPressed: () => widget.favoritesController.toggle(tutor.id)),
              Checkbox(value: selected, onChanged: (_) => setState(() => widget.controller.toggleSelection(tutor))),
            ],
          ),
        );
      },
    );
  }
}
