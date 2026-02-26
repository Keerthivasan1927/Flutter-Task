import 'package:flutter/material.dart';
import 'package:my_sample_app/controllers/dashboard_controller.dart';
import 'package:my_sample_app/models/dashboard_model.dart';
import 'package:provider/provider.dart';

class SubMenuScreen extends StatelessWidget {
  final bool fromDashboard;
  final Menu menu;

  const SubMenuScreen({
    super.key,
    required this.menu,
    this.fromDashboard = false,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DashboardController>();

    if (provider.dashboard == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final childMenus = provider.dashboard!.menus
        .where((m) => m.parentId == menu.id)
        .toList();

    if (childMenus.isNotEmpty) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(menu.name),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: ListView.builder(
          itemCount: childMenus.length,
          itemBuilder: (context, index) {
            final child = childMenus[index];

            return ListTile(
              title: Text(child.name),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SubMenuScreen(menu: child)),
                );
              },
            );
          },
        ),
      );
    }

    if (menu.pageUrl != null && menu.pageUrl!.isNotEmpty) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(menu.name),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Text(menu.pageUrl!, style: const TextStyle(fontSize: 20)),
        ),
      );
    }

    if (childMenus.isEmpty && fromDashboard) {
      print('Yes its printing');
      WidgetsBinding.instance.addPostFrameCallback((_) {
        print('Yes its in snacbar');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("No Sub Modules Available")),
        );
        Navigator.pop(context);
      });
    }

    return const Scaffold();
  }
}
