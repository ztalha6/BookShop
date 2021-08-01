import 'dart:convert';
import 'dart:async';
import 'package:bookshop/pages/adminshowroom.dart';
import 'package:bookshop/pages/onBoarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

const users = const {
  'vendor@gmail.com': 'vendor',
  'user@gmail.com': 'user',
  'admin@gmail.com':'admin'
};

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  

  @override
  LoginScreen createState() => LoginScreen();
}

class LoginScreen extends State<MyHomePage> {
  // List<CurrentUser> _users = List<CurrentUser>();
  // List<Mechanics> _mechanics = List<Mechanics>();

  static String thisUser;
  bool admin=false;
  bool vendor=false;

  // Future<String> addnewUser(String userName, String password) async {
  //   var url = 'https://' + ip + '/app/api/User/AddNewUser';
  //   var response = await http.post(
  //     url,
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode({"email": userName, "paswword": password}),
  //   );
  //   print(response.body);
  //   var users = List<CurrentUser>();

  //   if (response.statusCode == 201) {
  //     var usersjson = json.decode(response.body);
  //     //for (var userjson in usersjson) {
  //     users.add(CurrentUser.fromJson(usersjson));
  //     //}
  //     await getallusers().then((value) {
  //       setState(() {
  //         _users.clear();
  //         _users.addAll(value);
  //       });
  //     });
  //     return 'Registered Sucussfully';
  //   } else {
  //     return null;
  //   }
  // }

  @override
  void initState() {
    //getthings();

    // getallusers().then((value) {
    //   setState(() {
    //     _users.clear();
    //     _users.addAll(value);
    //   });
    // });
    super.initState();
  }

  Duration get loginTime => Duration(milliseconds: 1500);

  // Future<String> _authUser(LoginData data) {
  //   print('Name: ${data.name}, Password: ${data.password}');
  //   for (var i = 0; i < _users.length; i++) {
  //     print(_users[i].email);
  //   }
  //   for (var i = 0; i < _users.length; i++) {
  //     print(_users[i].password);
  //   }
  //   return Future.delayed(loginTime).then((_) {
  //     var i = 0;
  //     while (i < _users.length) {
  //       if (_users[i].email == data.name) {
  //         if (_users[i].password == data.password) {
  //           userEmail = _users[i].email;
  //           CurrentUser.thisUSer = _users[i].firstName;
  //           if (ifIsnew(_users[i])) {
  //             isNewUser = true;
  //           } else {
  //             isNewUser = false;
  //           }
  //           print(CurrentUser.thisUSer);
  //           print(_users[i].firstName);
  //           return null;
  //         } else {
  //           return 'Password does not match';
  //         }
  //       } else {
  //         i++;
  //       }
  //     }
  //     return 'Username not exists';
  //   });
  // }

  // bool ifIsnew(CurrentUser c) {
  //   if (c.firstName == null &&
  //       c.city == null &&
  //       c.lastName == null &&
  //       c.phone == null) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  Future<String> _signUpUser(LoginData data) {
    return Future.delayed(loginTime).then((_) async {
      // String o = await addnewUser(data.name, data.password);
      //if (o != null) {
      //isNewUser = true;
      //_authUser(data);
      return null;
      // } else {
      return 'Error! Check data again.';
      //  }
    });
  }

  Future<String> _authUserAlternate(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'Username not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      if(data.name=="admin@gmail.com"){
        admin=true;
      }
      if(data.name=="vendor@gmail.com"){
        vendor=true;
      }
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Username not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    // if (ip == null) {
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: new Text("Error!"),
    //         content: new Text("You cannot leave mileage feild empty."),
    //       );
    //     },
    //   );
    // }
    return Scaffold(
      backgroundColor: Colors.white,
      //height: MediaQuery.of(context).size.height,
      //width: MediaQuery.of(context).size.width,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: FlutterLogin(
          //messages: LoginMessages(forgotPasswordButton: "Bhai ay kro"),
          theme: LoginTheme(
            bodyStyle: TextStyle(
              color: Colors.white,
            ),
            titleStyle: TextStyle(fontWeight: FontWeight.w400),
            inputTheme: InputDecorationTheme(
                filled: true,
                //helperStyle: TextStyle(color: Colors.white),
                fillColor: Colors.white.withOpacity(.2),
                labelStyle: TextStyle(color: Colors.white),
                prefixStyle: TextStyle(color: Colors.white),
                suffixStyle: TextStyle(color: Colors.white)),
            buttonTheme: LoginButtonTheme(
                backgroundColor: Colors.green,
                highlightColor: null,
                splashColor: Colors.white),
            textFieldStyle: TextStyle(color: Colors.white),
            primaryColor: Colors.white,
            accentColor: Colors.green,
            //buttonStyle: TextStyle(color: Colors.white),
            cardTheme: CardTheme(
                color: Color(0xff191f39),
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0)),
          ),
          //Color(0xff191f39)
          title: 'Kitab Ghar',
          //titleTag: 'login',
          //logo: 'assets/loginscreenlogo.gif',
          onLogin: _authUserAlternate,
          onSignup: _signUpUser,

          onSubmitAnimationCompleted: () {
            if (admin) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => AdminShowroom(),
            ));
             } 
             else if(vendor){
               Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => OnBoardingPage("vendor"),
                ));
             }
             else
              {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => OnBoardingPage("user"),
                ));
              }
          },
          onRecoverPassword: _recoverPassword,
        ),
      ),
    );
  }
}
