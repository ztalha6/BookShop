import 'package:animated_text/animated_text.dart';
import 'package:bookshop/entities/bookmodel.dart';
import 'package:bookshop/pages/bookDetails.dart';
import 'package:bookshop/pages/notificationHistory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';

String user = "User";

class MyFlexiableAppBar extends StatelessWidget {
  final double appBarHeight = 66.0;

  const MyFlexiableAppBar();

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
                      'Top picks',
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
                // Container(
                //   child: Padding(
                //     padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
                //     child: Icon(
                //       FontAwesomeIcons.userCircle,
                //       color: Colors.black54,
                //       size: 30,
                //     ),
                //   ),
                // ),
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
                        bottomLeft: Radius.elliptical(300, 150),
                        bottomRight: Radius.elliptical(300, 150),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, -30),
                    child: Container(
                      // /color: Colors.black,
                      //margin: EdgeInsets.only(bottom: 100),
                      height: MediaQuery.of(context).size.height,
                      child: CarouselSlider.builder(
                        
                        initialPage: 2,
                        enableInfiniteScroll: false,
                        height: MediaQuery.of(context).size.height / 4,
                        viewportFraction: .40,
                        //enlargeCenterPage: true,
                        itemCount: book.length,
                        realPage: 0,
                        itemBuilder: (BuildContext context, int index) {
                          Book books = book[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => BookDetailsPage(bookObject: books,)),
                              );
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              //width: 150,
                              //color: Colors.blue,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 130,
                                    width: 100,
                                    child: Image.asset(
                                      books.imageUrl,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                    child: Text(
                                      books.title,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                      //textAlign: TextAlign.justify,
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.005,
                                  ),
                                  Text(books.author,
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.016))
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          // Container(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[
          //       Container(
          //         child: new Text("Balance",
          //             style: const TextStyle(
          //                 color: Colors.white,
          //                 fontFamily: 'Poppins',
          //                 fontSize: 28.0)),
          //       ),
          //       Container(
          //         child: new Text("\u002420,914.33",
          //             style: const TextStyle(
          //                 color: Colors.white,
          //                 fontFamily: 'Poppins',
          //                 fontWeight: FontWeight.w800,
          //                 fontSize: 36.0)),
          //       ),
          //     ],
          //   ),
          // ),
          // Container(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[
          //       Container(
          //         child: Padding(
          //           padding: const EdgeInsets.only(bottom: 16.0),
          //           child: new Text("\u002B24.93\u0025",
          //               style: const TextStyle(
          //                   color: Colors.white70,
          //                   fontFamily: 'Poppins',
          //                   fontSize: 20.0)),
          //         ),
          //       ),
          //       Container(
          //         child: Padding(
          //           padding: const EdgeInsets.only(bottom: 16.0),
          //           child: Icon(
          //             FontAwesomeIcons.longArrowAltUp,
          //             color: Colors.green,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          //   child: Container(
          //     //height: MediaQuery.of(context).size.height * 0.08,
          //     //color: Colors.black,
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: <Widget>[
          //         Container(
          //           child: Padding(
          //             padding: const EdgeInsets.only(bottom: 8.0, left: 20.0),
          //             child:
          //                 //initialLocation == null
          //                 // ? Text("Locating",
          //                 //     style: const TextStyle(
          //                 //         color: Colors.black87,
          //                 //         fontFamily: 'Poppins',
          //                 //         fontSize: 10.0))
          //                 // :
          //                 Text("Logged In",
          //                     style: const TextStyle(
          //                         color: Colors.black87,
          //                         fontFamily: 'Poppins',
          //                         fontSize: 10.0)),
          //           ),
          //         ),
          //         // Container(
          //         //   child: Padding(
          //         //     padding: const EdgeInsets.only(bottom: 8.0, right: 8.0),
          //         //     child: Container(
          //         //         child: Row(
          //         //       children: <Widget>[
          //         //         Container(
          //         //           child: Icon(
          //         //             //FontAwesomeIcons.calendarAlt,
          //         //             Icons.notification_important_rounded,
          //         //             color: Colors.black45,
          //         //           ),
          //         //         ),
          //         //         SizedBox(
          //         //           width: 10,
          //         //         ),
          //         //         // Container(
          //         //         //   child: Text(
          //         //         //     'Janaury 2019',
          //         //         //     style: const TextStyle(
          //         //         //         color: Colors.white70,
          //         //         //         fontFamily: 'Poppins',
          //         //         //         fontSize: 16.0),
          //         //         //   ),
          //         //         // ),
          //         //       ],
          //         //     )),
          //         //   ),
          //         // ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      )),
      decoration: new BoxDecoration(
        color: Colors.white,
      ),
    );
  }
}
