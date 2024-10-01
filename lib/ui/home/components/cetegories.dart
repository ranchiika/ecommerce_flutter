import 'package:e_commerce/consts.dart';
import 'package:flutter/material.dart';

class Cetegories extends StatefulWidget {
  const Cetegories({super.key});

  @override
  State<Cetegories> createState() => _CetegoriesState();
}

class _CetegoriesState extends State<Cetegories> { 
  int selectedIndex = 0; //buat ngasih tau perubahan index yang sedang di pilih (Kayak current page.)
  List<String> categories = [ //buat data2 nama2 categories product.
    "Women",
    "Men",
    "Kid",
    "Tools"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding), //buat list dulu pokoknya dah ya..
      child: SizedBox(
        height: 25,
        child: ListView.builder( //buat ngecreat horizontal
          scrollDirection: Axis.horizontal, //buat ngasih tau scrollnya 
          itemCount: categories.length,
          // item builder itu buat menampung atau membangun data yang akan ditampilkan di UI.
          itemBuilder: (context, index) => _buildCategory(index),
        ),
      ),
    );
  }

  GestureDetector _buildCategory(int index) { //buat menyesuaikan dengan device nya. (Biar pake pen juga bisa.)
    return GestureDetector(
        onTap: () {
          setState(() { //buat nampilin perubahan.
            selectedIndex = index; 
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            children: [
              Text(
                categories[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selectedIndex == index ? primaryColor : secondaryColor,
                )
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 3
                ),
                height: 2,
                width: 30,
                color: selectedIndex == index ? primaryColor : secondaryColor,
              )
            ],
          ),
        ),
      );
  }
}