import 'dart:collection';

class CartRepository {
  final Map<String, int> _items = {};
  final List<CartItem> _cartItems = [];

  UnmodifiableMapView<String, int> get items => UnmodifiableMapView(_items);
  UnmodifiableListView<CartItem> get cartItems => UnmodifiableListView(_cartItems);

  int getTotalItems() {
    return _items.values.fold(0, (sum, quantity) => sum + quantity);
  }

  void addItem(String name, int quantity, double price) {
    if (_items.containsKey(name)) {
      _items[name] = _items[name]! + quantity;
    } else {
      _items[name] = quantity;
    }

    _cartItems.add(CartItem(name: name, quantity: quantity, price: price));
  }

  void removeItem(String name) {
    if (_items.containsKey(name)) {
      _items[name] = _items[name]! - 1;

      if (_items[name] == 0) {
        _items.remove(name);
        _cartItems.removeWhere((item) => item.name == name);
      }
    }
  }
}

class CartItem {
  final String name;
  final int quantity;
  final double price;

  CartItem({
    required this.name,
    required this.quantity,
    required this.price,
  });
}
