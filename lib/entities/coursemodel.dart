import 'package:bookshop/entities/bookmodel.dart';

class Course {
  int courseId;
  String imageUrl;
  String courseName;
  int price;
  String board;
  String school;
  String schoolclass;
  String condition;
  List<Book> courseBooks = [];

  Course(
      {this.courseName,
      this.imageUrl,
      this.price,
      this.board,
      this.courseBooks});
}

List<Course> allcourses = [
  Course(
      courseName: "XI Course",
      imageUrl: 'assets/Group 13.png',
      price: 1000,
      board: "Fedral",
      courseBooks: book),
  Course(
      courseName: "XI Course",
      imageUrl: 'assets/Group 13.png',
      price: 1000,
      board: "Sindh",
      courseBooks: book),
  Course(
      courseName: "XI Course",
      imageUrl: 'assets/Group 13.png',
      price: 1000,
      board: "Punjab",
      courseBooks: book)
];
