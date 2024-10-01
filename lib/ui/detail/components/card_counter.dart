import 'package:e_commerce/consts.dart';
import 'package:flutter/material.dart';

class CardCounter extends StatefulWidget {
  const CardCounter({super.key});

  @override
  State<CardCounter> createState() => _CardCounterState();
}

class _CardCounterState extends State<CardCounter> {
  int numOfItems = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        OutlinedButton(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(35, 35),
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          )
        ),
        onPressed: (){
          setState(() {
            if (numOfItems > 1) {
              setState(() {
                numOfItems--;
              });
            }
          });
        }, //dummy function itu dikosongin "(){}".
        child: const Icon(Icons.remove)
        ),
         const SizedBox(width: defaultPadding,),
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(
            numOfItems.toString().padLeft(2, '0'),
            style: const TextStyle(
              fontSize: 18,
              color: textColor
            ),
          ),
        ),
        const SizedBox(width: defaultPadding),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(35, 35),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          )
          ),
          onPressed: (){
            setState(() {
              numOfItems++;
            });
          },
          child: const Icon(Icons.add)
        ),
      ],
    );
  }
}