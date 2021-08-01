import 'package:bookshop/entities/bookmodel.dart';
import 'package:bookshop/pages/bookform.dart';
import 'package:bookshop/pages/courseform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyBooks extends StatefulWidget {
  @override
  _MyBooksState createState() => _MyBooksState();
}

class _MyBooksState extends State<MyBooks> {
  TextEditingController controller = new TextEditingController();
  List<Book> _searchResult = [];
  List<Book> books = book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Transform.translate(
                offset: Offset(-MediaQuery.of(context).size.height * 0.080,
                    MediaQuery.of(context).size.height * 0.085),
                child: Container(
                  //color: Colors.black,
                  height: MediaQuery.of(context).size.height / 7,
                  child: RichText(
                    text: TextSpan(
                      text: 'Selling ',
                      style: TextStyle(
                          // shadows: [
                          //   Shadow(
                          //     blurRadius: 20.0,
                          //     color: Color(0xff2a4771),
                          //     offset: Offset(12.0, 12.0),
                          //   ),
                          // ],
                          fontWeight: FontWeight.w900,
                          fontSize: MediaQuery.of(context).size.height * 0.050,
                          color: Color(0xff1d395c)),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Books.',
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
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 24,
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
                                      builder: (context) => RegisterBook(
                                            bookObject: books,
                                          )),
                                );
                              },
                              child: Container(
                                width: 150,
                                height: 150,
                                //  color: Colors.blue,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      builder: (context) => RegisterBook(
                                            bookObject: books,
                                          )),
                                );
                              },
                              child: Container(
                                width: 150,
                                height: 150,
                                //  color: Colors.blue,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
        floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                    shape: StadiumBorder(),
                    color: Colors.red,
                    onPressed: () {
                       Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => RegisterBook()),
              );
                    },
                    child: Text(
                      "+ Book",
                      style: TextStyle(color: Colors.white),
                    )),
                    SizedBox(width: 10,),
                FlatButton(
                    shape: StadiumBorder(),
                    color: Colors.green,
                    onPressed: () {
                     Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => RegisterCourse()),
                            );
                    },
                    child:  Text(
                            "+ Course",
                            style: TextStyle(color: Colors.white),
                          ))
              ],
            ),);
  
  }

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
}
