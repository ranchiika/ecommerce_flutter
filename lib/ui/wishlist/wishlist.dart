import 'package:flutter/material.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Favourite'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          _buildFavouriteItem(
            imageUrl: 'assets/images/jack_1.png',
            title: 'Moonrise 3in1',
            price: '\$21995',
            isBestSeller: true,
            colors: [Colors.yellow, Colors.teal],
          ),
          _buildFavouriteItem(
            imageUrl: 'assets/images/jack_2.png',
            title: 'Kaminfeuer Hooded',
            price: '\$21995',
            isBestSeller: true,
            colors: [Colors.lightBlue, Colors.grey],
          ),
          _buildFavouriteItem(
            imageUrl: 'assets/images/jack_3.png',
            title: 'Eagle peak 2L',
            price: '\$21995',
            isBestSeller: true,
            colors: [Colors.blue, Colors.yellow],
          ),
          _buildFavouriteItem(
            imageUrl: 'assets/images/jack_4.png',
            title: 'Highest Peak 3L',
            price: '\$21995',
            isBestSeller: true,
            colors: [Colors.teal, Colors.blue],
          ),
        ],
      ),
    );
  }

  Widget _buildFavouriteItem({
    required String imageUrl,
    required String title,
    required String price,
    required bool isBestSeller,
    required List<Color> colors,
  }) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network (imageUrl, fit: BoxFit.cover),
              if (isBestSeller)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    color: Colors.red,
                    child: const Text(
                      'BEST SELLER',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              price,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}