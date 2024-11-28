import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/state-management/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColorAndSize extends StatelessWidget {
  const ColorAndSize({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Color", style: TextStyle(
                color: themeProvider.isDarkTheme ? Colors.white : textColor,
              ),),
              Row(
                children: [
                  ColorPicker(
                    color: Color(0xFFD94A53),
                    isSelected: true,
                  ),
                  ColorPicker(
                    color: Color(0xFF9A82A8),
                    isSelected: true,
                  ),
                  ColorPicker(
                    color: Color(0xFF989493),
                    isSelected: true,
                  ),
                  ColorPicker(
                    color: Color(0xFF9F6466),
                    isSelected: true,
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
          // Menambahkan Column di sini tanpa menghapus RichText
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Size",
                style: TextStyle(color: themeProvider.isDarkTheme ? Colors.white : textColor,),
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(color: themeProvider.isDarkTheme ? Colors.white : textColor,),
                  children: [
                    TextSpan(
                      text: '${product.size} CM',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ColorPicker extends StatelessWidget {
  const ColorPicker({super.key, required this.color, required this.isSelected});

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: defaultPadding, right: defaultPadding),
      padding: const EdgeInsets.all(2.5),
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: isSelected ? color : Colors.transparent),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
