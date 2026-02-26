import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/dashboard_controller.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DashboardController>();
    print("Total menus before: ${provider.dashboard?.menus.length}");
    print("Favorites count before: ${provider.favoriteMenus.length}");

    print("===== FAVORITES SCREEN BUILD =====");
    print("Dashboard null? ${provider.dashboard == null}");

    if (provider.dashboard != null) {
      print("Total menus: ${provider.dashboard!.menus.length}");
      print("Favorite count from getter: ${provider.favoriteMenus.length}");

      for (var m in provider.favoriteMenus) {
        print("Favorite item: ${m.name}");
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Favorites"),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Builder(
        builder: (_) {
          if (provider.dashboard == null) {
            return const Center(child: CircularProgressIndicator());
          }

          final favorites = provider.favoriteMenus;

          if (favorites.isEmpty) {
            return const Center(
              child: Text("No Favorites Yet", style: TextStyle(fontSize: 16)),
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: favorites.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.9,
            ),
            itemBuilder: (context, index) {
              final menu = favorites[index];
              print("Total menus: ${provider.dashboard?.menus.length}");
              print("Favorites count: ${provider.favoriteMenus.length}");

              return Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade300, blurRadius: 4),
                  ],
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Text(menu.name, textAlign: TextAlign.center),
                      ),
                    ),
                    Positioned(
                      top: 6,
                      right: 6,
                      child: GestureDetector(
                        onTap: () {
                          provider.toggleFavorite(menu.id);
                        },
                        child: const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
