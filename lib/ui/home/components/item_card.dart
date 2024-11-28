//item itu untuk mendefinidiksn bagaiman asebuah objek akan terjadi
//menjadikan semua object reusable

import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/state-management/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemsCard extends StatelessWidget {
  const ItemsCard({super.key, required this.product, required this.press});

  final Product product;
  final VoidCallback press; //mengasih sebuah feed back ke user

  //mvvm adalah model view-view model
  //model itu detail data
  //item itu untuk mendefinidiksn bagaiman sebuah objek akan terjadi
  //menjadikan semua object reusable
  //ui sama view sama

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: product.color,
                borderRadius: BorderRadius.circular(16)
              ),
              child: Stack(
                children: [
                  Hero( //efek trasisi keren ke detail page (animasi transisi antar layar)
                    tag: "${product.id}", // untuk mendefinisikan tiap product, buat ambil id
                    child: Image.asset(product.image) // ini buat isian nya
                  ),
                  Container(
                  padding: const EdgeInsets.all(6), // Padding untuk ikon
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7), // Latar belakang dengan opasitas
                          shape: BoxShape.circle, 
                ),
                 child: const Icon(
                          Icons.favorite_border, 
                          color: secondaryColor, 
                          size: 20,
                        ),
                ),
                ],
              ),
            ),
          ),

          Text(
            product.title,
            style: TextStyle(color: themeProvider.isDarkTheme ? Colors.white : textColor),
          ),
          Text(
            "Rp ${product.price}",
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
}