import 'package:amaliyot/utils/app_constant.dart';
import 'package:amaliyot/view/widgets/custom_drower.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<Color> onAppBarColorChanged;
  final ValueChanged<double> onTextFontSize;
  final ValueChanged<Color> onTextColor;

  const HomeScreen({
    super.key,
    required this.onThemeChanged,
    
    required this.onAppBarColorChanged,
    required this.onTextFontSize,
    required this.onTextColor,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: AppConstants.images.isEmpty
            ? null
            : DecorationImage(
                image: NetworkImage(AppConstants.images),
                fit: BoxFit.fill,
              ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstants.appBarColor,
          title: Text(
            "Bosh Sahifa",
            style: TextStyle(
              fontSize: AppConstants.fontSize,
              color: AppConstants.textColor,
            ),
          ),
        ),
        drawer: CustomDrawer(
          onThemeChanged: widget.onThemeChanged,
          onAppBarColorChanged: widget.onAppBarColorChanged,
          onTextFontSize: widget.onTextFontSize,
          onTextColor: widget.onTextColor,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: AppConstants.images.isEmpty
                ? null
                : DecorationImage(
                    image: NetworkImage(AppConstants.images),
                    fit: BoxFit.fill,
                  ),
          ),
        ),
      ),
    );
  }
}