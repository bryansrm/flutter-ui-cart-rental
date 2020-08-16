import 'package:flutter/material.dart';

import 'package:flutter_ui_cart_rent/data.dart';
import 'package:flutter_ui_cart_rent/car_widget.dart';
import 'package:flutter_ui_cart_rent/constants.dart';
import 'package:flutter_ui_cart_rent/book_car.dart';

class AvailableCars extends StatefulWidget {
  @override
  _AvailableCarsState createState() => _AvailableCarsState();
}

class _AvailableCarsState extends State<AvailableCars> {

  List<Filter> filters = getFilterList();
  Filter selectedFilter;

  @override
  void initState(){
    super.initState();
    setState(() {
      selectedFilter = filters[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  width: 45.0,
                  height: 45.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: Colors.grey[100],
                      width: 1
                    )
                  ),
                  child: Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.black,
                    size: 28.0,
                  ),
                ),
              ),

              SizedBox( height: 16.0,),
              
              Text(
                'Available Cars ( ${getCarList().length.toString()})',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.bold
                ),
              ),

              SizedBox( height: 16.0,),

              Expanded(
                child: GridView.count(
                  physics: BouncingScrollPhysics(),
                  childAspectRatio: 1 / 1.55,
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: getCarList().map((item){
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BookCar(car: item))
                        );
                      },
                      child: builCar(item, null)
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: [
            _buildFilterIcon(),

            Row(
              children: _buildFilters(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFilterIcon(){
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(15.0)
      ),
      child: Center(
        child: Icon(
          Icons.filter_list,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }

  List<Widget> _buildFilters(){
    List<Widget> list = [];
    for(var i = 0; i < filters.length; i++){
      list.add(_buildFilter(filters[i]));
    }

    return list;
  }

  Widget _buildFilter(Filter filter){
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedFilter = filter;
        });
      },
      child: Padding(
        padding: EdgeInsets.only(right: 15.0),
        child: Text(
          filter.name,
          style: TextStyle(
            color: selectedFilter == filter ? kPrimaryColor : Colors.grey[300],
            fontSize: 16.0,
            fontWeight: selectedFilter == filter ? FontWeight.bold : FontWeight.normal
          ),
        ),
      ),
    );
  }
}