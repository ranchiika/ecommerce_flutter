import 'package:e_commerce/consts.dart';
import 'package:e_commerce/state-management/cart_provider.dart';
import 'package:e_commerce/state-management/theme_provider.dart';
import 'package:e_commerce/state-management/wishlist_provider.dart';
import 'package:e_commerce/ui/auth/login_screen.dart';
import 'package:e_commerce/ui/auth/register_screen.dart';
import 'package:e_commerce/ui/home/catalogue_screen.dart';
import 'package:e_commerce/ui/settings/settings_screen.dart';
import 'package:e_commerce/ui/splash/splash_screen.dart';
import 'package:e_commerce/ui/wishlist/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => WishlistProvider()),
      ],
      child: const FloShop()
    )
  );
}

class FloShop extends StatefulWidget {
  const FloShop({super.key});

  @override
  State<FloShop> createState() => _FloShopState();
}

class _FloShopState extends State<FloShop> {

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) { 
        return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Jack Wolfskin', //Mendefinisikan nama aplikasinya
        theme: ThemeData(
          brightness: themeProvider.isDarkTheme ? Brightness.dark : Brightness.light,
          scaffoldBackgroundColor:  themeProvider.isDarkTheme ? Colors.black : Colors.white,
          fontFamily: 'Muli',
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: textColor),
            bodySmall: TextStyle(color: textColor)
          )
        ),
        initialRoute: "/",
        routes: {
          '/': (context) => SplashScreen(),
          '/login': (context) => LoginPage(),
          '/register': (context) => RegisterPage(),
          '/catalogue': (context) => CatalogueScreen(),
          '/wishlist': (context) => WishlistScreen(),
          '/settings': (context) => SettingBeneran()
        },
        //home: const SplashScreen(),
        );
      },
    );
  }
}