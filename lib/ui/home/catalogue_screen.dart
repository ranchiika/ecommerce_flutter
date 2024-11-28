import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/state-management/theme_provider.dart';
import 'package:e_commerce/ui/cart/cart_screen.dart';
import 'package:e_commerce/ui/detail/detail_screen.dart';
import 'package:e_commerce/ui/home/components/bottom_nav_bar.dart';
import 'package:e_commerce/ui/home/components/carousel.dart';
import 'package:e_commerce/ui/home/components/cetegories.dart';
import 'package:e_commerce/ui/home/components/item_card.dart';
import 'package:e_commerce/ui/profiles/profile_screen.dart';
import 'package:e_commerce/ui/settings/settings_screen.dart';
import 'package:e_commerce/ui/wishlist/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CatalogueScreen extends StatefulWidget {
  const CatalogueScreen({super.key});

  @override
  State<CatalogueScreen> createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const CatalogueScreen(),
    const WishlistScreen(),
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
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: themeProvider.isDarkTheme ? Colors.black : Colors.white,
        elevation: 0,
        title: Text("Jack Wolfskin"),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> CartScreen()));
                },
                icon: const Icon(Icons.shopping_cart_outlined),
              ),
              IconButton(
                    onPressed: () {
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context)=> WishlistScreen()));
                    },
                    icon: const Icon(Icons.favorite_border),
                  ),
            ],
          ),
        ],
      ),
      body: _selectedIndex == 0
      ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding( //searchbar
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: TextField( //TextField itu gunanya untuk membuat search bar.
              decoration: InputDecoration(
                // focusedBorder: ,
                hintText: 'Search products...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),

          Center(
            child: SimpleCarousel(
              imageUrls: [
                "assets/images/header1.png",
                "assets/images/header2.png",
                "assets/images/header3.png",
              ],
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
