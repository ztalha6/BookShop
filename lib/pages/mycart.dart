import 'package:bookshop/entities/bookmodel.dart';
import 'package:bookshop/pages/bookDetails.dart';
import 'package:bookshop/widgets/counter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
enum SingingCharacter { lafayette, jefferson }
class MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  SingingCharacter _character ;
  int total=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Transform.translate(
              offset: Offset(MediaQuery.of(context).size.height * 0.040,
                  MediaQuery.of(context).size.height * 0.035),
              child: Container(
                //color: Colors.black,
                height: MediaQuery.of(context).size.height / 7,
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'My ',
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
                            text: 'Cart.',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.050,
                                color: Color(0xff187b20)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //SEARCH BAR CODE
            SizedBox(height: 30),
            Expanded(
              child: Container(
                  //  color: Colors.red,
                  height: MediaQuery.of(context).size.height,
                  child: mycart.length != 0
                      ? ListView.builder(
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.only(left: 20),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: mycart.length,
                          itemBuilder: (BuildContext context, int index) {
                            Book books = mycart[index];
                            return GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   CupertinoPageRoute(
                                //       builder: (context) =>
                                //           BookDetailsPage(
                                //             bookObject: books,
                                //           )),
                                // );
                              },
                              child: Container(
                                width: 150,
                                height: 250,
                                //  color: Colors.blue,
                                child: Column(
                                  children: [
                                    Row(
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
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'Rs. ${books.price}',
                                              style: TextStyle(fontSize: 12),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        CountButtonView(
                                          initialCount: 1,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              mycart.remove(books);
                                            });
                                          },
                                          child: Text('Remove'),
                                          style: ElevatedButton.styleFrom(
                                              shape: StadiumBorder(),
                                              primary: Colors.red,
                                              minimumSize: Size(0, 45)),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          })
                      : Center(
                          child: Text("Your cart is empty"),
                        )),
            ),
          ],
        ),
      ),
      floatingActionButton: FlatButton(
        onPressed: () {
          totalAmount();
          AlertDialog alert = AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Your Order"),
                Divider(),
                Text("Total Rs." + total.toString())
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Please checkout your order bellow"),
                Divider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ListView.builder(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.only(left: 0),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: mycart.length,
                        itemBuilder: (BuildContext context, int index) {
                          Book books = mycart[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => BookDetailsPage(
                                          bookObject: books,
                                        )),
                              );
                            },
                            child: Container(
                              width: 150,
                              height: 100,
                              //  color: Colors.blue,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    //color: Colors.black,
                                    height: 80,
                                    width: 60,
                                    child: Image.asset(
                                      books.imageUrl,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        books.title,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'by ${books.author}',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Rs. ${books.price}',
                                        style: TextStyle(fontSize: 12),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ],
                )
              ],
            ),
            actions: [
              TextButton(
                child: Text("Not now"),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  
                  showMaterialModalBottomSheet(
  context: context,
  builder: (context) => SingleChildScrollView(
    controller: ModalScrollController.of(context),
    child: Container(child: Column(
      children: <Widget>[
        ListTile(
          title: const Text('Credit Card or Debit Card'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.lafayette,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Cash'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.jefferson,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    ),),
  ),
);
                  
                },
              ),
            ],
          );

          return showDialog<bool>(
              context: context,
              builder: (BuildContext context) {
                return alert;
              });
        },
        child: Text(
          "Check out",
          style: TextStyle(color: Colors.white),
        ),
        shape: StadiumBorder(),
        color: Colors.green,
      ),
    );
  }

  void totalAmount(){
    total=0;
    for (var i = 0; i < mycart.length; i++) {
      total=total+mycart[i].price;
    }
  }

}




