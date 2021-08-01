import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class PaymentDetails extends StatefulWidget {
  @override
  _PaymentDetailsState createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
   Future getalluserNotification() async {
    // var url = 'https://' +
    //     ip +
    //     '/app/api/notificationlog/gethistorybyid?email=' +
    //     userEmail +
    //     '';

    // var response = await http.get(url);
    // print(response.body);
    // var users = List<NotificationLog>();

    // if (response.statusCode == 200) {
    //   var usersjson = json.decode(response.body);
    //   for (var userjson in usersjson) {
    //     users.add(NotificationLog.fromJson(userjson));
    //   }
    // }
    // allnotihistory.clear();
    // allnotihistory.addAll(users);
    return null;
  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Transform.translate(
                  offset: Offset(-8, 60),
                  child: Container(
                    child: RichText(
                      text: TextSpan(
                        text: 'Payments ',
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
                            text: 'History.',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.046,
                                color: Color(0xff187b20)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: FutureBuilder(
                  future: getalluserNotification(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    // if (snapshot.data == null) {
                    //   return Center(
                    //     child: SpinKitDoubleBounce(
                    //       color: Color(0xff187b20),
                    //       size: 50.0,
                    //     ),
                    //   );
                    // } else {
                      // if (allnotihistory.isEmpty) {
                      //   return Container(
                      //     child: Center(
                      //       child: Text('Sorry, No notification found :('),
                      //     ),
                      //   );
                      // } else {
                      return Scrollbar(
                        isAlwaysShown: true,
                        showTrackOnHover: true,
                        child: AnimationLimiter(
                          child: ListView.builder(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                            physics: BouncingScrollPhysics(),
                            itemCount: 10,
                            //itemCount: allnotihistory.length,
                            itemBuilder: (BuildContext context, int index) {
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 375),
                                child: SlideAnimation(
                                  verticalOffset: 50.0,
                                  child: FadeInAnimation(
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor: Color(0xff187b20),
                                        child: Text(
                                          // allcontributions[0]
                                          //     .responseObject[index]
                                          //     .contributionFundId
                                          //     .toString(),
                                          (index + 1).toString(),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      title: Text("Payment for Order number  ####."),
                                      subtitle: Text(
                                          'On User ID: 2345, On date: 22/3/2021'),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                      // return ListView.builder(
                      //     physics: BouncingScrollPhysics(),
                      //     //itemCount: 10,
                      //     itemCount: allcontributions[0].responseObject.length,
                      //     itemBuilder: (BuildContext context, int index) {
                      //       return ListTile(
                      //         leading: CircleAvatar(
                      //           backgroundColor: Color(0xff187b20),
                      //           child: Text(
                      //             allcontributions[0]
                      //                 .responseObject[index]
                      //                 .contributionFundId
                      //                 .toString(),
                      //             //(index + 1).toString(),
                      //             style: TextStyle(color: Colors.white),
                      //           ),
                      //         ),
                      //         title: Text('Rupees of ' +
                      //             allcontributions[0]
                      //                 .responseObject[index]
                      //                 .amount
                      //                 .toString()),
                      //         subtitle: Text('Contribution ' +
                      //             allcontributions[0]
                      //                 .responseObject[index]
                      //                 .contributionFundFromstring +
                      //             ' to ' +
                      //             allcontributions[0]
                      //                 .responseObject[index]
                      //                 .contributionFundTillstring),
                      //       );
                      //     });
                      // }
                   // }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //   padding: EdgeInsets.only(bottom: 5),
      //   child: Padding(
      //     padding: EdgeInsets.all(10),
      //     child: TextField(
      //       decoration: InputDecoration(
      //         hintText: 'Search',
      //         hintStyle: TextStyle(fontSize: 16),
      //         border: OutlineInputBorder(
      //           borderRadius: BorderRadius.circular(25),
      //           borderSide: BorderSide(
      //             width: 0,
      //             style: BorderStyle.none,
      //           ),
      //         ),
      //         filled: true,
      //         fillColor: Colors.grey[300],
      //         contentPadding: EdgeInsets.only(
      //           left: 30,
      //         ),
      //         suffixIcon: Padding(
      //           padding: EdgeInsets.only(right: 24.0, left: 16.0),
      //           child: Icon(
      //             Icons.search,
      //             color: Colors.black,
      //             size: 24,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  
  }
}