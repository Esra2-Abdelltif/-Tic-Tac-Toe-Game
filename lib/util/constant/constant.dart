import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var myNewFont = GoogleFonts.pressStart2p( textStyle: TextStyle(color: Colors.white, letterSpacing: 3));
var myNewFontWhite = GoogleFonts.pressStart2p( textStyle: const TextStyle(color: Colors.deepPurple, letterSpacing: 3, fontSize: 13));

void NavigateTo({context,router})=>  Navigator.push(context,MaterialPageRoute(builder: (context) => router));
Future NavigateAndFinsh ({context,router})=> Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => router), (Route<dynamic> route) => false);