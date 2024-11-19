import 'package:e_commerce/ui/auth/register_screen.dart';
import 'package:e_commerce/ui/home/catalogue_screen.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  // const LoginPage({super.key});

  final _formKey = GlobalKey<FormState>(); //Global key bekerja [form key cuman nama]
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController(); //untuk menghandle edita

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, //key itu gak mandatory.
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
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
                  return null; //kalo udah di masukin emailnya, nnti ngirim datanya null
                },
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: _passwordController,
                obscureText: true, //buat password bintang-bintang
                decoration: const InputDecoration(
                  labelText: "Password",
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
                onPressed: (){
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                      context, 
                      MaterialPageRoute(builder: (context) => const CatalogueScreen())
                    );
                  }
                },
                child: const Text("Login"),
              ),
              SizedBox(height: 10,),
              TextButton(
                onPressed: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context)  => RegisterPage())
                  );
                },
                child: Text("Belum punya akun? Daftar sekarang"))
            ],
          )
        ),
      ),
    );
  }
}