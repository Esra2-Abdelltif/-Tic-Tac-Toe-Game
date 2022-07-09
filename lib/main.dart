import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Theme/theme.dart';
import 'package:tic_tac_toe/splash_screen/spalsh_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: darkthemes,
      debugShowCheckedModeBanner: false,
      home: SplashSCreen(),
    );
  }
}
