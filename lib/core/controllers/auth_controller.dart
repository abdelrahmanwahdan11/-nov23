import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends ChangeNotifier {
  bool isLoggedIn = false;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    isLoggedIn = prefs.getBool('loggedIn') ?? false;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    if (!email.contains('@') || password.length < 6) return false;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('loggedIn', true);
    isLoggedIn = true;
    notifyListeners();
    return true;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('loggedIn');
    isLoggedIn = false;
    notifyListeners();
  }
}
