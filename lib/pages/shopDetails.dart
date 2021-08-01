import 'package:bookshop/entities/bookmodel.dart';
import 'package:bookshop/entities/shopmodel.dart';
import 'package:bookshop/pages/bookDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopDetailsPage extends StatefulWidget {
  final Shop shopObject;
  String role;

  ShopDetailsPage({Key key,  this.shopObject, this.role})
      : super(key: key);
  @override
  _ShopDetailsPageState createState() => _ShopDetailsPageState();
}

class _ShopDetailsPageState extends State<ShopDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: widget.role=="admin"?Row(
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
                    SizedBox(width: 10,),
                FlatButton(
                    shape: StadiumBorder(),
                    color: Colors.green,
                    onPressed: () {
                      setState(() {
                      });
                    },
                    child:  Text(
                            "Accept",
                            style: TextStyle(color: Colors.white),
                          ))
              ],
            ):Container()
   ,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Shop Deatils",
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
                widget.shopObject.shopname,
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
                  widget.shopObject.imageUrl,
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
                                widget.shopObject.shopname,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20),
                              ),
                              Text(
                                widget.shopObject.address,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16),
                              ),
                              Text(
                                widget.shopObject.ownername,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                          Text(
                                widget.shopObject.ownerNumber,
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
                            "Books Available",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 20),
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
                                itemCount: 4,
                                itemBuilder: (BuildContext context, int index) {
                                  Book books =
                                      widget.shopObject.shopBooks[index];
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
    );
  }
}
