import 'package:bookshop/data.dart';
import 'package:flutter/material.dart';

Widget buildDealer(Dealer dealer, int index) {
  return Card(
    //color: Colors.black,
    elevation: 0.1,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    //margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
    margin: EdgeInsets.only(right: 16, left: index == 0 ? 16 : 0, bottom: 5),
    child: Container(
      //height: 150,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      padding: EdgeInsets.all(16),
      //margin: EdgeInsets.only(right: 16, left: index == 0 ? 16 : 0),
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(dealer.image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            height: 60,
            width: 60,
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            dealer.name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              height: 1,
            ),
          ),
          Text(
            dealer.devices.toString() + " devices",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    ),
  );
}
