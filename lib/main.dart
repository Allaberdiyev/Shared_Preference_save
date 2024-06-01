import 'package:flutter/material.dart';
import 'package:amaliyot/utils/app_constant.dart';
import 'package:amaliyot/utils/preferences.dart';
import 'package:amaliyot/view/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _initializePreferences();
  }

  Future<void> _initializePreferences() async {
    WidgetsFlutterBinding.ensureInitialized();
    AppConstants.themeMode =
        await Preferences.getTheme() ? ThemeMode.dark : ThemeMode.light;
    AppConstants.appBarColor = await Preferences.getAppBarColor();
    AppConstants.fontSize = await Preferences.getFontSize();
    AppConstants.textColor = await Preferences.getTextColor();
    setState(() {});
  }

  void toggleThemeMode(bool value) async {
    await Preferences.setTheme(value);
    AppConstants.themeMode = value ? ThemeMode.dark : ThemeMode.light;
    setState(() {});
  }

  void appBarColor(Color appBarStyle) async {
    await Preferences.setAppBarColor(appBarStyle);
    AppConstants.appBarColor = appBarStyle;
    setState(() {});
  }

  void fontSize(double textFontSize) async {
    await Preferences.setFontSize(textFontSize);
    AppConstants.fontSize = textFontSize;
    setState(() {});
  }

  void textColor(Color textFontColor) async {
    await Preferences.setTextColor(textFontColor);
    AppConstants.textColor = textFontColor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(
        onThemeChanged: toggleThemeMode,
        onAppBarColorChanged: appBarColor,
        onTextFontSize: fontSize,
        onTextColor: textColor,
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: AppConstants.appBarColor,
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            fontSize: AppConstants.fontSize,
            color: AppConstants.textColor,
          ),
        ),
      ),
      darkTheme: ThemeData.dark(),
      themeMode: AppConstants.themeMode,
    );
  }
}
