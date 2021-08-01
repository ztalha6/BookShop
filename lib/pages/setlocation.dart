import 'package:flutter/material.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';

class SetLocation extends StatefulWidget {
  @override
  _SetLocationState createState() => _SetLocationState();
}

class _SetLocationState extends State<SetLocation> {
  String countryValue;
  String stateValue;
  String cityValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Set Location'),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          height: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SelectState(
                // style: TextStyle(color: Colors.red),
                onCountryChanged: (value) {
                  setState(() {
                    countryValue = value;
                  });
                },
                onStateChanged: (value) {
                  setState(() {
                    stateValue = value;
                  });
                },
                onCityChanged: (value) {
                  setState(() {
                    cityValue = value;
                  });
                },
              ),
              FlatButton(
                onPressed: () {},
                child: Text(
                  "Set",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.green,
              )
              // InkWell(
              //   onTap:(){
              //     print('country selected is $countryValue');
              //     print('country selected is $stateValue');
              //     print('country selected is $cityValue');
              //   },
              //   child: Text(' Check')
              // )
            ],
          )),
    );
  }
}
