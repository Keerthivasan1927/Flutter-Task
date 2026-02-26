import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_sample_app/models/dashboard_model.dart';

class DashboardController extends ChangeNotifier {
  DashboardModel? _dashboard;
  bool _isLoading = true;

  DashboardModel? get dashboard => _dashboard;
  bool get isLoading => _isLoading;

  DashboardController() {
    print("DashboardController CREATED: ${hashCode}");
    loadDashboard();
  }

  List<Menu> get favoriteMenus {
    if (_dashboard == null) return [];
    return _dashboard!.menus.where((m) => m.isFavorite).toList();
  }

  void toggleFavorite(String menuId) {
    if (_dashboard == null) {
      return;
    }

    final index = _dashboard!.menus.indexWhere((m) => m.id == menuId);
    if (index == -1) {
      return;
    }

    print("Before toggle: ${_dashboard!.menus[index].isFavorite}");

    _dashboard!.menus[index].isFavorite = !_dashboard!.menus[index].isFavorite;

    print("After toggle: ${_dashboard!.menus[index].isFavorite}");

    final favCount = _dashboard!.menus.where((m) => m.isFavorite).length;

    print("Favorite count AFTER toggle: $favCount");

    notifyListeners();
  }

  Future<void> loadDashboard() async {
    try {
      print('In try');
      final jsonString = await rootBundle.loadString(
        'assets/jsonFiles/dashboard.json',
      );

      _dashboard = dashboardFromJson(jsonString);
      print('Print the jsonString ${jsonString}');

      _isLoading = false;
      notifyListeners();
    } catch (e, stack) {
      print("ERROR: $e");
      print(stack);
      _isLoading = false;
      notifyListeners();
    }
  }
}
