import 'dart:io';

import 'package:bookshop/entities/bookmodel.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class RegisterBook extends StatefulWidget {
  final Book bookObject;

  RegisterBook({Key key, this.bookObject}) : super(key: key);
  @override
  _RegisterBookState createState() => _RegisterBookState();
}

class _RegisterBookState extends State<RegisterBook> {
  final List<String> conditonsList = [
    "New",
    "Old",
  ]; //
  String conditionSelected;

  final List<String> boardList = [
    "Fedral",
    "Sindh",
  ]; //
  String boardSelected;
  final List<String> schoolList = [
    "APS",
    "KPS",
  ]; //
  String schoolSelected;

  TextEditingController titleCon = TextEditingController();
  TextEditingController authorCon = TextEditingController();
  TextEditingController priceCon = TextEditingController();
  TextEditingController desCon = TextEditingController();

  final _formKey = GlobalKey<FormBuilderState>();
  File _image;
  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.bookObject != null) {
      titleCon.text = widget.bookObject.title;
      authorCon.text = widget.bookObject.author;
      priceCon.text = widget.bookObject.price.toString();
    } else {
      titleCon.text = "";
      authorCon.text = "";
      priceCon.text = "";
    }
  }

  /// Variables
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title:
            widget.bookObject == null ? Text("Upload Book") : Text("Edit Book"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 32,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  _showPicker(context);
                },
                child: CircleAvatar(
                  radius: 85,
                  backgroundColor: Colors.transparent,
                  child: _image != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.file(
                            _image,
                            width: 200,
                            height: 200,
                            fit: BoxFit.fill,
                          ),
                        )
                      : Container(
                          color: Colors.transparent,
                          height: 100,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(50)),
                            width: 100,
                            height: 100,
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  TextField(
                    controller: titleCon,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a book title'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: authorCon,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter book author'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: priceCon,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Enter price'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    //controller: priceCon,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Enter Publisher'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                          color: Colors.black54,
                          style: BorderStyle.solid,
                          width: 0.80),
                    ),
                    child: DropdownButton(
                      hint: Text("Condition"),
                      items: conditonsList
                          .map((value) => DropdownMenuItem(
                                child: Text(value),
                                value: value,
                              ))
                          .toList(),
                      onChanged: (String value) {
                        setState(() {
                          conditionSelected = value;
                        });
                      },
                      isExpanded: true,
                      value: conditionSelected,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                          color: Colors.black54,
                          style: BorderStyle.solid,
                          width: 0.80),
                    ),
                    child: DropdownButton(
                      hint: Text("Board"),
                      items: boardList
                          .map((value) => DropdownMenuItem(
                                child: Text(value),
                                value: value,
                              ))
                          .toList(),
                      onChanged: (String value) {
                        setState(() {
                          boardSelected = value;
                        });
                      },
                      isExpanded: true,
                      value: boardSelected,
                    ),
                  ),SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                          color: Colors.black54,
                          style: BorderStyle.solid,
                          width: 0.80),
                    ),
                    child: DropdownButton(
                      hint: Text("Board"),
                      items: schoolList
                          .map((value) => DropdownMenuItem(
                                child: Text(value),
                                value: value,
                              ))
                          .toList(),
                      onChanged: (String value) {
                        setState(() {
                          schoolSelected = value;
                        });
                      },
                      isExpanded: true,
                      value: schoolSelected,
                    ),
                  ),
                 SizedBox(
                    height: 15,
                  ),
                  TextField(
                    //controller: priceCon,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Enter Class'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: desCon,
                    maxLines: 10,
                    maxLength: 1000,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Description'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FlatButton(
        color: Colors.green,
        shape: StadiumBorder(),
        child: Container(
            child: widget.bookObject == null
                ? Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  )
                : Text("Update", style: TextStyle(color: Colors.white))),
        onPressed: () {},
      ),
    );
  }
}
