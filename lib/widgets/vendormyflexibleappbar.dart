import 'package:animated_text/animated_text.dart';
import 'package:bookshop/entities/bookmodel.dart';
import 'package:bookshop/pages/bookDetails.dart';
import 'package:bookshop/pages/notificationHistory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';

String user = "User";

class VendorMyFlexiableAppBar extends StatelessWidget {
  final double appBarHeight = 66.0;

  const VendorMyFlexiableAppBar();

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return new Container(
      padding: new EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + appBarHeight,
      child: new Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            color: Colors.green,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 80, 16),
                    child: Text(
                      'Dashboard',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: MediaQuery.of(context).size.height * 0.040),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: IconButton(
                      icon: Icon(
                        //FontAwesomeIcons.calendarAlt,
                        Icons.circle_notifications,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.height * 0.044,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => NotificationHistory()),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            flex: 2,
            child: Container(
              height: MediaQuery.of(context).size.height,
              //color: Colors.black,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Stack(
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.elliptical(600, 150),
                        bottomRight: Radius.elliptical(600, 150),
                      ),
                    ),
                  ),
                  Transform.translate(
                      offset: Offset(30, 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Card(
                            elevation: 14.0,
                            margin: const EdgeInsets.fromLTRB(0, 8, 0, 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.end,children: <Widget>[
                                    Text(
                                      "Shop Name",
                                      style: TextStyle(fontSize: 24),
                                    ),
                                    Text(
                                      "Owner Name",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    ),
                                    
                                  ]),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                          "03312132131",
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 15),
                                        ),
                                    ],
                                  )
                                ],
                              ),
                            )),
                      ))
                ],
              ),
            ),
          ),
        ],
      )),
      decoration: new BoxDecoration(
        color: Colors.white,
      ),
    );
  }
}
