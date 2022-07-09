import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkthemes = ThemeData(
  primarySwatch: Colors.blue,
  primaryColor: Colors.red,
  textTheme: TextTheme(
    bodyText1: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,color: Colors.white,),
    bodyText2:  TextStyle(fontSize: 16, color: Colors.white),
    headline1:TextStyle(fontSize: 30, color: Colors.black54, fontWeight: FontWeight.w600,),
    headline2: TextStyle(fontWeight: FontWeight.w300,color: Color(0xFF8D8E98)),
  ),


  scaffoldBackgroundColor: HexColor('333739'),
  appBarTheme: AppBarTheme(
    titleSpacing: 15,
    iconTheme: IconThemeData(color: Colors.white),
    backwardsCompatibility: false,
    backgroundColor:HexColor('333739'),
    elevation: 0,
    titleTextStyle: TextStyle(
      color:Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      //fontStyle: FontStyle.italic
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('333739'),
      statusBarIconBrightness:Brightness.light,


    ),
  ),







);

