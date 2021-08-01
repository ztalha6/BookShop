
import 'package:bookshop/entities/bookmodel.dart';
import 'package:flutter/material.dart';

Widget buildCar(BuildContext context, Book book, int index) {
  return Container(
    //color: Colors.black,
    // decoration: BoxDecoration(
    //   border: Border.all(
    //     color: Color(0xff66cfd2),
    //   ),
    //   borderRadius: BorderRadius.all(
    //     Radius.circular(50),
    //   ),
    // ),
    padding: EdgeInsets.all(10),
    //margin: EdgeInsets.only(
    //  right: index != null ? 16 : 0, left: index == 0 ? 16 : 0, bottom: 35),
    margin: EdgeInsets.only(
        //right: index != null ? 16 : 0,
        //left: index == 0 ? 16 : 0,
        bottom: 0,
        top: 10),
    width: 250,
    //height: 10,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: Container(
              decoration: BoxDecoration(
                color:
                    //car.condition == 'Perfect' ? Color(0xff04ab64) : Colors.red,
                    Color(0xff04ab64),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(
                  //car.condition,
                  "Perfect",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        // SizedBox(
        //   height: 8,
        // ),
        Container(
          //color: Colors.black,
          height: MediaQuery.of(context).size.height * 0.2,
          //width: 50,
          child: Center(
            child: Hero(
              tag: book.title,
              child: Image.asset(
                book.imageUrl,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Text(
            book.title,
            style: TextStyle(fontSize: 18),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Text(
            book.author,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              height: 1,
            ),
          ),
        ),
        // Text(
        //   "per " +
        //       (car.condition == "Daily"
        //           ? "day"
        //           : car.condition == "Weekly"
        //               ? "week"
        //               : "month"),
        //   style: TextStyle(
        //     fontSize: 14,
        //     color: Colors.grey,
        //   ),
        // ),
      ],
    ),
  );
}
