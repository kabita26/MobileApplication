import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/CartModel.dart';
import '../../viewmodels/cartViewModel.dart';

class CartPage extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String itemQuantity;

  // Add the constructor with named parameters
  const CartPage({
    Key? key,
    required this.itemName,
    required this.itemPrice,
    required this.itemQuantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use context.watch to directly get the CartModel and rebuild the widget when it changes
    CartViewModel cartViewModel = context.watch<CartViewModel>();
    CartModel cartModel=cartViewModel.cartItems;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Cart Items: ${cartModel.getTotalItems()}'),
            Column(
              children: cartModel.items.keys.map((itemName) {
                int quantity = cartModel.getItemQuantity(itemName);
                double totalPrice = cartModel.getItemTotalPrice(itemName).toDouble();

                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('$itemName - Quantity: $quantity'),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              context.read<CartViewModel>().decreaseQuantity(itemName);
                            },
                          ),
                          Text('$quantity'),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              context.read<CartViewModel>().increaseQuantity(itemName);
                            },
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          context.read<CartViewModel>().removeFromCart(itemName);
                        },
                      ),
                    ],
                  ),
                  subtitle: Text('Total Price: \$${totalPrice.toStringAsFixed(2)}'),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      // ... rest of your widget
    );
  }
}
