import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/ui/detail/detail_screen.dart';
import 'package:e_commerce/ui/home/components/cetegories.dart';
import 'package:e_commerce/ui/home/components/item_card.dart';
import 'package:flutter/material.dart';
class CatalogueScreen extends StatelessWidget {
  const CatalogueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, //app bar yang ada iconya.
        backgroundColor: Colors.white,
        elevation: 0, //itu buat z cordinate buat menghilangkan effect batyangan. (Elevation = bayangan)
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.search)
          ),
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.shopping_cart_outlined)
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start, //biar melawan arah default
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Text(
              "JACK WOLFSKIN",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36
              ),
            ),
          ),
          const Cetegories(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: GridView.builder( //nampilin list berbentuk column dan list
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount( //mengatur tata letak grid. ngebungkus widget biasa biar bisa di tempatin dalam custom scroll view dia itu lebih banyak opsi dari pada sliver
                  crossAxisCount: 2, //biar ada 2.
                  mainAxisSpacing: defaultPadding, 
                  crossAxisSpacing: defaultPadding,
                  childAspectRatio: 0.75 //buat perbandingan tinggi 
                ),
                itemCount: product.length, // biar nampilin sesuai data yang ada di model product.
                itemBuilder: (context, index) => ItemsCard( 
                  product: product[index],
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute( //biar pindah halaman?
                      builder: (context) => DetailScreen(product: product[index])
                    )
                  )
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}