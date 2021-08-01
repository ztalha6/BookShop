import 'package:bookshop/entities/bookmodel.dart';
import 'package:flutter/material.dart';

class BookDetailsPage extends StatefulWidget {
  final Book bookObject;
  String role;

  BookDetailsPage({Key key, @required this.bookObject, this.role})
      : super(key: key);
  @override
  _BookDetailsPageState createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Book Deatils",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.bookObject.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                //color: Colors.black,
                height: 230,
                width: 150,
                child: Image.asset(
                  widget.bookObject.imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.black45)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.bookObject.title,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'by ${widget.bookObject.author}',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          Text(
                            'Rs. ' +
                                widget.bookObject.price.toString() +
                                ' Only',
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.black45)),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Details",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Publisher: " + widget.bookObject.publisher,
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 15),
                          ),
                          Text(
                            "School: " + widget.bookObject.school,
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 15),
                          ),
                          Text(
                            "Board: " + widget.bookObject.board,
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 15),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Description: ",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 15),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.bookObject.description,
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: widget.role != "admin"
          ? FlatButton(
              shape: StadiumBorder(),
              color: mycart.contains(widget.bookObject)
                  ? Colors.red
                  : Colors.green,
              onPressed: () {
                setState(() {
                  mycart.contains(widget.bookObject)
                      ? mycart.remove(widget.bookObject)
                      : mycart.add(widget.bookObject);
                });
              },
              child: mycart.contains(widget.bookObject)
                  ? Text(
                      "Remove from Cart",
                      style: TextStyle(color: Colors.white),
                    )
                  : Text(
                      "Add to Cart",
                      style: TextStyle(color: Colors.white),
                    ))
          : Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                    shape: StadiumBorder(),
                    color: Colors.red,
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text(
                      "Reject",
                      style: TextStyle(color: Colors.white),
                    )),
                SizedBox(
                  width: 10,
                ),
                FlatButton(
                    shape: StadiumBorder(),
                    color: Colors.green,
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text(
                      "Accept",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
    );
  }
}
