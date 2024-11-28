import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/state-management/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({super.key, required this.product, required this.quantity});

  final Product product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: defaultPadding),
            height: 50,
            width: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: product.color)
            ),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart_outlined),
              onPressed: (){
                cartProvider.addItem( //add item ini menyambungkan ke quantity add to cart.
                  product.id.toString(),
                  product.title,
                  product.price,
                  product.image,
                  quantity
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Successfuly add ${product.title} to cart"),
                    duration: Duration(seconds: 2),
                  )
                );
              },
            ),
          ),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: product.color,
                maximumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)
                )
              ),
              onPressed: (){
                int quantity = 1;

                cartProvider.addItem(
                  product.id.toString(),
                  product.title,
                  product.price,
                  product.image,
                  quantity
                );
                 ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${product.title} is purchased"),
                    duration: const Duration(seconds: 2),
                  )
                );
              },
              child: const Text(
                "BUY NOW",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              )
            ),
          )
        ],
      ),
    );
  }
}