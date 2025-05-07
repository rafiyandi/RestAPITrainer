import 'package:flutter/material.dart';
import 'package:sanberapp66/config/navigation/navigation_service.dart';
import 'package:sanberapp66/pages/auth/getstarted/get_started_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDatasource {
  static Future<void> storeData(String value) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', value);
    } catch (e) {
      rethrow;
    }
  }

  static Future<String> getData() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      if (token != null) {
        return token;
      }
      throw Exception();
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> removeData() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.remove('token');
      String? token = prefs.getString('token');
      if (token == null) {
        Navigator.pushAndRemoveUntil(
            NavigationService.navigatorKey.currentContext!,
            MaterialPageRoute(
              builder: (context) => GetStartedPage(),
            ),
            (_) => false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
