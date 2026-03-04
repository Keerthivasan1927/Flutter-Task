import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_sample_app/models/dashboard_model.dart';

class DashboardController extends ChangeNotifier {
  DashboardModel? _dashboard;
  bool _isLoading = true;

  DashboardModel? get dashboard => _dashboard;
  bool get isLoading => _isLoading;

  DashboardController() {
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

  void swapMenus(int fromIndex, int toIndex) {
    if (_dashboard == null) return;

    final temp = _dashboard!.menus[fromIndex];
    _dashboard!.menus[fromIndex] = _dashboard!.menus[toIndex];
    _dashboard!.menus[toIndex] = temp;

    notifyListeners();
  }

  void reorderMenus(int fromIndex, int toIndex) {
    final item = dashboard!.menus.removeAt(fromIndex);
    dashboard!.menus.insert(toIndex, item);
    notifyListeners();
  }
}
