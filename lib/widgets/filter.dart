
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';



class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final _formKey = GlobalKey<FormState>();
  final _openDropDownProgKey = GlobalKey<DropdownSearchState<String>>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FlatButton(onPressed: (){}, child: Text("Apply filter",style: TextStyle(color: Colors.white),),shape: StadiumBorder(),color: Colors.green,),
      appBar: AppBar(title: Text("Set Filter"),backgroundColor: Colors.green,),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            padding: EdgeInsets.all(4),
            children: <Widget>[
              ///Menu Mode with no searchBox
              DropdownSearch<String>(
                validator: (v) => v == null ? "required field" : null,
                hint: "Select a country",
                mode: Mode.MENU,
                showSelectedItem: true,
                items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
                label: "Country",
                showClearButton: true,
                onChanged: print,
                popupItemDisabled: (String s) => s.startsWith('I'),
                //selectedItem: "Tunisia",
                onBeforeChange: (a, b) {
                  if (b == null) {
                    AlertDialog alert = AlertDialog(
                      title: Text("Are you sure..."),
                      content: Text("...you want to clear the selection"),
                      actions: [
                        TextButton(
                          child: Text("OK"),
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                        ),
                        TextButton(
                          child: Text("NOT OK"),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                        ),
                      ],
                    );

                    return showDialog<bool>(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        });
                  }

                  return Future.value(true);
                },
              ),
              Divider(),
              DropdownSearch<String>(
                validator: (v) => v == null ? "required field" : null,
                hint: "Select a city",
                mode: Mode.MENU,
                showSelectedItem: true,
                items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
                label: "City",
                showClearButton: true,
                onChanged: print,
                popupItemDisabled: (String s) => s.startsWith('I'),
                //selectedItem: "Tunisia",
                onBeforeChange: (a, b) {
                  if (b == null) {
                    AlertDialog alert = AlertDialog(
                      title: Text("Are you sure..."),
                      content: Text("...you want to clear the selection"),
                      actions: [
                        TextButton(
                          child: Text("OK"),
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                        ),
                        TextButton(
                          child: Text("NOT OK"),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                        ),
                      ],
                    );

                    return showDialog<bool>(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        });
                  }

                  return Future.value(true);
                },
              ),
              Divider(),
              DropdownSearch<String>(
                validator: (v) => v == null ? "required field" : null,
                hint: "Select a area",
                mode: Mode.MENU,
                showSelectedItem: true,
                items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
                label: "Area",
                showClearButton: true,
                onChanged: print,
                popupItemDisabled: (String s) => s.startsWith('I'),
                //selectedItem: "Tunisia",
                onBeforeChange: (a, b) {
                  if (b == null) {
                    AlertDialog alert = AlertDialog(
                      title: Text("Are you sure..."),
                      content: Text("...you want to clear the selection"),
                      actions: [
                        TextButton(
                          child: Text("OK"),
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                        ),
                        TextButton(
                          child: Text("NOT OK"),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                        ),
                      ],
                    );

                    return showDialog<bool>(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        });
                  }

                  return Future.value(true);
                },
              ),
              Divider(),
              DropdownSearch<String>(
                validator: (v) => v == null ? "required field" : null,
                hint: "Select a price",
                mode: Mode.MENU,
                showSelectedItem: true,
                items: ["400", "500", "600", '700'],
                label: "Price",
                showClearButton: true,
                onChanged: print,
                popupItemDisabled: (String s) => s.startsWith('I'),
                //selectedItem: "Tunisia",
                onBeforeChange: (a, b) {
                  if (b == null) {
                    AlertDialog alert = AlertDialog(
                      title: Text("Are you sure..."),
                      content: Text("...you want to clear the selection"),
                      actions: [
                        TextButton(
                          child: Text("OK"),
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                        ),
                        TextButton(
                          child: Text("NOT OK"),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                        ),
                      ],
                    );

                    return showDialog<bool>(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        });
                  }

                  return Future.value(true);
                },
              ),
              Divider(),
              
               ],
          ),
        ),
      ),
    );
  }

}