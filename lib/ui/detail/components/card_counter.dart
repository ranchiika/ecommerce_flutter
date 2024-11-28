import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/state-management/cart_provider.dart';
import 'package:e_commerce/state-management/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartCounter extends StatefulWidget {
  final Product product;
  final Function(int) onQuantityChanged; //variable dalam variable nama variable nya onQuantityChanged yang akan di kirim ke add to cart

  const CartCounter({super.key, required this.product, required this.onQuantityChanged});

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    // inisialisasi provider
    final cartProvider = Provider.of<CartProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Row(
      children: <Widget>[
        // logika untuk tombol decrement 
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(25, 25),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ),
          child: const Icon(Icons.remove),
          onPressed: quantity > 1
          ? (){
            setState(() {
              // ini akan mengurangi quantity secara lokal.
              quantity--;
              });
              cartProvider.removeItems(widget.product.id.toString());
            // untuk mengirim quantity tebaru.
            // widget.onQuantityChanged(quantity);
          
          }
          // null ini akan disable tombol jika quantitas kurang / = 1
          : null
        ),
        const SizedBox(width: defaultPadding,),
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(
            quantity.toString().padLeft(2, "0"),
            style: TextStyle(fontSize: 18, 
            color: themeProvider.isDarkTheme ? Colors.white : textColor,
          ),
          ),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(25, 25),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ),
          child: const Icon(Icons.add),
          onPressed: (){
            setState(() {
              // Untuk menambahkan quantitas secara lokal
              quantity++;
            });
            // pendeklarasian informasi yang akan dirkirim ke addtocart atau tombol keranjang.
            // ini starting point dimana quanttitas akan di bawa oleh tombol keranjang ke halaman keranjang.
            cartProvider.addItem(
            widget.product.id.toString(),
            widget.product.title,
            widget.product.price,
            widget.product.image,
            1
           );
          },
        )
      ],
    );
  }
}