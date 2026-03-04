import 'package:flutter/material.dart';
import 'package:my_sample_app/controllers/dashboard_controller.dart';
import 'package:my_sample_app/models/dashboard_model.dart';
import 'package:my_sample_app/screens/pageUrls/DescPageCoopWork_pageurl.dart';
import 'package:my_sample_app/screens/pageUrls/adhocform_pageurl.dart';
import 'package:my_sample_app/screens/pageUrls/appforum_pageurl.dart';
import 'package:my_sample_app/screens/pageUrls/desc_pageurl.dart';
import 'package:my_sample_app/screens/pageUrls/section_pageurl.dart';
import 'package:my_sample_app/screens/pageUrls/submenu_pageurl.dart';
import 'package:my_sample_app/screens/pageUrls/workshop_pageurl.dart';
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
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final page = getPage(menu.pageUrl!);

        if (page != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => page),
          );
        }
      });

      return const Scaffold(body: Center(child: CircularProgressIndicator()));
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

  Widget? getPage(String pageUrl) {
    switch (pageUrl) {
      case "DescPage":
        return const DescScreen();

      case "AdhocForm":
        return const AdhocFormScreen();

      case "Workshop":
        return const WorkshopPageurl();

      case "Section":
        return const SectionPageurl();

      case "SubMenuPage":
        return const SubmenuPageurl();

      case "DescPageCoopWorkPermit":
        return const DescpagecoopworkPageurl();

      case "AppForum":
        return const AppforumPageurl();

      default:
        return Center(
          child: Text(
            pageUrl,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        );
    }
  }
}
