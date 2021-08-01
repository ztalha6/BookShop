//import 'dart:async';

import 'dart:async';
import 'dart:convert';
import 'package:bookshop/constants.dart';
import 'package:bookshop/data.dart';
import 'package:bookshop/entities/bookmodel.dart';
import 'package:bookshop/entities/coursemodel.dart';
import 'package:bookshop/entities/shopmodel.dart';
import 'package:bookshop/pages/bookDetails.dart';
import 'package:bookshop/pages/bookInTabview.dart';
import 'package:bookshop/pages/contactus.dart';
import 'package:bookshop/pages/courseDetails.dart';
import 'package:bookshop/pages/loginScreen.dart';
import 'package:bookshop/pages/mybooks.dart';
import 'package:bookshop/pages/mycart.dart';
import 'package:bookshop/pages/myorders.dart';
import 'package:bookshop/pages/payments.dart';
import 'package:bookshop/pages/registration.dart';
import 'package:bookshop/pages/setlocation.dart';
import 'package:bookshop/pages/shopDetails.dart';
import 'package:bookshop/pages/termsandconditions.dart';
import 'package:bookshop/widgets/adminflexibleappbar.dart';
import 'package:bookshop/widgets/car_widget.dart';
import 'package:bookshop/widgets/dealer_widget.dart';
import 'package:bookshop/widgets/filter.dart';
import 'package:bookshop/widgets/myappbar.dart';
import 'package:bookshop/widgets/myflexibleappbar.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text/animated_text.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Showroom extends StatefulWidget {
  @override
  _ShowroomState createState() => _ShowroomState();
}

class _ShowroomState extends State<Showroom> {
  // void _onIntroEnd(context) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(builder: (_) => HomeMap()),
  //   );
  // }
  TextEditingController controller = new TextEditingController();
  List<Book> _searchResult = [];
  Timer timer;

  int currentIndex = 0;
  PageController _pageController;
  List<NavigationItem> navigationItems = getNavigationItemList();
  NavigationItem selectedItem;
  List<Car> cars = getCarList();
  List<Dealer> dealers = getDealerList();
  List<Book> books = book;

  TabController tb;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  void dispose() {
    timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _colorScheme = Theme.of(context).colorScheme;
    final double _panelMinSize = 70.0;
    final double _panelMaxSize = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => currentIndex = index);
            },
            children: <Widget>[
              Container(
                child: CustomScrollView(
                  physics: BouncingScrollPhysics(),
                  slivers: <Widget>[
                    SliverAppBar(
                      backgroundColor: Colors.white,
                      stretch: true,
                      //title: MyAppBar(),
                      //pinned: true,
                      expandedHeight:
                          MediaQuery.of(context).size.height * 0.450,
                      flexibleSpace: FlexibleSpaceBar(
                        background: MyFlexiableAppBar(),
                      ),
                    ),
                    SliverList(
                        delegate: SliverChildListDelegate(<Widget>[
                      //Flexible(
                      //  fit: FlexFit.loose,
                      //  flex: 10,
                      //  child:
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[50],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: AnimationLimiter(
                            child: Column(
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
                                Padding(
                                  padding: EdgeInsets.fromLTRB(25, 25, 25, 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "FEATURED BOOKS",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[400],
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                                builder: (context) =>
                                                    BooksTab()),
                                          );
                                        },
                                        child: Text('More'),
                                        style: ElevatedButton.styleFrom(
                                            shape: StadiumBorder(),
                                            primary: Colors.green,
                                            minimumSize: Size(0, 30)),
                                      )
                                    ],
                                  ),
                                ),

                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 25),
                                    child: Text(
                                      'Books',
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
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  'by ${books.author}',
                                                  style:
                                                      TextStyle(fontSize: 12),
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
                                      'Courses',
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
                                  //  color: Colors.red,
                                  height: 210,
                                  child: ListView.builder(
                                    padding: EdgeInsets.only(left: 15),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: allcourses.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      Course course = allcourses[index];
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                                builder: (context) =>
                                                    CourseDetailsPage(
                                                      bookObject: course,
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
                                                height: 150,
                                                width: 280,
                                                child: Image.asset(
                                                  course.imageUrl,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                course.courseName,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              Text(
                                                course.board,
                                                style: TextStyle(
                                                    //fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
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
                                      'Popular',
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
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  'by ${books.author}',
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
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
                          ),
                        ),
                      ),
                      // ),
                    ]))
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Transform.translate(
                      offset: Offset(
                          -MediaQuery.of(context).size.height * 0.050,
                          MediaQuery.of(context).size.height * 0.085),
                      child: Container(
                        //color: Colors.black,
                        height: MediaQuery.of(context).size.height / 7,
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
                                text: 'Books.',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.050,
                                    color: Color(0xff187b20)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    //SEARCH BAR CODE

                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: TextField(
                          controller: controller,
                          onChanged: onSearchTextChanged,
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(fontSize: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                            contentPadding: EdgeInsets.only(
                              left: 30,
                            ),
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(right: 24.0, left: 16.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) => FilterPage(),
                                      ));
                                },
                                child: Icon(
                                  Icons.filter_list_rounded,
                                  color: Colors.black,
                                  size: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        //  color: Colors.red,
                        height: MediaQuery.of(context).size.height,
                        child: _searchResult.length == 0
                            ? ListView.builder(
                                physics: BouncingScrollPhysics(),
                                padding: EdgeInsets.only(left: 20),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: books.length,
                                itemBuilder: (BuildContext context, int index) {
                                  Book books = book[index];
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
                                      height: 150,
                                      //  color: Colors.blue,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            //color: Colors.black,
                                            height: 130,
                                            width: 100,
                                            child: Image.asset(
                                              books.imageUrl,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
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
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                })
                            : ListView.builder(
                                physics: BouncingScrollPhysics(),
                                padding: EdgeInsets.only(left: 20),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: _searchResult.length,
                                itemBuilder: (BuildContext context, int index) {
                                  Book books = _searchResult[index];
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
                                      height: 150,
                                      //  color: Colors.blue,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            //color: Colors.black,
                                            height: 130,
                                            width: 100,
                                            child: Image.asset(
                                              books.imageUrl,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
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
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Scaffold(
                  backgroundColor: Colors.grey.shade200,
                  appBar: AppBar(
                    elevation: 0,
                    brightness: Brightness.light,
                    iconTheme: IconThemeData(color: Colors.black),
                    backgroundColor: Colors.grey.shade200,
                    title: Text(
                      'Settings',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  body: Stack(
                    fit: StackFit.expand,
                    children: [
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Card(
                              elevation: 10.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              color: Colors.green,
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => Registration()),
                                  );
                                },
                                title: Text(
                                  'Amir',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                                leading: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  //backgroundImage: CachedNetworkImageProvider(),
                                ),
                                trailing: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Card(
                              elevation: 4.0,
                              margin: const EdgeInsets.fromLTRB(32, 8, 32, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Column(
                                children: <Widget>[
                                  ListTile(
                                    leading: Icon(
                                      FontAwesomeIcons.cartArrowDown,
                                      color: Colors.green,
                                    ),
                                    title: Text('My Cart'),
                                    trailing: Icon(Icons.keyboard_arrow_right),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) => MyCart()),
                                      );
                                    },
                                  ),
                                  _BuildDivider(),
                                  ListTile(
                                    leading: Icon(
                                      FontAwesomeIcons.book,
                                      color: Colors.green,
                                    ),
                                    title: Text('Selling Books'),
                                    trailing: Icon(Icons.keyboard_arrow_right),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) => MyBooks()),
                                      );
                                    },
                                  ),
                                  _BuildDivider(),
                                  ListTile(
                                    leading: Icon(
                                      Icons.payment_rounded,
                                      color: Colors.green,
                                    ),
                                    title: Text('Payments'),
                                    trailing: Icon(Icons.keyboard_arrow_right),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                PaymentDetails()),
                                      );
                                    },
                                  ),
                                  _BuildDivider(),
                                  ListTile(
                                    leading: Icon(
                                      Icons.location_searching_rounded,
                                      color: Colors.green,
                                    ),
                                    title: Text('Set Location'),
                                    trailing: Icon(Icons.keyboard_arrow_right),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                SetLocation()),
                                      );
                                    },
                                  ),
                                  _BuildDivider(),
                                  ListTile(
                                    leading: Icon(
                                      Icons.shopping_bag_rounded,
                                      color: Colors.green,
                                    ),
                                    title: Text('My Orders'),
                                    trailing: Icon(Icons.keyboard_arrow_right),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) => MyOrders()),
                                      );
                                    },
                                  ),
                                  _BuildDivider(),
                                  ListTile(
                                    leading: Icon(
                                      Icons.contact_mail_rounded,
                                      color: Colors.green,
                                    ),
                                    title: Text('Contact Us'),
                                    trailing: Icon(Icons.keyboard_arrow_right),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) => Contactus()),
                                      );
                                    },
                                  ),
                                  _BuildDivider(),
                                  ListTile(
                                    leading: Icon(
                                      Icons.text_format,
                                      color: Colors.green,
                                    ),
                                    title: Text('Terms & Conditons'),
                                    trailing: Icon(Icons.keyboard_arrow_right),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Terms()),
                                      );
                                    },
                                  ),
                                  _BuildDivider(),
                                  ListTile(
                                    leading: Icon(
                                      Icons.logout,
                                      color: Colors.green,
                                    ),
                                    title: Text('Log out'),
                                    trailing: Icon(Icons.keyboard_arrow_right),
                                    onTap: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyHomePage()),
                                      );
                                    },
                                  )
                                ],
                              ),
                            ),
                            // const SizedBox(
                            //   height: 20.0,
                            // ),
                            Text(
                              'Notification Settings',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo,
                              ),
                            ),
                            SwitchListTile(
                              activeColor: Colors.green,
                              contentPadding: const EdgeInsets.all(0),
                              value: true,
                              onChanged: (val) {},
                              title: Text('Recive Notifications'),
                            ),
                            SwitchListTile(
                              dense: true,
                              activeColor: Colors.green,
                              contentPadding: const EdgeInsets.all(0),
                              value: false,
                              onChanged: null,
                              title: Text('Recive Newsletter'),
                            ),
                            SwitchListTile(
                              activeColor: Colors.green,
                              contentPadding: const EdgeInsets.all(0),
                              value: true,
                              onChanged: (val) {},
                              title: Text('Recive Offer Notification'),
                            ),
                            SwitchListTile(
                              dense: true,
                              activeColor: Colors.green,
                              contentPadding: const EdgeInsets.all(0),
                              value: false,
                              onChanged: null,
                              title: Text('Recive App Updates'),
                            ),
                            const SizedBox(
                              height: 60,
                            )
                          ],
                        ),
                      ),
                      // Positioned(
                      //   bottom: -20.0,
                      //   left: -20.0,
                      //   child: Container(
                      //     height: 80,
                      //     width: 80,
                      //     alignment: Alignment.center,
                      //     decoration: BoxDecoration(
                      //       color: Colors.purple,
                      //       shape: BoxShape.circle,
                      //     ),
                      //   ),
                      // ),
                      // Positioned(
                      //     bottom: 00,
                      //     left: 00,
                      //     child: IconButton(
                      //         icon: Icon(FontAwesomeIcons.signOutAlt,
                      //             color: Colors.white),
                      //         onPressed: () {
                      //           //log out
                      //         }))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          //color: Colors.amber,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(
              Radius.circular(90),
            ),
          ),
          child: BottomNavyBar(
            backgroundColor: Colors.white,
            showElevation: true,
            containerHeight: 53,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            animationDuration: Duration(milliseconds: 400),
            curve: Curves.easeInOutBack,
            selectedIndex: currentIndex,
            onItemSelected: (index) {
              setState(() => currentIndex = index);
              _pageController.jumpToPage(index);
            },
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                textAlign: TextAlign.center,
                icon: Icon(Icons.home),
                title: Text("Home"),
                activeColor: Color(0xff00adb5),
                inactiveColor: Colors.black54,
              ),
              // BottomNavyBarItem(
              //   textAlign: TextAlign.center,
              //   icon: Icon(Icons.my_location),
              //   title: Text("Findme"),
              //   activeColor: Colors.lightBlue,
              //   inactiveColor: Colors.black,
              // ),
              BottomNavyBarItem(
                textAlign: TextAlign.center,
                icon: Icon(Icons.search),
                title: Text("Search"),
                activeColor: Colors.red,
                inactiveColor: Colors.black54,
              ),
              BottomNavyBarItem(
                textAlign: TextAlign.center,
                icon: Icon(Icons.more),
                title: Text("More"),
                activeColor: Colors.green,
                inactiveColor: Colors.black54,
              ),
            ],
          ),
        ));
  }

  // List<Widget> buildDeals() {
  //   List<Widget> list = [];
  //   for (var i = 0; i < 5; i++) {
  //     list.add(Container(
  //       decoration: BoxDecoration(
  //         border: Border.all(
  //           color: Color(0xff66cfd2),
  //         ),
  //         borderRadius: BorderRadius.all(
  //           Radius.circular(50),
  //         ),
  //       ),
  //       //margin: EdgeInsets.only(
  //       //  right: index != null ? 16 : 0, left: index == 0 ? 16 : 0, bottom: 35),
  //       margin: EdgeInsets.only(
  //           right: i != null ? 16 : 0,
  //           left: i == 0 ? 16 : 0,
  //           bottom: 20,
  //           top: 16),
  //       width: MediaQuery.of(context).size.width / 1.5,
  //       child: OpenContainer(
  //           useRootNavigator: true,
  //           closedElevation: 0,
  //           transitionType: ContainerTransitionType.fadeThrough,
  //           transitionDuration: Duration(milliseconds: 1000),
  //           //openElevation: 6.0,
  //           openColor: Color(0xff187b20),
  //           closedShape:
  //               RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
  //           openShape:
  //               RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
  //           //closedColor: Color(0xff187b20),
  //           openBuilder: (context, _) => BookCar(car: books[i]),
  //           closedBuilder: (context, VoidCallback openContainer) =>
  //               buildCar(context, books[i], i)),
  //     ));
  //   }
  //   return list;
  // }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    books.forEach((userDetail) {
      if (userDetail.title.contains(text) || userDetail.author.contains(text))
        _searchResult.add(userDetail);
    });

    setState(() {});
  }

  List<Widget> buildDealers() {
    List<Widget> list = [];
    for (var i = 0; i < 5; i++) {
      list.add(buildDealer(dealers[i], i));
    }
    return list;
  }

  List<Widget> buildNavigationItems() {
    List<Widget> list = [];
    for (var navigationItem in navigationItems) {
      list.add(buildNavigationItem(navigationItem));
    }
    return list;
  }

  Widget buildNavigationItem(NavigationItem item) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedItem = item;
        });
      },
      child: Container(
        width: 50,
        child: Stack(
          children: <Widget>[
            selectedItem == item
                ? Center(
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kPrimaryColorShadow,
                      ),
                    ),
                  )
                : Container(),
            Center(
              child: Icon(
                item.iconData,
                color: selectedItem == item ? kPrimaryColor : Colors.grey[400],
                size: 24,
              ),
            )
          ],
        ),
      ),
    );
  }
}

Container _BuildDivider() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 8.0),
    width: double.infinity,
    height: 1.0,
    color: Colors.grey.shade400,
  );
}
