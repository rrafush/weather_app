import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/presentation/theme/app_themes.dart';
import 'package:weather_app/presentation/weather_page/search_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.appTheme,
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          body: SearchPage(),
        ),
      ),
    );
  }
}
