import 'package:e_commerce/consts.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    super.key, required this.text, required this.image,
  });
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          'JACK WOLFSKIN',
          style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: getProportionateScreenWidth(36.0)),
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            ),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Image.asset(image),
          )
      ],
    );
  }
}

// Shift + Option + O = Buat ngilangin import yang gak di pake.