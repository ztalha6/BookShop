import 'package:bookshop/pages/notificationHistory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyAppBar extends StatelessWidget {
  final double barHeight = 66.0;

  const MyAppBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.green,
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
              padding: const EdgeInsets.fromLTRB(0, 16, 80, 16),
              child: Text(
                'Top picks',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 40.0),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: IconButton(
                icon: Icon(
                  //FontAwesomeIcons.calendarAlt,
                  Icons.circle_notifications,
                  color: Colors.black45,
                  size: 24,
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
    );
  }
}
