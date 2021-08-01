import 'package:animated_text/animated_text.dart';
import 'package:bookshop/entities/bookmodel.dart';
import 'package:bookshop/pages/bookDetails.dart';
import 'package:bookshop/pages/notificationHistory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';

String user = "User";

class AdminFlexiableAppBar extends StatelessWidget {
  final double appBarHeight = 66.0;

  const AdminFlexiableAppBar();

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    // if (CurrentUser.thisUSer == null) {
    //   user = 'User';
    // } else {
    //   user = CurrentUser.thisUSer;
    // }
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
                // Container(
                //   child: Padding(
                //     padding: const EdgeInsets.all(16.0),
                //     child: Icon(
                //       FontAwesomeIcons.bars,
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
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
              // child: AnimatedText(
              //   repeatCount: 1,
              //   // speed: Duration(milliseconds: 1000),
              //   controller: AnimatedTextController.play,
              //   // displayTime: Duration(milliseconds: 1000),
              //   alignment: Alignment.centerLeft,
              //   //displayTime: Duration(milliseconds: 4000),
              //   wordList: [
              //     'Vehicle Doctor.',
              //     // 'Is ready to.',
              //     // 'Serve you.',
              //     'Hi, ' + user,
              //   ],
              //   // textStyle: GoogleFonts.poiretOne(
              //   //     color: Colors.black54,
              //   //     fontSize: MediaQuery.of(context).size.height * 0.05,
              //   //     fontWeight: FontWeight.w700),
              //   textStyle: TextStyle(
              //       color: Colors.black54,
              //       fontSize: MediaQuery.of(context).size.height * 0.05,
              //       fontWeight: FontWeight.w700),
              // ),
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
                    offset: Offset(110, -20),
                    child: AnimatedText(
                repeatCount: 1,
                // speed: Duration(milliseconds: 1000),
                controller: AnimatedTextController.play,
                // displayTime: Duration(milliseconds: 1000),
                alignment: Alignment.centerLeft,
                //displayTime: Duration(milliseconds: 4000),
                wordList: [
                    'Bookshop.',
                    // 'Is ready to.',
                    // 'Serve you.',
                    'Hi, Admin',
                ],
                // textStyle: GoogleFonts.poiretOne(
                //     color: Colors.black54,
                //     fontSize: MediaQuery.of(context).size.height * 0.05,
                //     fontWeight: FontWeight.w700),
                textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.05,
                      fontWeight: FontWeight.w700),
              ),
                  ),
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
