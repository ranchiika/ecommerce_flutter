import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/state-management/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavButton extends StatelessWidget { //klo  udah pake state management lebih ramah pake STL.
  const FavButton({super.key, required this.product});

  // INi bentuk dari inisialisasi variable.
  final Product product;

  // Ini bentuk dari deklarasi varriable.
  // final int quantity = 1;

  @override
  Widget build(BuildContext context) {
    // Inisialisasi provider 
    final wishlistProvider = Provider.of<WishlistProvider>(context);

    // untuk memeriksa apakah wishlist provider ad di wishlist.
    final isFavorite = wishlistProvider.wishlistItem.containsKey(product.id.toString());

    return IconButton(
      onPressed: (){
        if (isFavorite) {
          // untuk menghapus item dari wishlist via tombol lovr
          wishlistProvider.removeItemFromFav(product.id.toString());
        } else {
          wishlistProvider.addItemToFav(
          product.id.toString(),
          product.title,
          product.price,
          product.image,
        );
        }
      },
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
        color: isFavorite ? Colors.red : Colors.grey.shade800,
      )
    );
  }
}