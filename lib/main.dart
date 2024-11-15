import 'package:flutter/material.dart';
import 'package:margintopdesigns/utils/color_constant.dart';
import 'package:margintopdesigns/utils/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Margin Top Designs',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 20,
            color: ColorConstant.whiteColor,
          ),
          centerTitle: true,
          backgroundColor: ColorConstant.primaryColor,
          elevation: 0.0,
        ),
        radioTheme: RadioThemeData(
          fillColor: WidgetStateProperty.all(ColorConstant.primaryColor),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 16,
          ),
          bodyMedium: TextStyle(
            fontSize: 18,
          ),
        ),
        dividerTheme: const DividerThemeData(
          endIndent: 10,
          indent: 10,
          color: ColorConstant.primaryColor,
          thickness: 5,
        ),
      ),
      routes: routes,
initialRoute: "splashscreen",
      debugShowCheckedModeBanner: false,
      
    );
  }
}