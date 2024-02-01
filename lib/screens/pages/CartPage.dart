import 'package:flutter/material.dart';
import '../../model/CartModel.dart';
import '../components/cart_counter.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartModel _cartModel = CartModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Cart Items: ${_cartModel.getTotalItems()}'),
            CartCounter(
              quantity: _cartModel.items['name']?.toString() ?? '0', onIncrement: () {  },
            ),
          ],
        ),
      ),
    );
  }
}
