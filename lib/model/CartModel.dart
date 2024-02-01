class CartModel {
  Map<String, int> _items = {};

  Map<String, int> get items => _items;

  void addItem(String name, int quantity) {
    if (_items.containsKey(name)) {
      _items[name] = _items[name]! + quantity;
    } else {
      _items[name] = quantity;
    }
  }

  void removeItem(String name) {
    _items.remove(name);
  }

  void updateQuantity(String name, int quantity) {
    if (_items.containsKey(name)) {
      _items[name] = quantity;
    }
  }

  int getTotalItems() {
    return _items.values.fold(0, (sum, quantity) => sum + quantity);
  }
}
