import 'package:flutter/foundation.dart';
import '../models/cruise.dart';

class CruiseViewModel extends ChangeNotifier {

  // 1. Cruise Information
  final CruiseModel cruise = defaultCruise;

  // 2. Visit Date
  DateTime? _selectedDate;

  DateTime? get selectedDate => _selectedDate;

  // 3. Cruise Package
  final List<String> cruisePackages = [
    'Private River Cruise',
    'Sunset Cruise',
    'Sunrise Cruise',
    'Rural Cruise',
    'SMI Park Cruise',
  ];

  String _selectedPackage = 'Private River Cruise';

  String get selectedPackage => _selectedPackage;

  // 4. Dark Mode
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  // 5. Star Rating
  int _ratingCount = 43;

  int get ratingCount => _ratingCount;


  // Function 1: Select Visit Date
  void selectDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }


  // Function 2: Change Cruise Package
  void changePackage(String? package) {
    if (package == null) return;

    _selectedPackage = package;
    notifyListeners();
  }


  // Function 3: Toggle Dark Mode
  void toggleTheme(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }


  // Function 4: Increase Star Rating
  void increaseRating() {
    _ratingCount++;
    notifyListeners();
  }

}
