import 'package:amaliyot/utils/app_constant.dart';
import 'package:amaliyot/view/widgets/custom_drower.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class SettingsScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<Color> onAppBarColorChanged;
  final ValueChanged<double> onTextFontSize;
  final ValueChanged<Color> onTextColor;

  const SettingsScreen({
    Key? key,
    required this.onThemeChanged,
    required this.onAppBarColorChanged,
    required this.onTextFontSize,
    required this.onTextColor,
  }) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Color _currentColor = Colors.blue;
  final fontSizeController = TextEditingController();
  String errorMessageFontSize = "";

  @override
  void dispose() {
    fontSizeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

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
            "Sozlamalar",
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
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                Column(
                  children: [
                    SwitchListTile(
                      value: AppConstants.themeMode == ThemeMode.dark,
                      onChanged: widget.onThemeChanged,
                      title: Text(
                        "Tungi holat",
                        style: TextStyle(
                          fontSize: AppConstants.fontSize,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ZoomTapAnimation(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                'Choose color!',
                                style: TextStyle(
                                  fontSize: AppConstants.fontSize,
                                  color: AppConstants.textColor,
                                ),
                              ),
                              content: SingleChildScrollView(
                                child: ColorPicker(
                                  pickerColor: _currentColor,
                                  onColorChanged: (color) {
                                    setState(() {
                                      _currentColor = color;
                                    });
                                  },
                                  // ignore: deprecated_member_use
                                  showLabel: true,
                                  pickerAreaHeightPercent: 0.8,
                                ),
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: const Text('Ok'),
                                  onPressed: () {
                                    widget.onAppBarColorChanged(_currentColor);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "AppBar Color 🔆",
                            style: TextStyle(
                              fontSize: AppConstants.fontSize,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Enter FontSize",
                      style: TextStyle(
                        fontSize: AppConstants.fontSize,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 120, right: 120),
                      child: TextField(
                        controller: fontSizeController,
                        keyboardType: TextInputType.phone,
                        onSubmitted: (value) {
                          if (double.tryParse(value) != null) {
                            widget.onTextFontSize(double.tryParse(value)!);
                          }
                        },
                        decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 217, 217, 217),
                          filled: true,
                          errorStyle: const TextStyle(color: Colors.red),
                          label: const Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(""),
                            ],
                          ),
                          errorText: errorMessageFontSize.isEmpty
                              ? null
                              : errorMessageFontSize,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
