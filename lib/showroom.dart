import 'package:flutter/material.dart';

import 'constants.dart';
import 'data.dart';
import 'package:flutter_ui_cart_rent/car_widget.dart';
import 'package:flutter_ui_cart_rent/dealer_widget.dart';
import 'package:flutter_ui_cart_rent/available_cars.dart';
import 'package:flutter_ui_cart_rent/book_car.dart';

class ShowRoom extends StatefulWidget {
  @override
  _ShowRoomState createState() => _ShowRoomState();
}

class _ShowRoomState extends State<ShowRoom> {

  List<Car> cars = getCarList();
  List<Dealer> dealers = getDealerList();
  List<NavigationItem> navigationItems = getNavigationItemList();
  NavigationItem selectedItem;

  @override
  void initState(){
    super.initState();
    setState(() {
      selectedItem = navigationItems[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        brightness: Brightness.light,
        title: Text(
          'Car Rental App',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Icon( Icons.menu, color: Colors.black, size: 30),
          )
        ],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(fontSize: 15.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none
                    )
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                  contentPadding: EdgeInsets.only(left: 30.0),
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 24, left: 16),
                    child: Icon( Icons.search, color: Colors.black, size: 25.0,),
                  )
                ),
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  )
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'TOP DEALS',
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[400]
                            ),
                          ),
                        
                          Row(
                            children: [
                              Text(
                                'view all',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor
                                ),
                              ),
                              SizedBox( width: 10.0,),
                              Icon( Icons.arrow_forward_ios, size: 12, color: kPrimaryColor,)
                            ],
                          )
                        ],
                      ),
                    ),

                    Container(
                      height: 280,
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: _buildDeals(),
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AvailableCars())
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 15, right: 15.0, left: 15.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          padding: EdgeInsets.all(24.0),
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Available Cars',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                    ),
                                  ),

                                  Text(
                                    'Long term and short term',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white
                                    ),
                                  )
                                ],
                              ),

                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.0)
                                ),
                                height: 50,
                                width: 50,
                                child: Center(
                                  child: Icon( Icons.arrow_forward_ios, color: kPrimaryColor,),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'TOP DEALERS',
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[400]
                            ),
                          ),
                        
                          Row(
                            children: [
                              Text(
                                'view all',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor
                                ),
                              ),
                              SizedBox( width: 10.0,),
                              Icon( Icons.arrow_forward_ios, size: 12, color: kPrimaryColor,)
                            ],
                          )
                        ],
                      ),
                    ),

                    Container(
                      height: 150,
                      margin: EdgeInsets.only(bottom: 15.0),
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: _buildDealers(),
                      ),
                    ),
                  ],
                ),
              )
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 70.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30)
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _buildNavigationItems(),
        ),
      ),
    );
  }

  List<Widget> _buildDeals(){
    List<Widget> list = [];
    for(var i= 0; i < cars.length; i++){
      list.add(GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BookCar(car: cars[i]))
          );
        },
        child: builCar(cars[i], i)
      ));
    }

    return list;
  }

  List<Widget> _buildDealers(){
    List<Widget> list = [];
    for(var i= 0; i < dealers.length; i++){
      list.add(buildDealer(dealers[i], i));
    }

    return list;
  }

  List<Widget> _buildNavigationItems(){
    List<Widget> list = [];
    for(var i= 0; i < navigationItems.length; i++){
      list.add(_buildNavigationItem(navigationItems[i]));
    }

    return list;
  }

  Widget _buildNavigationItem(NavigationItem item){
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedItem = item;
        });
      },
      child: Container(
        width: 50,
        child: Stack(
          children: [

            selectedItem == item
            ? Center(
              child: Container( 
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: kPrimaryColorShadow,
                  shape: BoxShape.circle
                ),
              ),
            )
            : Container(),

            Center(
              child: Icon(
                item.iconData, 
                color: selectedItem == item ? kPrimaryColor : Colors.grey[400],
                size: 24.0,
              ),
            )
          ],
        ),
      ),
    );
  }


}