import 'package:flutter/material.dart';

class AvailableCars extends StatefulWidget {
  @override
  _AvailableCarsState createState() => _AvailableCarsState();
}

class _AvailableCarsState extends State<AvailableCars> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Container(
          // width: double.infinity,
          // padding: EdgeInsets.all(16),
          // child: Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     GestureDetector(
          //       onTap: (){
          //         Navigator.pop(context)
          //       },
          //     )
          //   ],
          // ),
        ),
      ),
    );
  }
}