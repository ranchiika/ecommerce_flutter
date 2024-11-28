import 'package:flutter/material.dart';

// Ini adalah satu satunya acuan data yang di gunakan
class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;

  Product({
    // this adalah untuk merepresentasikan untuk menandakan bahwa objek hanya bisa diakses oleh kelas terkait
    // atau kelas yang sebelumnya memanggil class product.
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
    required this.color, 
  });
}

List<Product> product =[
  Product(
    id: 1,
    image: "assets/images/jack_1.png",
    title: "Moonrise 3in1",
    price: 21995,
    description: descriptionText,
    size: 12,
    color: const Color(0xFF887784)
  ),
  Product(
    id: 2,
    image: "assets/images/jack_2.png",
    title: "Kaminfeuer Hooded",
    price: 21995,
    description: descriptionText,
    size: 12,
    color: const Color(0xFF9F6466)
  ),
  Product(
    id: 3,
    image: "assets/images/jack_3.png",
    title: "Eagle peak 2L",
    price: 21995,
    description: descriptionText,
    size: 12,
    color: const Color(0xFF9B9C8F)
  ),
  Product(
    id: 4,
    image: "assets/images/jack_4.png",
    title: "Highest Peak 3L",
    price: 21995,
    description: descriptionText,
    size: 12,
    color: const Color(0xFF9A82A8)
  ),
  Product(
    id: 5,
    image: "assets/images/jack_5.png",
    title: "Kammweg 3L",
    price: 21995,
    description: descriptionText,
    size: 12,
    color: const Color.fromARGB(255, 84, 65, 79)
  ),
  Product(
    id: 6,
    image: "assets/images/jack_6.png",
    title: "Alpspitze Down hoody",
    price: 21995,
    description: descriptionText,
    size: 12,
    color: const Color.fromARGB(255, 145, 59, 64)
  ),
];

String descriptionText = "Discover style and comfort with the Jack Wolfskin Women's Jacket, designed specifically for adventurous women. This jacket combines high-tech performance with stylish design, perfect for outdoor activities and everyday wear.";


// Completing the data details