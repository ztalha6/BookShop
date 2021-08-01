import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
   Future getalluserNotification() async {
    return null;
  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Transform.translate(
                  offset: Offset(-8, 60),
                  child: Container(
                    child: RichText(
                      text: TextSpan(
                        text: 'Orders ',
                        style: TextStyle(
                            // shadows: [
                            //   Shadow(
                            //     blurRadius: 20.0,
                            //     color: Color(0xff2a4771),
                            //     offset: Offset(12.0, 12.0),
                            //   ),
                            // ],
                            fontWeight: FontWeight.w900,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.050,
                            color: Color(0xff1d395c)),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'History.',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.046,
                                color: Color(0xff187b20)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: FutureBuilder(
                  future: getalluserNotification(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return Scrollbar(
                        isAlwaysShown: true,
                        showTrackOnHover: true,
                        child: AnimationLimiter(
                          child: ListView.builder(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                            physics: BouncingScrollPhysics(),
                            itemCount: 10,
                            //itemCount: allnotihistory.length,
                            itemBuilder: (BuildContext context, int index) {
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 375),
                                child: SlideAnimation(
                                  verticalOffset: 50.0,
                                  child: FadeInAnimation(
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor: Color(0xff187b20),
                                        child: Text(
                                          // allcontributions[0]
                                          //     .responseObject[index]
                                          //     .contributionFundId
                                          //     .toString(),
                                          (index + 1).toString(),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      title: Text("Order number  ####."),
                                      subtitle: Text(
                                          'On User ID: 2345, On date: 22/3/2021'),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  
  }
}