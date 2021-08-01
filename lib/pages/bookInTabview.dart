import 'package:bookshop/entities/bookmodel.dart';
import 'package:bookshop/pages/bookDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class BooksTab extends StatefulWidget {
  @override
  BooksTabState createState() => BooksTabState();
}

class BooksTabState extends State<BooksTab> {

  TabController tb;
 
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   title: Text(
        //     'Catagories',
        //     style: TextStyle(color: Colors.black54),
        //   ),
        //   centerTitle: true,
        //   backgroundColor: Colors.white,
        //   elevation: 0,
        //   // give the app bar rounded corners
        //   // shape: RoundedRectangleBorder(
        //   //   borderRadius: BorderRadius.only(
        //   //     bottomLeft: Radius.circular(20.0),
        //   //     bottomRight: Radius.circular(20.0),
        //   //   ),
        //   // ),
        //   leading:IconButton(icon: Icon(Icons.arrow_back,color: Colors.black54,), onPressed: (){})
        // ),
       
        body: Column(
          children: <Widget>[
            Transform.translate(
              offset: Offset( -MediaQuery.of(context).size.height*0.010, MediaQuery.of(context).size.height* 0.085),
              child: Container(
                //color: Colors.black,
                height: MediaQuery.of(context).size.height/7,
                      child: RichText(
                        text: TextSpan(
                          text: 'Search ',
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
                              text: 'Catagories.',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.050,
                                  color: Color(0xff187b20)),
                            )
                          ],
                        ),
                      ),
                    ),
            ),
            // construct the profile details widget here
            // SizedBox(
            //   height: 0.5,
            //   // child: Center(
            //   //   child: Text(
            //   //     'Profile Details Goes here',
            //   //   ),
            //   // ),
            // ),

            // the tab bar with two items
            SizedBox(
              height: MediaQuery.of(context).size.height*0.150,
              child: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                bottom: TabBar(
                  indicatorColor: Colors.green,
                  unselectedLabelColor: Colors.green,
                  controller: tb,
                  tabs: [
                    Tab(
                      icon: Icon(Icons.book_rounded,color: Colors.black,),
                      //text: "New Books",
                      child: Text("New books",style: TextStyle(color: Colors.black),),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.library_books_rounded,color: Colors.black,
                      ),
                      //text: "Old Books",
                      child: Text("Old books",style: TextStyle(color: Colors.black),),
                    ),
                  ],
                ),
              ),
            ),

            // create widgets for each tab bar here
            Expanded(
              child: TabBarView(
                controller: tb,
                children: [
                  // first tab bar view widget
                  SingleChildScrollView(
                    child: Container(
                       //color: Colors.red,
                      child: AnimationLimiter(  child: Column(
                                  children:
                                      AnimationConfiguration.toStaggeredList(
                                duration: const Duration(milliseconds: 500),
                                childAnimationBuilder: (widget) => SlideAnimation(
                                  horizontalOffset: 50.0,
                                  child: FadeInAnimation(
                                    child: widget,
                                  ),
                                ),
                                children: [

                                  SizedBox(height: 20,),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 25),
                                      child: Text(
                                        'Bestsellers',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    //  color: Colors.red,
                                    height: 210,
                                    child: ListView.builder(
                                        padding: EdgeInsets.only(left: 15),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 4,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          Book books = book[index + 2];
                                          return GestureDetector(
                                             onTap: () {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                BookDetailsPage(
                                                  bookObject: books,
                                                )),
                                      );
                                    },
                                            child: Container(
                                              width: 150,
                                              height: 210,
                                              //  color: Colors.blue,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
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
                                                    height: 15,
                                                  ),
                                                  Text(
                                                    books.title,
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 16),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    'by ${books.author}',
                                                    style: TextStyle(fontSize: 12),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 25.0),
                                      child: Text(
                                        'Genres',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 210,
                                    //   color: Colors.red,
                                    child: ListView(
                                      padding: EdgeInsets.all(10),
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        Container(
                                          height: 150,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: Color(0xff1C4A7E),
                                          ),
                                          width: 280,
                                          child:
                                              Image.asset('assets/Group 13.png'),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Container(
                                          height: 150,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: Color(0xffC65135),
                                          ),
                                          width: 280,
                                          child:
                                              Image.asset('assets/Group 13.png'),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 25.0),
                                      child: Text(
                                        'Recently Viewed',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    //  color: Colors.red,
                                    height: 210,
                                    child: ListView.builder(
                                      padding: EdgeInsets.only(left: 15),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 3,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        Book books = book[index + 5];
                                        return GestureDetector(
                                           onTap: () {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                BookDetailsPage(
                                                  bookObject: books,
                                                )),
                                      );
                                    },
                                          child: Container(
                                            width: 150,
                                            height: 210,
                                            //  color: Colors.blue,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
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
                                                  height: 15,
                                                ),
                                                Text(
                                                  books.title,
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  'by ${books.author}',
                                                  style: TextStyle(fontSize: 12),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),

                                  // Container(
                                  //   //color: Colors.black,
                                  //   height: 390,
                                  //   child: Align(
                                  //     alignment: Alignment.centerLeft,
                                  //     child: ListView(
                                  //       physics: BouncingScrollPhysics(),
                                  //       scrollDirection: Axis.horizontal,
                                  //       children: buildDeals(),
                                  //     ),
                                  //   ),
                                  // ),
                                  // GestureDetector(
                                  //   onTap: () {
                                  //     Navigator.push(
                                  //       context,
                                  //       CupertinoPageRoute(
                                  //           builder: (context) =>
                                  //               AvailableMechanics()),
                                  //     );
                                  //   },
                                  //   child: Padding(
                                  //     padding:
                                  //         EdgeInsets.only(right: 10, left: 10),
                                  //     child: Card(
                                  //       //color: Color(0xff00adb5),
                                  //       shape: RoundedRectangleBorder(
                                  //           borderRadius:
                                  //               BorderRadius.circular(30)),
                                  //       elevation: 0.1,
                                  //       child: Container(
                                  //         decoration: BoxDecoration(
                                  //           gradient: LinearGradient(
                                  //               begin: Alignment.topRight,
                                  //               end: Alignment.bottomLeft,
                                  //               colors: [
                                  //                 //Colors.green[300],
                                  //                 Color(0xff6ad0d3),
                                  //                 Color(0xff00adb5),
                                  //               ]),
                                  //           borderRadius: BorderRadius.all(
                                  //             Radius.circular(30),
                                  //           ),
                                  //         ),
                                  //         padding: EdgeInsets.all(20),
                                  //         height: 100,
                                  //         child: Row(
                                  //           mainAxisAlignment:
                                  //               MainAxisAlignment.spaceBetween,
                                  //           children: [
                                  //             Column(
                                  //               crossAxisAlignment:
                                  //                   CrossAxisAlignment.start,
                                  //               mainAxisAlignment:
                                  //                   MainAxisAlignment.center,
                                  //               children: [
                                  //                 Text(
                                  //                   "Available Mechanics",
                                  //                   style: TextStyle(
                                  //                     fontSize: 22,
                                  //                     fontWeight: FontWeight.bold,
                                  //                     color: Colors.white,
                                  //                   ),
                                  //                 ),
                                  //                 Text(
                                  //                   "Nearest and all",
                                  //                   style: TextStyle(
                                  //                     fontSize: 16,
                                  //                     color: Colors.white,
                                  //                   ),
                                  //                 ),
                                  //               ],
                                  //             ),
                                  //             Container(
                                  //               decoration: BoxDecoration(
                                  //                 color: Colors.white,
                                  //                 borderRadius: BorderRadius.all(
                                  //                   Radius.circular(25),
                                  //                 ),
                                  //               ),
                                  //               height: 50,
                                  //               width: 50,
                                  //               child: Center(
                                  //                 child: Icon(
                                  //                   Icons.arrow_forward_ios,
                                  //                   color: kPrimaryColor,
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //           ],
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),

                                  // Padding(
                                  //   padding: EdgeInsets.fromLTRB(25, 25, 25, 20),
                                  //   child: Row(
                                  //     mainAxisAlignment:
                                  //         MainAxisAlignment.spaceBetween,
                                  //     children: [
                                  //       Text(
                                  //         "OUR DEALERS",
                                  //         style: TextStyle(
                                  //           fontSize: 22,
                                  //           fontWeight: FontWeight.bold,
                                  //           color: Colors.grey[400],
                                  //         ),
                                  //       ),
                                  //       Row(
                                  //         children: [
                                  //           IconButton(
                                  //               icon:
                                  //                   Icon(Icons.view_list_rounded),
                                  //               onPressed: () {
                                  //                 // Navigator.push(
                                  //                 //   context,
                                  //                 //   CupertinoPageRoute(
                                  //                 //       builder: (context) =>
                                  //                 //           NotificationHistory()),
                                  //                 // );
                                  //               }),
                                  //           // Text(
                                  //           //   "view all",
                                  //           //   style: TextStyle(
                                  //           //     fontSize: 14,
                                  //           //     fontWeight: FontWeight.bold,
                                  //           //     color: kPrimaryColor,
                                  //           //   ),
                                  //           // ),
                                  //           // SizedBox(
                                  //           //   width: 8,
                                  //           // ),
                                  //           // Icon(
                                  //           //   Icons.arrow_forward_ios,
                                  //           //   size: 12,
                                  //           //   color: kPrimaryColor,
                                  //           // ),
                                  //         ],
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),

                                  // Container(
                                  //   //color: Colors.black,
                                  //   height: 150,
                                  //   margin: EdgeInsets.only(bottom: 20),
                                  //   child: ListView(
                                  //     physics: BouncingScrollPhysics(),
                                  //     scrollDirection: Axis.horizontal,
                                  //     children: buildDealers(),
                                  //   ),
                                  // ),
                                ],
                              )),
                            )
                    ),
                  ),

                  // second tab bar viiew widget
                   SingleChildScrollView(
                    child: Container(
                       //color: Colors.red,
                      child: AnimationLimiter(  child: Column(
                                  children:
                                      AnimationConfiguration.toStaggeredList(
                                duration: const Duration(milliseconds: 500),
                                childAnimationBuilder: (widget) => SlideAnimation(
                                  horizontalOffset: 50.0,
                                  child: FadeInAnimation(
                                    child: widget,
                                  ),
                                ),
                                children: [

                                  SizedBox(height: 20,),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 25),
                                      child: Text(
                                        'Bestsellers',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    //  color: Colors.red,
                                    height: 210,
                                    child: ListView.builder(
                                        padding: EdgeInsets.only(left: 15),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 4,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          Book books = book[index + 2];
                                          return GestureDetector(
                                             onTap: () {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                BookDetailsPage(
                                                  bookObject: books,
                                                )),
                                      );
                                    },
                                            child: Container(
                                              width: 150,
                                              height: 210,
                                              //  color: Colors.blue,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
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
                                                    height: 15,
                                                  ),
                                                  Text(
                                                    books.title,
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 16),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    'by ${books.author}',
                                                    style: TextStyle(fontSize: 12),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 25.0),
                                      child: Text(
                                        'Genres',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 210,
                                    //   color: Colors.red,
                                    child: ListView(
                                      padding: EdgeInsets.all(10),
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        Container(
                                          height: 150,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: Color(0xff1C4A7E),
                                          ),
                                          width: 280,
                                          child:
                                              Image.asset('assets/Group 13.png'),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Container(
                                          height: 150,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: Color(0xffC65135),
                                          ),
                                          width: 280,
                                          child:
                                              Image.asset('assets/Group 13.png'),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 25.0),
                                      child: Text(
                                        'Recently Viewed',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    //  color: Colors.red,
                                    height: 210,
                                    child: ListView.builder(
                                      padding: EdgeInsets.only(left: 15),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 3,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        Book books = book[index + 5];
                                        return GestureDetector(
                                           onTap: () {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                BookDetailsPage(
                                                  bookObject: books,
                                                )),
                                      );
                                    },
                                          child: Container(
                                            width: 150,
                                            height: 210,
                                            //  color: Colors.blue,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
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
                                                  height: 15,
                                                ),
                                                Text(
                                                  books.title,
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  'by ${books.author}',
                                                  style: TextStyle(fontSize: 12),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),

                                  // Container(
                                  //   //color: Colors.black,
                                  //   height: 390,
                                  //   child: Align(
                                  //     alignment: Alignment.centerLeft,
                                  //     child: ListView(
                                  //       physics: BouncingScrollPhysics(),
                                  //       scrollDirection: Axis.horizontal,
                                  //       children: buildDeals(),
                                  //     ),
                                  //   ),
                                  // ),
                                  // GestureDetector(
                                  //   onTap: () {
                                  //     Navigator.push(
                                  //       context,
                                  //       CupertinoPageRoute(
                                  //           builder: (context) =>
                                  //               AvailableMechanics()),
                                  //     );
                                  //   },
                                  //   child: Padding(
                                  //     padding:
                                  //         EdgeInsets.only(right: 10, left: 10),
                                  //     child: Card(
                                  //       //color: Color(0xff00adb5),
                                  //       shape: RoundedRectangleBorder(
                                  //           borderRadius:
                                  //               BorderRadius.circular(30)),
                                  //       elevation: 0.1,
                                  //       child: Container(
                                  //         decoration: BoxDecoration(
                                  //           gradient: LinearGradient(
                                  //               begin: Alignment.topRight,
                                  //               end: Alignment.bottomLeft,
                                  //               colors: [
                                  //                 //Colors.green[300],
                                  //                 Color(0xff6ad0d3),
                                  //                 Color(0xff00adb5),
                                  //               ]),
                                  //           borderRadius: BorderRadius.all(
                                  //             Radius.circular(30),
                                  //           ),
                                  //         ),
                                  //         padding: EdgeInsets.all(20),
                                  //         height: 100,
                                  //         child: Row(
                                  //           mainAxisAlignment:
                                  //               MainAxisAlignment.spaceBetween,
                                  //           children: [
                                  //             Column(
                                  //               crossAxisAlignment:
                                  //                   CrossAxisAlignment.start,
                                  //               mainAxisAlignment:
                                  //                   MainAxisAlignment.center,
                                  //               children: [
                                  //                 Text(
                                  //                   "Available Mechanics",
                                  //                   style: TextStyle(
                                  //                     fontSize: 22,
                                  //                     fontWeight: FontWeight.bold,
                                  //                     color: Colors.white,
                                  //                   ),
                                  //                 ),
                                  //                 Text(
                                  //                   "Nearest and all",
                                  //                   style: TextStyle(
                                  //                     fontSize: 16,
                                  //                     color: Colors.white,
                                  //                   ),
                                  //                 ),
                                  //               ],
                                  //             ),
                                  //             Container(
                                  //               decoration: BoxDecoration(
                                  //                 color: Colors.white,
                                  //                 borderRadius: BorderRadius.all(
                                  //                   Radius.circular(25),
                                  //                 ),
                                  //               ),
                                  //               height: 50,
                                  //               width: 50,
                                  //               child: Center(
                                  //                 child: Icon(
                                  //                   Icons.arrow_forward_ios,
                                  //                   color: kPrimaryColor,
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //           ],
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),

                                  // Padding(
                                  //   padding: EdgeInsets.fromLTRB(25, 25, 25, 20),
                                  //   child: Row(
                                  //     mainAxisAlignment:
                                  //         MainAxisAlignment.spaceBetween,
                                  //     children: [
                                  //       Text(
                                  //         "OUR DEALERS",
                                  //         style: TextStyle(
                                  //           fontSize: 22,
                                  //           fontWeight: FontWeight.bold,
                                  //           color: Colors.grey[400],
                                  //         ),
                                  //       ),
                                  //       Row(
                                  //         children: [
                                  //           IconButton(
                                  //               icon:
                                  //                   Icon(Icons.view_list_rounded),
                                  //               onPressed: () {
                                  //                 // Navigator.push(
                                  //                 //   context,
                                  //                 //   CupertinoPageRoute(
                                  //                 //       builder: (context) =>
                                  //                 //           NotificationHistory()),
                                  //                 // );
                                  //               }),
                                  //           // Text(
                                  //           //   "view all",
                                  //           //   style: TextStyle(
                                  //           //     fontSize: 14,
                                  //           //     fontWeight: FontWeight.bold,
                                  //           //     color: kPrimaryColor,
                                  //           //   ),
                                  //           // ),
                                  //           // SizedBox(
                                  //           //   width: 8,
                                  //           // ),
                                  //           // Icon(
                                  //           //   Icons.arrow_forward_ios,
                                  //           //   size: 12,
                                  //           //   color: kPrimaryColor,
                                  //           // ),
                                  //         ],
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),

                                  // Container(
                                  //   //color: Colors.black,
                                  //   height: 150,
                                  //   margin: EdgeInsets.only(bottom: 20),
                                  //   child: ListView(
                                  //     physics: BouncingScrollPhysics(),
                                  //     scrollDirection: Axis.horizontal,
                                  //     children: buildDealers(),
                                  //   ),
                                  // ),
                                ],
                              )),
                            )
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}