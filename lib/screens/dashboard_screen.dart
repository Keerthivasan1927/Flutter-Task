import 'package:flutter/material.dart';
import 'package:my_sample_app/controllers/dashboard_controller.dart';
import 'package:my_sample_app/screens/favorite_screen.dart';
import 'package:my_sample_app/screens/submenu_screen.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DashboardController>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Dashboard"),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.star, color: Colors.yellow),
            onPressed: () {
              print("Navigating to Favorites Screen");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FavoritesScreen()),
              );
            },
          ),
        ],
      ),
      body: provider.isLoading && provider.dashboard == null
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: provider.dashboard!.menus.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.9,
              ),
              itemBuilder: (context, index) {
                final menu = provider.dashboard!.menus[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            SubMenuScreen(menu: menu, fromDashboard: true),
                      ),
                    );
                  },
                  onLongPressStart: (details) async {
                    final overlay =
                        Overlay.of(context).context.findRenderObject()
                            as RenderBox;
                    final selected = await showMenu(
                      context: context,
                      position: RelativeRect.fromRect(
                        Rect.fromPoints(
                          details.globalPosition,
                          details.globalPosition,
                        ),
                        Offset.zero & overlay.size,
                      ),
                      items: [
                        PopupMenuItem(
                          value: "favorite",
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: menu.isFavorite
                                    ? Colors.yellow
                                    : Colors.grey,
                              ),
                              const SizedBox(width: 8),
                              Text(menu.isFavorite ? "Unstar" : "Favorite"),
                            ],
                          ),
                        ),
                      ],
                    );
                    if (selected == "favorite") {
                      provider.toggleFavorite(menu.id);
                    }
                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Text(
                              menu.name,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (menu.isFavorite)
                        const Positioned(
                          top: 6,
                          right: 6,
                          child: Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 20,
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
