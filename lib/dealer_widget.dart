import 'package:flutter/material.dart';

import 'data.dart';

Widget buildDealer(Dealer dealer, int index){
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15.0)
    ),
    padding: EdgeInsets.all(15.0),
    margin: EdgeInsets.only(right: 16, left: index == 0 ? 16 : 0),
    width: 150,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(dealer.image),
              fit: BoxFit.cover
            ),
            borderRadius: BorderRadius.circular(15.0)
          ),
          height: 60.0,
          width: 60.0,
        ),

        SizedBox(height: 16.0,),

        Text(
          dealer.name,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            height: 1
          ),
        ),

        Text(
          '${dealer.offers.toString()} offers' ,
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey
          ),
        )
      ],
    ),
  );
}