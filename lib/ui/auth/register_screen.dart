import 'package:e_commerce/consts.dart';
import 'package:e_commerce/state-management/theme_provider.dart';
import 'package:e_commerce/ui/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  //const LoginPage({super.key});

  final _formKey = GlobalKey<FormState>(); 
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/signup.png"),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: "Email*",
                    border: OutlineInputBorder()
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }
                    if (!value.endsWith("@gmail.com")) {
                      return "Please fill with @gmail.com";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password*",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // if the validation success, it will showed the toast
                      Fluttertoast.showToast(
                        msg: "Register Success",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM, 
                        backgroundColor: const Color.fromARGB(255, 195, 192, 192),
                        textColor: Colors.black
                      );
        
                      Navigator.pushReplacement(
                        context, 
                        MaterialPageRoute(builder: (context) => LoginPage())
                      );
                    }
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
                  child:  const Text("SIGN UP", 
                  style: TextStyle(
                    fontWeight: FontWeight.bold,

                    color: Colors.white,
                    
                  ),
                ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => LoginPage())
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Already have account?",
                      style: TextStyle(color: themeProvider.isDarkTheme ? Colors.white : textColor),
                      children: [
                        TextSpan(
                          text: " Log in",
                          style: TextStyle(color: themeProvider.isDarkTheme ? Colors.white : textColor, fontWeight: FontWeight.bold)
                        )
                      ]
                    ),
                  )
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}