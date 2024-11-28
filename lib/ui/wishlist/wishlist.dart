import 'package:e_commerce/consts.dart';
import 'package:e_commerce/state-management/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Wishlist"),
      ),
      body: wishlistProvider.wishlistItem.isEmpty
      ? const Center(
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.heart_broken_sharp,
            color: Color.fromARGB(255, 167, 167, 167),
            size: 100),
            Text("Nothing wishlist",
            style: TextStyle(
              fontSize: 20
            ),),
          ],
        ),
      )
      
      : ListView.builder(
        itemCount: wishlistProvider.wishlistItem.length,
        itemBuilder: (context, index) {
          final wishlistItem = wishlistProvider.wishlistItem.values.toList()[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(wishlistItem.image),
              ),
              title: Text(wishlistItem.title),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: (){
                  wishlistProvider.removeItemFromFav(wishlistItem.id);
                },
              ),
            ),
          );
        }
      )
    );
  }
}