import 'package:flutter/material.dart';

class NavigationItem {
  IconData iconData;

  NavigationItem(this.iconData);
}

List<NavigationItem> getNavigationItemList() {
  return <NavigationItem>[
    NavigationItem(Icons.home),
    NavigationItem(Icons.calendar_today),
    NavigationItem(Icons.notifications),
  ];
}

class Car {
  String brand;
  String model;
  String plate_no;
  String oil_type;
  String condition;
  String image;

  Car(this.brand, this.model, this.plate_no, this.condition, this.oil_type,
      this.image);
}

List<Car> getCarList() {
  return <Car>[
    Car("Land Rover", "Discovery", 'M2580', "Perfect", "major",
        'assets/desktop.gif'),
    Car("Alfa Romeo", "C4", 'C3580', 'Need Service', 'Minoir',
        'assets/images/ferrari_spider_488_0.png'),
    Car("Range Rover", "Discovery", 'C3580', 'Perfect', 'Major',
        'assets/images/ferrari_spider_488_0.png'),
  ];
}

class Mechanic {
  String name;
  String address;

  Mechanic(this.name, this.address);
}

List<Mechanic> getMechanicList() {
  return <Mechanic>[
    Mechanic('talha', 'street 12'),
    Mechanic('jawwad', 'street 13'),
    Mechanic('talha', 'street 12'),
    Mechanic('jawwad', 'street 13'),
    Mechanic('talha', 'street 12'),
    Mechanic('jawwad', 'street 13'),
  ];
}

class Dealer {
  String name;
  int devices;
  String image;

  Dealer(this.name, this.devices, this.image);
}

List<Dealer> getDealerList() {
  return <Dealer>[
    Dealer(
      "Concox",
      174,
      "assets/images/hertz.png",
    ),
    Dealer(
      "Teletox",
      126,
      "assets/images/avis.png",
    ),
    Dealer(
      "GoSafe",
      89,
      "assets/images/tesla.jpg",
    ),
  ];
}

class Filter {
  String name;

  Filter(this.name);
}

List<Filter> getFilterList() {
  return <Filter>[
    Filter("Nearest"),
    Filter("All"),
  ];
}
