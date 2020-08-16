import 'package:flutter/material.dart';

import 'package:flutter_ui_cart_rent/data.dart';
import 'package:flutter_ui_cart_rent/constants.dart';

class BookCar extends StatefulWidget {

  final Car car;

  const BookCar({Key key, @required this.car}) : super(key: key);

  @override
  _BookCarState createState() => _BookCarState();
}

class _BookCarState extends State<BookCar> {

  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
    );
  }
  
  
}