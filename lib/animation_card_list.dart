import 'package:flutter/material.dart';

class AnimationCardList extends StatefulWidget {
  @override
  _AnimationCardListState createState() => _AnimationCardListState();
}

class _AnimationCardListState extends State<AnimationCardList> {

  final cardHeight = 150.0;
  final scrollController = ScrollController();
  final cards = [1,2,3,4,5,6,7,8,9,10];

  @override
  void initState(){
    cards.addAll(List.from(cards));
    scrollController.addListener(_onListenScroll);

    super.initState();
  }

  @override
  void dispose(){
    scrollController.removeListener(_onListenScroll);

    super.dispose();
  }

  void _onListenScroll(){
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index){
                  final card = cards[index];
                  final itemPositionOffset = index * (cardHeight / 2);
                  final difference = scrollController.offset - itemPositionOffset;
                  final percent = 1 - ( difference / (cardHeight / 2) );
                  double scale = percent;
                  double opacity = percent;
                  if( opacity > 1.0 ) opacity = 1.0;
                  if( opacity < 0.0 ) opacity = 0.0;
                  if(percent > 1.0) scale = 1.0;


                  return Align(
                    heightFactor: 0.5,
                    child: Opacity(
                      opacity: opacity,
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..scale(scale, 1.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                            side: BorderSide(
                              color: Colors.white
                            )
                          ),
                          // margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 10.0),
                          color: Colors.red[300],
                          child: SizedBox(
                            height: cardHeight,
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.circular(45.0)
                            // ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('Ferrari', style: TextStyle(color: Colors.white, fontSize: 25.0),),
                                // Container(
                                //   decoration: BoxDecoration(
                                //     image: DecorationImage(
                                //       image:
                                //     )
                                //   ),
                                // )
                                Image(
                                  image: AssetImage("assets/images/ferrari_spider_488_0.png",),
                                  width: 130,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                childCount: cards.length
              ),
            )
          ],
        ),
      ),
    );
  }
}