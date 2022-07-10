import 'package:flutter/material.dart';
import 'package:tic_tac_toe/features/splash_screen/spalsh_screen.dart';
import 'package:tic_tac_toe/util/style/theme.dart';

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
      darkTheme: lightthemes,
      debugShowCheckedModeBanner: false,
      home: SplashSCreen(),
    );
  }
}
