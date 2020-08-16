import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
 
import 'package:flutter_ui_cart_rent/showroom.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData(
        textTheme: GoogleFonts.muliTextTheme()
      ),
      home: ShowRoom()
    );
  }
}