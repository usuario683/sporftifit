import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  String? _name;
  String? _email;

  bool get isLoggedIn => _isLoggedIn;
  String? get name => _name;
  String? get email => _email;
  bool get loading => false;

  Future<void> login(String name, String email) async {
    _isLoggedIn = true;
    _name = name;
    _email = email;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    _name = null;
    _email = null;
    notifyListeners();
  }
}
