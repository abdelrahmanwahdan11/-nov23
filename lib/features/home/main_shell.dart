import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../../core/controllers/catalog_controller.dart';
import '../../core/controllers/home_controller.dart';
import '../../core/controllers/search_controller.dart';
import '../../core/utils/models.dart';
import '../booking/bookings_screen.dart';
import '../catalog/catalog_screen.dart';
import '../profile/profile_screen.dart';
import '../search/search_screen.dart';
import 'home_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key, required this.onTutorTap, required this.onLogout, required this.profileBuilder});
  final void Function(Tutor tutor) onTutorTap;
  final VoidCallback onLogout;
  final Widget Function(void Function(void Function()) setStateCallback) profileBuilder;

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int index = 0;
  late final CatalogController catalogController;
  late final HomeController homeController;
  late final SearchController searchController;

  @override
  void initState() {
    super.initState();
    catalogController = CatalogController();
    homeController = HomeController()..loadInitial();
    searchController = SearchController();
  }

  @override
  void dispose() {
    homeController.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(onTutorTap: widget.onTutorTap),
      CatalogScreen(
        controller: catalogController,
        onCompare: () {},
        onTutorTap: widget.onTutorTap,
      ),
      const BookingsScreen(),
      widget.profileBuilder(setState),
    ];

    return Scaffold(
      body: IndexedStack(index: index, children: screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(IconlyBold.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(IconlyBold.category), label: 'Catalog'),
          BottomNavigationBarItem(icon: Icon(IconlyBold.calendar), label: 'Bookings'),
          BottomNavigationBarItem(icon: Icon(IconlyBold.profile), label: 'Profile'),
        ],
      ),
      floatingActionButton: index == 0
          ? FloatingActionButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => SearchScreen(controller: searchController, onBack: () => Navigator.pop(context), onTutorTap: widget.onTutorTap),
              )),
              child: const Icon(IconlyLight.search),
            )
          : null,
    );
  }
}
