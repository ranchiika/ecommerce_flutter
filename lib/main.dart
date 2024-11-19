import 'dart:ffi';
import 'package:e_commerce/consts.dart';
import 'package:e_commerce/state-management/theme_provider.dart';
import 'package:e_commerce/ui/auth/login_screen.dart';
import 'package:e_commerce/ui/auth/register_screen.dart';
import 'package:e_commerce/ui/home/catalogue_screen.dart';
import 'package:e_commerce/ui/settings/settings_screen.dart';
import 'package:e_commerce/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      //PLace holder untuk thme provider yang belum terdefinisi.
      create: (_) => ThemeProvider(),
      child: const FloShop(),
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
          '/': (context) => LoginPage(),
          '/login': (context) => LoginPage(),
          '/register': (context) => RegisterPage(),
          '/catalogue': (context) => CatalogueScreen(),
          '/settings': (context) => SettingBeneran()
        },
        //home: const SplashScreen(),
        );
      },
    );
  }
}