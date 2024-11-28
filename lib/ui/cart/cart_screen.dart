import 'package:e_commerce/consts.dart';
import 'package:e_commerce/state-management/cart_provider.dart';
import 'package:e_commerce/ui/home/catalogue_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider= Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      // ternary operator itu sama kayak 1 line of if else
      body: cartProvider.items.isEmpty 
      ? const Center(
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.remove_shopping_cart_outlined,
            color: Color.fromARGB(255, 167, 167, 167),
            size: 100),
            Text("Nothing any cart",
            style: TextStyle(
              fontSize: 20
            ),),
          ],
        ),
      )
      : ListView.builder(
        itemCount: cartProvider.items.length,
        itemBuilder: (context, index){
          final cartItem = cartProvider.items.values.toList()[index];
          return Card(
            margin: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(cartItem.image),
              ),
              title: Text(cartItem.title),
              subtitle: Text("Quantity : ${cartItem.quantity}"),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: (){cartProvider.removeItems(cartItem.id);},
              ),
            ),
          );
        }
      ),
      bottomNavigationBar: Container(
        padding:  EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total :",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  "${cartProvider.totalPrice}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: primaryColor
                  ),
                ),
              ],
            ),
            ElevatedButton(
                  onPressed: () {
                      Fluttertoast.showToast(
                        msg: "Package arrrived! Woosh...",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM, 
                        backgroundColor: const Color.fromARGB(255, 195, 192, 192),
                        textColor: Colors.black
                      );
                     Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context)  => CatalogueScreen())
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
                  child:  const Text("BUY NOW", 
                  style: TextStyle(
                    fontWeight: FontWeight.bold,

                    color: Colors.white,
                    
                  ),
                ),
              ),
          ],
        ),
      ),
      // ElevatedButton(
      //             onPressed: () {
      //                 Fluttertoast.showToast(
      //                   msg: "Package arrrived! Woosh...",
      //                   toastLength: Toast.LENGTH_SHORT,
      //                   gravity: ToastGravity.BOTTOM, 
      //                   backgroundColor: const Color.fromARGB(255, 195, 192, 192),
      //                   textColor: Colors.black
      //                 );
      //                Navigator.push(
      //                 context, 
      //                 MaterialPageRoute(builder: (context)  => CatalogueScreen())
      //               );
      //             }, 
      //             style: ElevatedButton.styleFrom(
      //               backgroundColor: primaryColor,
      //               minimumSize: const Size(double.infinity, 50),
      //               shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(8.0)
      //               ),
      //               textStyle: const TextStyle(
      //                 fontWeight: FontWeight.bold
      //               )
                    
      //             ),
      //             child:  const Text("BUY NOW", 
      //             style: TextStyle(
      //               fontWeight: FontWeight.bold,

      //               color: Colors.white,
                    
      //             ),
      //           ),
      //         ),
    );
  }
}