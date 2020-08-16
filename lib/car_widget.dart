import 'package:flutter/material.dart';
import 'data.dart';
import 'constants.dart';

Widget builCar(Car car, int index){
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15.0)
    ),
    padding: EdgeInsets.all(15.0),
    margin: EdgeInsets.symmetric(horizontal: index != null ? 16 : 0),
    width: 220,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(15.0)
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                car.condition,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ),

        SizedBox( height: 10.0,),

        Container(
          height: 120.0,
          child: Center(
            child: Image.asset(
              car.images[0],
              fit: BoxFit.fitWidth
            ),
          ),
        ),

        SizedBox( height: 10.0,),

        Text(
          car.model,
          style: TextStyle( fontSize: 18),
        ),

        SizedBox( height: 10.0,),

        Text(
          car.brand,
          style: TextStyle( 
            fontSize: 22,
            fontWeight: FontWeight.bold,
            height: 1
          ),
        ),

        Text(
          'per ' + (car.condition == 'Daily' ? 'day' : car.condition == 'Weekly' ? 'week' : 'month'),
          style: TextStyle( 
            fontSize: 13,
            color: Colors.grey
          ),
        )
      ],
    ),
  );
}