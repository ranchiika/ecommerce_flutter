import 'package:e_commerce/consts.dart';
import 'package:e_commerce/state-management/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton( //body app bar itu leading, Leading digunakan untuk app.. Sesuatu widge yang dimasukkan ke app bar pake nya leading
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: const AssetImage('assets/images/profile_1.png'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'Chika Maharani',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: themeProvider.isDarkTheme ? Colors.white : textColor
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Full Name',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: themeProvider.isDarkTheme ? Colors.white : textColor
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                style: TextStyle(
                  color: themeProvider.isDarkTheme ? Colors.white : textColor
                ),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Chika Maharani',
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Email Address',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: themeProvider.isDarkTheme ? Colors.white : textColor
                ),
              ),
              const SizedBox(height: 8),
               TextField(
                style: TextStyle(
                  color: themeProvider.isDarkTheme ? Colors.white : textColor
                ),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'chika@gmail.com',
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Phone Number',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: themeProvider.isDarkTheme ? Colors.white : textColor
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                style: TextStyle(
                  color: themeProvider.isDarkTheme ? Colors.white : textColor
                ),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '08123456789',
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                      Fluttertoast.showToast(
                        msg: "Change saved",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM, 
                        backgroundColor: const Color.fromARGB(255, 195, 192, 192),
                        textColor: Colors.black
                      );
                  }, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)
                    ),
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold
                    )
                    
                  ),
                  child:  const Text("Save Change", 
                  style: TextStyle(
                    fontWeight: FontWeight.bold,

                    color: Colors.white,
                    
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}