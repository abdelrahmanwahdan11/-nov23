import 'package:flutter/material.dart';
import '../../core/controllers/favorites_controller.dart';
import '../../core/utils/mock_data.dart';
import '../../core/utils/models.dart';
import '../../core/widgets/tutor_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key, required this.favoritesController, required this.onTutorTap});

  final FavoritesController favoritesController;
  final void Function(Tutor tutor) onTutorTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: favoritesController,
      builder: (context, _) {
        final favorites = favoritesController.favoritesFrom(mockTutors);
        return Scaffold(
          appBar: AppBar(title: const Text('Favorite tutors')),
          body: favorites.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.heart_broken_outlined, size: 48),
                      SizedBox(height: 10),
                      Text('No favorites yet'),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: favorites.length,
                  itemBuilder: (_, index) {
                    final tutor = favorites[index];
                    final isFav = favoritesController.isFavorite(tutor.id);
                    return TutorCard(
                      tutor: tutor,
                      onTap: () => onTutorTap(tutor),
                      trailing: IconButton(
                        icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
                        onPressed: () => favoritesController.toggle(tutor.id),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
