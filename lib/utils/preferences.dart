import 'package:amaliyot/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static Future<void> setTheme(bool isDarkTheme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(AppConstants.themeModeKey, isDarkTheme);
  }

  static Future<bool> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(AppConstants.themeModeKey) ?? false;
  }

  static Future<void> setAppBarColor(Color color) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(AppConstants.appBarColorKey, color.value);
  }

  static Future<Color> getAppBarColor() async {
    final prefs = await SharedPreferences.getInstance();
    return Color(
        prefs.getInt(AppConstants.appBarColorKey) ?? Colors.amber.value);
  }

  static Future<void> setFontSize(double fontSize) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(AppConstants.fontSizeKey, fontSize);
  }

  static Future<double> getFontSize() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(AppConstants.fontSizeKey) ?? 16.0;
  }

  static Future<void> setTextColor(Color color) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(AppConstants.textColorKey, color.value);
  }

  static Future<Color> getTextColor() async {
    final prefs = await SharedPreferences.getInstance();
    return Color(prefs.getInt(AppConstants.textColorKey) ?? Colors.black.value);
  }

  static Future<void> setImages(String imageUrl) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.imagesKey, imageUrl);
  }

  static Future<String> getImages() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppConstants.imagesKey) ?? "";
  }
}
