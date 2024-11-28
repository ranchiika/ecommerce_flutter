import 'package:flutter/material.dart';

// Triggeingnya adalah "Add to cart icon".

class CartItem{
  final String id;
  final String title;
  final int price;
  final String image;
  int quantity;

  CartItem({required this.id, required this.title, required this.price, required this.image, this.quantity = 1});
}

// to knowing whats he difference between OOP dan FP (Functional Programming).
class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _items = {}; //setter (Dibuat bisa untuk banyak getter.)
  Map<String, CartItem> get items => _items; //getter 1 (Kalo dia beda nnti mixmatch)

  int get itemCount => _items.length; //getter 2

  Map<String, int> _quantities = {};

  // Fungsinya untuk handle perhitungan jumlah total harga yng ada di keranjang.
  int get totalPrice {
    return _items.values.fold(
      // initial status sebelum operasi arritmatika dilakukan.
      0, //zero is a default value.
      (sum, item) => sum + item.price * item.quantity
    );
  }

  void updateQuantity(String productId, int quantity){
    _quantities [productId] = quantity; //untuk update quantity berdasarkan poduct id
    notifyListeners();
  }

  void addItem(String id, String title, int price, String image, int quantity){
    // kalau items product ada di dalam keranjang dia tinggal ngelakuin decrement
    if (_items.containsKey(id)) {
      _items[id]!.quantity += quantity;
    } else {
      _items[id] = CartItem(id: id, title: title, price: price, image: image, quantity: quantity);
    }
    notifyListeners();
  }

  void removeItems(String id){
    if (_items.containsKey(id)) {
      // Kurang kuantitas item
      _items[id]!.quantity--;
      
      // Jika Kuantitas menjadi 0, maka hapus item dari keranjang
      if (_items[id]!.quantity <= 0) {
        _items.remove(id);
      }
    }
    notifyListeners();
  }
}