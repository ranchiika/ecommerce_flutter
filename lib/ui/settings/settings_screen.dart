import 'package:e_commerce/consts.dart';
import 'package:e_commerce/state-management/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingBeneran extends StatelessWidget {
  const SettingBeneran({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Account & Settings",
            style: TextStyle(fontWeight: FontWeight.bold,
            color: themeProvider.isDarkTheme ? Colors.white : Colors.black),
          ),
          actions: [
          IconButton(
            onPressed: (){
             themeProvider.toggleTheme(!themeProvider.isDarkTheme);
            }, 
            icon: Icon(themeProvider.isDarkTheme ? Icons.dark_mode : Icons.light_mode, 
            color: themeProvider.isDarkTheme ? Colors.amber : Colors.grey,
            )
          )
        ],
          // backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body:  Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Account",
                style: TextStyle(
                    fontSize: 23,
                    color: themeProvider.isDarkTheme ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold),   
              ),
              SizedBox(
                height: 25,
              ),
              AccountSettings(
                  icon: Icons.notifications_active_outlined,
                  text: "Notification Settings",
                  color: themeProvider.isDarkTheme ? Colors.white : Colors.black,),
              AccountSettings(
                  icon: Icons.shopping_cart_outlined,
                  text: "Shopping Address",
                  color: themeProvider.isDarkTheme ? Colors.white : Colors.black,),
              AccountSettings(
                  icon: Icons.payment_rounded, text: "Payment Info",
                  color: themeProvider.isDarkTheme ? Colors.white : Colors.black,),
              AccountSettings(
                  icon: Icons.delete_outline_rounded, text: "Delete Account",
                  color: themeProvider.isDarkTheme ? Colors.white : Colors.black,),
              SizedBox(
                height: 40,
              ),
              Text(
                "App Settings",
                style: TextStyle(
                    fontSize: 23,
                    color: themeProvider.isDarkTheme ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold),),
              SizedBox(height: 25,),
              AppSet(
                text: "Enable Push Notifications",
              ),
            ],
          ),
        ));
  }
}

class AppSet extends StatefulWidget {
  final String text;
  const AppSet({
    super.key,
    required this.text,
  });

  @override
  State<AppSet> createState() => _AppSetState();
}

class _AppSetState extends State<AppSet> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.text,
              style: const TextStyle(fontSize: 20, color: textColor),
            ),
            const Spacer(),
            Switch(
              value: light,
              activeColor: primaryColor,
              onChanged: (bool value) {
                setState(() {
                  light = value;
                });
              },
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          color: Color(0xFFE9EDEF),
          thickness: 1,
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

class AccountSettings extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const AccountSettings({
    super.key,
    required this.icon,
    required this.text,
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Icon(
            icon,
            color: color,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 20, color: textColor),
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            color: color,
          )
        ]),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          color: Color(0xFFE9EDEF),
          thickness: 1,
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}