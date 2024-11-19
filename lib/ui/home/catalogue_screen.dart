import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/ui/detail/detail_screen.dart';
import 'package:e_commerce/ui/home/components/bottom_nav_bar.dart';
import 'package:e_commerce/ui/home/components/cetegories.dart';
import 'package:e_commerce/ui/home/components/item_card.dart';
import 'package:e_commerce/ui/profiles/profile_screen.dart';
import 'package:e_commerce/ui/settings/settings_screen.dart';
import 'package:e_commerce/ui/wishlist/wishlist.dart';
import 'package:flutter/material.dart';
class CatalogueScreen extends StatefulWidget {
  const CatalogueScreen({super.key});

  @override
  State<CatalogueScreen> createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const CatalogueScreen(),
    const FavouritePage(),
    const SettingBeneran(),
    const ProfileScreen()
  ];

  void _onItemTapped(int index){ //klo itemnya di tap
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          // IconButton(
          //   onPressed: (){},
          //   icon: const Icon(Icons.search),
          // ),
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: _selectedIndex == 0
      ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding( //Text Jack wolfskin nya
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Text(
              "JACK WOLFSKIN",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          Padding( //searchbar
            padding: const EdgeInsets.all(20),
            child: TextField( //TextField itu gunanya untuk membuat search bar.
              decoration: InputDecoration(
                // focusedBorder: ,
                hintText: 'Search products...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),

          const Cetegories(), //kategori list view.
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: defaultPadding,
                  crossAxisSpacing: defaultPadding,
                  childAspectRatio: 0.75,
                ),
                itemCount: product.length,
                itemBuilder: (context, index) => ItemsCard(
                  product: product[index],
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(product: product[index]),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ):
      _widgetOptions [_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped
      ),
    );
  }
}
