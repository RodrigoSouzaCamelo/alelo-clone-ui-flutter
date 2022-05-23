import 'package:alelo_clone_ui_flutter/constants.dart';
import 'package:alelo_clone_ui_flutter/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alelo Clone UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Constants.darkGreen,
        scaffoldBackgroundColor: Constants.light,
        appBarTheme: const AppBarTheme(
          color: Constants.light,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
          ),
          elevation: 0,
        ),
        fontFamily: 'Museosans',
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            color: Constants.darkGreen,
            fontSize: 14,
          ),
          headline4: TextStyle(
            color: Constants.darkGreen,
            fontSize: 18,
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}
