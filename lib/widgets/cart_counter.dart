import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartCounter extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  // Initialize onIncrement and onDecrement
  const CartCounter({
    Key? key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: onIncrement,
        ),
        Text(quantity.toString()),
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: onDecrement,
        ),
      ],
    );
  }
}
