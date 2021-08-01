import 'package:bookshop/entities/bookmodel.dart';

class Shop {
  String shopname;
  String ownername;
  String imageUrl;
  String ownerNumber;
  String address;
  List<Book> shopBooks;

  Shop(
      {this.shopname,
      this.ownername,
      this.ownerNumber,
      this.shopBooks,
      this.address,
      this.imageUrl});
}

List<Shop> allshops = [
  Shop(
      shopname: "XI Course",
      imageUrl: 'assets/Group 13.png',
      ownername: "XYZ",
      address: "Address",
      ownerNumber: "033XXXXXX",
      shopBooks: book),
  Shop(
      shopname: "XI Course",
      imageUrl: 'assets/Group 13.png',
      ownername: "XYZ",
      ownerNumber: "033XXXXXX",
       address: "Address",
      shopBooks: book),
  Shop(
      shopname: "XI Course",
      imageUrl: 'assets/Group 13.png',
      ownername: "XYZ",
      ownerNumber: "033XXXXXX",
       address: "Address",
      shopBooks: book),
];
