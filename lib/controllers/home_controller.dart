import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:my_sample_app/models/data_model.dart';
import 'package:my_sample_app/models/data_model.dart' as model;

class HomeController extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();

  FormModel? _form;

  List<Field> _allFields = [];
  List<Field> _visibleFields = [];

  bool _isLoadingMore = false;
  int _currentLimit = 10;

  FormModel? get form => _form;
  List<Field> get visibleFields => _visibleFields;
  bool get isLoadingMore => _isLoadingMore;
  //Date
  Map<String, String> _selectedDates = {};

  String? getDate(String fieldId) {
    return _selectedDates[fieldId];
  }

  void setDate(String fieldId, String date) {
    _selectedDates[fieldId] = date;
    notifyListeners();
  }

  // Time
  Map<String, String> _selectedTimes = {};

  String? getTime(String fieldId) {
    return _selectedTimes[fieldId];
  }

  void setTime(String fieldId, String time) {
    _selectedTimes[fieldId] = time;
    notifyListeners();
  }

  HomeController() {
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (!_isLoadingMore &&
        scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 50) {
      loadMore();
    }
  }

  Future<void> getLocation(model.Field field) async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      await Geolocator.openAppSettings();
      return;
    }

    Position position = await Geolocator.getCurrentPosition();

    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    Placemark place = placemarks.first;

    field.fieldValue = "${place.street}, ${place.locality}, ${place.country}";

    notifyListeners();
  }

  Future<void> loadFormFromAssets() async {
    try {
      final jsonString = await rootBundle.loadString(
        'assets/jsonFiles/data.json',
      );

      final formData = welcomeFromJson(jsonString);

      setForm(formData);
    } catch (e) {
      print("Error loading form: $e");
    }
  }

  void setForm(FormModel formData) {
    _form = formData;

    _allFields = formData.fields;

    _currentLimit = 10;
    _visibleFields = _allFields.take(_currentLimit).toList();

    notifyListeners();
  }

  Future<void> loadMore() async {
    if (_isLoadingMore) return;
    if (_visibleFields.length >= _allFields.length) return;

    _isLoadingMore = true;
    notifyListeners();
    _currentLimit += 10;

    if (_currentLimit > _allFields.length) {
      _currentLimit = _allFields.length;
    }

    _visibleFields = _allFields.take(_currentLimit).toList();

    _isLoadingMore = false;
    notifyListeners();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
