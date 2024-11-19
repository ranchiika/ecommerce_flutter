import 'package:e_commerce/consts.dart';
import 'package:flutter/material.dart';

class Cetegories extends StatefulWidget {
  const Cetegories({super.key});

  @override
  State<Cetegories> createState() => _CetegoriesState();
}

class _CetegoriesState extends State<Cetegories> {
  int selectedIndex = 0;
  List<String> categories = [
    "Women",
    "Men",
    "Kid",
    "Tools"
  ];

  List<IconData> categorieIcon =[
    Icons.woman,
    Icons.man,
    Icons.child_care,
    Icons.nature
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding),
      child: SizedBox(
        height: 50, // buat bagian height nya biar si listview tinggi
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => _buildCategory(index),
        ),
      ),
    );
  }

  GestureDetector _buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Biar item di tengah
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // nambahin padding si cetegories
              decoration: BoxDecoration(
                color: selectedIndex == index ? primaryColor : Colors.transparent,// Background color saat dipilih
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: primaryColor) // Membuat background melengkung
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Icon(
                      categorieIcon[index],
                      color: selectedIndex == index ? Colors.white : secondaryColor,
                    ),
                  ),
                  Text(
                    categories[index],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: selectedIndex == index ? Colors.white : secondaryColor, // Ubah warna teks saat dipilih
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
