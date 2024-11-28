import 'package:e_commerce/consts.dart';
import 'package:e_commerce/state-management/theme_provider.dart';
import 'package:e_commerce/ui/auth/register_screen.dart';
import 'package:e_commerce/ui/home/catalogue_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  // const LoginPage({super.key});

  final _formKey = GlobalKey<FormState>(); //Global key bekerja [form key cuman nama]
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController(); //untuk menghandle edita

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey, //key itu gak mandatory.
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/login.png"),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder()
                  ),
                  validator: (value){
                    if (value == null || value.isEmpty) { //kalo password kosoing
                      return "Email is Required"; //nnti keluar ini
                    }
                    if (!value.endsWith("@gmail.com")) {
                      return "Please fill with @gmail.com";
                    }
                    return null; //kalo udah di masukin emailnya, nnti ngirim datanya null
                  },
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true, //buat password bintang-bintang
                  decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                    ),
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
                  onPressed: (){
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                        context, 
                        MaterialPageRoute(builder: (context) => const CatalogueScreen())
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
                  child:  const Text("LOGIN", 
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
      
                    color: Colors.white,
                    
                  ),
                ),
                ),
                const SizedBox(height: 10,),
                TextButton(
                  onPressed: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context)  => RegisterPage())
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have Account?",
                      style: TextStyle(color: themeProvider.isDarkTheme ? Colors.white : textColor),
                      children: [
                        TextSpan(
                          text: " Register now",
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