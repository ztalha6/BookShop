import 'dart:convert';

import 'package:animated_text/animated_text.dart';
import 'package:bookshop/pages/showroom.dart';
import 'package:flutter/material.dart';

import 'loginScreen.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:animated_splash/animated_splash.dart';
import 'package:http/http.dart' as http;

class Contactus extends StatefulWidget {
  @override
  _ContactusState createState() => _ContactusState();
}

class _ContactusState extends State<Contactus> {
  final introKey = GlobalKey<IntroductionScreenState>();

  double columnAnimation = 0;

  TextEditingController get firstNameController => null;

  TextEditingController get lastNameController => null;

  TextEditingController get phoneController => null;

  TextEditingController get emailController => null;

  TextEditingController get cityController => null;
  //void duringSplash(){}

  MediaQueryData queryData;
  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/$assetName.jpg', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    Size size = MediaQuery.of(context).size;
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      //pageColor: Color(0xff1e385d),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
    );

    return IntroductionScreen(
      globalBackgroundColor: Color(0xff04ab64),
      //animationDuration: 800,
      key: introKey,
      pages: [
        PageViewModel(
            title: "",
            decoration: pageDecoration,
            bodyWidget: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Transform.translate(
                      offset: Offset(-15, 5),
                      child: Container(
                        child: RichText(
                          text: TextSpan(
                            text: 'Contact ',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 38,
                                color: Color(0xff1d395c)),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Us',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 36,
                                    color: Color(0xff04ab64)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    //Text("data"),
                  ],
                ),
                Container(
                  width: 450,
                  height: 300,
                  //bottom: 1 * .15,
                  child: Card(
                    shadowColor: Color(0xff2a4771),
                    margin: EdgeInsets.symmetric(vertical: 30),
                    color: Color(0xfff3f4f6),
                    elevation: 18,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                      child: Column(
                        children: [
                          buildTextField(
                              'Your name', Icons.person, firstNameController),
                          SizedBox(height: 10),
                          buildTextField(
                              'Email', Icons.email_rounded, emailController),
                          SizedBox(height: 10),
                          buildTextField('Your Message', Icons.message_rounded,
                              cityController)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ],
      onDone: () {},
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      //showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Submit', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeColor: Color(0xff04ab64),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }

  buildTextField(String labelText, IconData icon, TextEditingController tc) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
        // decoration: BoxDecoration(
        //   //border: Border(bottom: BorderSide(color: Colors.black, width: 1.0))
        //   borderRadius: BorderRadius.circular(25),
        //   color: Colors.grey[200],
        // ),
        child: TextField(
          controller: tc,
          autofocus: false,
          style: TextStyle(height: 1.5), //increases the height of cursor
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color(0xff2a4771), width: 2.0),
              borderRadius: BorderRadius.circular(25.0),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 15),
            labelText: labelText,
            labelStyle: TextStyle(
              color: Color(0xff2a4771),
            ),
            //hintText: labelText,
            //labelStyle: TextStyle(color: Colors.black87),
            // icon: Icon(
            //   icon,
            //   size: 25,
            //   color: Colors.black,
            // ),
            //prefix: Icon(icon),
            prefixIcon: Icon(
              icon,
              color: Color(0xff04ab64),
            ),

            border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff2a4771)),
                borderRadius: BorderRadius.circular(40)),
          ),
        ));
  }

  buildMilageTextField(
      String labelText, IconData icon, TextEditingController tc) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
        // decoration: BoxDecoration(
        //   //border: Border(bottom: BorderSide(color: Colors.black, width: 1.0))
        //   borderRadius: BorderRadius.circular(25),
        //   color: Colors.grey[200],
        // ),
        child: TextField(
          controller: tc,
          autofocus: false,
          style: TextStyle(height: 1.5), //increases the height of cursor
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color(0xff2a4771), width: 2.0),
              borderRadius: BorderRadius.circular(25.0),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 15),
            labelText: labelText,
            labelStyle: TextStyle(
              color: Color(0xff2a4771),
            ),
            //hintText: labelText,
            //labelStyle: TextStyle(color: Colors.black87),
            // icon: Icon(
            //   icon,
            //   size: 25,
            //   color: Colors.black,
            // ),
            //prefix: Icon(icon),
            prefixIcon: Icon(
              icon,
              color: Color(0xff04ab64),
            ),

            border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff2a4771)),
                borderRadius: BorderRadius.circular(40)),
          ),
        ));
  }
}

class GettingStart extends StatelessWidget {
  // Color primaryColor = Colors.white;
  // Color secColor = Color(0xff232c51);
  // Color logoGreen = Color(0xff0C08CC);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // backgroundColor: primaryColor,
        // body: Container(
        //   //margin: EdgeInsets.symmetric(horizontal: 55),
        //   margin: EdgeInsets.fromLTRB(45, 170, 45, 0),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[
        //       //We take the image from the assets
        //       Image.asset(
        //         'assets/logo3.png',
        //         height: 60,
        //       ),
        //       SizedBox(
        //         height: 0,
        //       ),
        //       //Texts and Styling of them
        //       Text(
        //         'Welcome to Car Care',
        //         textAlign: TextAlign.center,
        //         style: TextStyle(
        //           color: Colors.black,
        //           fontSize: 23,
        //         ),
        //       ),
        //       SizedBox(height: 5),
        //       Text(
        //         'A better way for you to manage your car by CarCare.',
        //         textAlign: TextAlign.center,
        //         style: TextStyle(color: Colors.black87, fontSize: 16),
        //       ),
        //       SizedBox(
        //         height: 165,
        //       ),
        //       //Our MaterialButton which when pressed will take us to a new screen named as
        //       //LoginScreen
        //       MaterialButton(
        //         shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(100),
        //         ),
        //         elevation: 0,
        //         height: 50,
        //         onPressed: () {
        //           Navigator.push(
        //               context, MaterialPageRoute(builder: (_) => LoginScreen()));
        //         },
        //         color: Colors.blueAccent,
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: <Widget>[
        //             Text('Get Started',
        //                 style: TextStyle(color: Colors.white, fontSize: 20)),
        //             Icon(Icons.arrow_forward_ios)
        //           ],
        //         ),
        //         textColor: Colors.white,
        //       )
        //     ],
        //   ),
        // ),
        //bottomNavigationBar: //BottomNavyBar(),
        );
  }
}
