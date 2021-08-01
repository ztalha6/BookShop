import 'package:bookshop/pages/registration.dart';
import 'package:bookshop/pages/shopregistration.dart';
import 'package:bookshop/pages/showroom.dart';
import 'package:bookshop/pages/vendorshowroom.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatefulWidget {
  String s;
  OnBoardingPage(this.s);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  void _onIntroEnd(context) {
    if (widget.s == "vendor") {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => ShopRegistration()),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => Registration()),
      );
    }
  }

  //void duringSplash(){}
  // @override
  // void _onIntroEnd() {
  //   setState(() {
  //     MyHomePage();
  //   });
  //   super.initState();
  // }
  // void _onIntroEnd(context) {
  //   setState(() {

  //   });
  //   // Navigator.of(context).push(
  //   //   MaterialPageRoute(builder: (_) => LoginScreen()),
  //   // );
  // }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/$assetName.png', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    print("Hello");
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
    );

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: IntroductionScreen(
        //animationDuration: 800,
        key: introKey,
        pages: [
          PageViewModel(
            // titleWidget: AnimatedText(
            //   alignment: Alignment.center,
            //   speed: Duration(milliseconds: 1000),
            //   controller: AnimatedTextController.loop,
            //   displayTime: Duration(milliseconds: 1000),
            //   wordList: ['animations.', 'are.', 'easier.', 'now.'],
            //   textStyle: TextStyle(
            //       color: Colors.black, fontSize: 55, fontWeight: FontWeight.w700),
            //   onAnimate: (index) {
            //     print("Animating index:" + index.toString());
            //   },
            //   onFinished: () {
            //     print("Animtion finished");
            //   },
            // ),
            title: "Dicounted SecondHand Books",
            body: "'Used and near new secondhand books at great prices.",
            image: _buildImage('onboarding0'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "20 Book Grocers Naionally",
            body: "We have successfully opened 20 stores across Pakistan.",
            image: _buildImage('onboarding1'),
            decoration: pageDecoration,
          ),
          PageViewModel(
              title: "Sell or Recycle Your Old Books With Us",
              body:
                  "If you are looking to downsize, sell or recycle old books.",
              image: _buildImage('onboarding2'),
              decoration: pageDecoration,
              footer: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: RaisedButton(
                  onPressed: () {
                    introKey.currentState?.animateScroll(0);
                  },
                  child: const Text(
                    'Start Again',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Color(0xff04ab64),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              )),
        ],
        // onDone: () => Navigator.of(context).push(
        //   MaterialPageRoute(builder: (_) => LoginScreen()),
        // ),
        onDone: () => _onIntroEnd(context),
        //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
        showSkipButton: true,
        skipFlex: 0,
        nextFlex: 0,
        skip: const Text('Skip'),
        next: const Icon(Icons.arrow_forward),
        done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
        dotsDecorator: const DotsDecorator(
          activeColor: Color(0xff04ab64),
          size: Size(10.0, 10.0),
          color: Color(0xFFBDBDBD),
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
      ),
    );
  }
}
