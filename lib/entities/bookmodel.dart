class Book {
  int bookId;
  String imageUrl;
  String title;
  String author;
  int price;
  String description;
  String publisher;
  String board;
  String school;
  String schoolclass;
  String condition;


  Book({
    this.imageUrl,
    this.title,
    this.author,
    this.price,
this.description,
this.publisher,
this.board,
this.school,
this.schoolclass,
this.condition
  });
}

final List<Book> book = [
  Book(
      imageUrl: 'assets/Fatherhood.png',
      title: 'FatherHood',
      author: 'Marcus Berkmann',
      price: 400,
      description: "This is Description",
      publisher: "Oxworld",
      board: "Fedral",
      school: "Army public school",
      schoolclass: "XI"
      ,condition: "New"
      ),
  Book(
      imageUrl: 'assets/How To Be The Best In Time And Space.png',
      title: 'The Time Travellers',
      author: 'Stride Lottie',price: 400,description: "This is Description",
      publisher: "Oxworld",
      board: "Fedral",
      school: "Army public school",
      schoolclass: "XI"
      ,condition: "New"),
  Book(
      imageUrl: 'assets/The Zoo.png',
      title: 'The Zoo',
      author: 'Christopher Wilson',price: 400,description: "This is Description",
      publisher: "Oxworld",
      board: "Fedral",
      school: "Army public school",
      schoolclass: "XI"
      ,condition: "New"),
  Book(
      imageUrl: 'assets/In A Land Of Paper Gods.png',
      title: 'Land Of Paper Gods',
      author: 'Rebecca Mackenzie',price: 400,description: "This is Description",
      publisher: "Oxworld",
      board: "Fedral",
      school: "Army public school",
      schoolclass: "XI"
      ,condition: "New"),
  Book(
      imageUrl: 'assets/Tattletale.png',
      title: 'Tattletale',
      author: 'Sarah J.',price: 400,description: "This is Description",
      publisher: "Oxworld",
      board: "Fedral",
      school: "Army public school",
      schoolclass: "XI"
      ,condition: "New"),
  Book(
      imageUrl: 'assets/The Fatal Tree.png',
      title: 'The Fatal Tree',
      author: 'Jake Amott',price: 400,description: "This is Description",
      publisher: "Oxworld",
      board: "Fedral",
      school: "Army public school",
      schoolclass: "XI"
      ,condition: "New"),
  Book(imageUrl: 'assets/Day Four.png', title: 'Day Four', author: 'Sarah',price: 400,description: "This is Description",
      publisher: "Oxworld",
      board: "Fedral",
      school: "Army public school",
      schoolclass: "XI"
      ,condition: "New"),
  Book(
      imageUrl: 'assets/D2D.png',
      title: 'Door To Door',
      author: 'Edward Humes',price: 400,description: "This is Description",
      publisher: "Oxworld",
      board: "Fedral",
      school: "Army public school",
      schoolclass: "XI"
      ,condition: "New"),
];


List<Book> mycart=[];