import 'package:amaliyot/utils/app_constant.dart';
import 'package:amaliyot/utils/preferences.dart';
import 'package:amaliyot/view/screens/home_screen.dart';
import 'package:amaliyot/view/screens/settings_page.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<Color> onAppBarColorChanged;
  final ValueChanged<double> onTextFontSize;
  final ValueChanged<Color> onTextColor;

  const CustomDrawer({
    super.key,
    required this.onThemeChanged,
    required this.onAppBarColorChanged,
    required this.onTextFontSize,
    required this.onTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppConstants.appBarColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "MENYU",
                  style: TextStyle(
                    fontSize: AppConstants.fontSize,
                    color: AppConstants.textColor,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () async {
              bool isDarkTheme = await Preferences.getTheme();
              Color appBarColor = await Preferences.getAppBarColor();
              double fontSize = await Preferences.getFontSize();
              Color textColor = await Preferences.getTextColor();

              onThemeChanged(isDarkTheme);
              onAppBarColorChanged(appBarColor);
              onTextFontSize(fontSize);
              onTextColor(textColor);

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return HomeScreen(
                      onThemeChanged: onThemeChanged,
                      onAppBarColorChanged: onAppBarColorChanged,
                      onTextFontSize: onTextFontSize,
                      onTextColor: onTextColor,
                    );
                  },
                ),
              );
            },
            title: Text(
              "Bosh sahifa",
              style: TextStyle(
                fontSize: AppConstants.fontSize,
                color: AppConstants.textColor,
              ),
            ),
            trailing: const Icon(
              Icons.keyboard_arrow_right,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return SettingsScreen(
                      onThemeChanged: onThemeChanged,
                      onAppBarColorChanged: onAppBarColorChanged,
                      onTextFontSize: onTextFontSize,
                      onTextColor: onTextColor,
                    );
                  },
                ),
              );
            },
            title: Text(
              "Sozlamalar",
              style: TextStyle(
                fontSize: AppConstants.fontSize,
                color: AppConstants.textColor,
              ),
            ),
            trailing: const Icon(
              Icons.keyboard_arrow_right,
            ),
          ),
        ],
      ),
    );
  }
}
