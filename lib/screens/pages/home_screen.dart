// Import statements...

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/productProvider.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ProductProvider _productProvider;
  int _currentIndex = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _productProvider = Provider.of<ProductProvider>(context, listen: false);
      _productProvider.fetchProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skin Care '),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // CarouselSlider code...

          // Products Text
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Products',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),

          // Horizontally displayed products (first set)
          Row(
            children: [
              for (var index = 0; index < 2 && index < _productProvider.productsList.length; index++)
                Flexible(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            imageURL: _productProvider.productsList[index].data().imageURL ?? "",
                            description: _productProvider.productsList[index].data().description ?? "",
                            price: _productProvider.productsList[index].data().price ?? "",
                            name: _productProvider.productsList[index].data().name ?? "",
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      margin: EdgeInsets.only(right: 16),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 100,
                            child: Image.network(
                              _productProvider.productsList[index].data().imageURL ?? "",
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            _productProvider.productsList[index].data().name ?? "",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            '${_productProvider.productsList[index].data().price ?? ""}',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),

          // Horizontally displayed products (second set)
          Row(
            children: [
              for (var index = 2; index < 4 && index < _productProvider.productsList.length; index++)
                Flexible(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            imageURL: _productProvider.productsList[index].data().imageURL ?? "",
                            description: _productProvider.productsList[index].data().description ?? "",
                            price: _productProvider.productsList[index].data().price ?? "",
                            name: _productProvider.productsList[index].data().name ?? "",
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      margin: EdgeInsets.only(right: 16),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 100,
                            child: Image.network(
                              _productProvider.productsList[index].data().imageURL ?? "",
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            _productProvider.productsList[index].data().name ?? "",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            '${_productProvider.productsList[index].data().price ?? ""}',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),

          // Remaining products in vertical layout
          Flexible(
            child: Consumer<ProductProvider>(
              builder: (context, value, child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 40.0),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: value.productsList
                        .skip(4) // Skip the first four products (already displayed horizontally)
                        .map((e) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                imageURL: e.data().imageURL ?? "",
                                description: e.data().description ?? "",
                                price: e.data().price ?? "",
                                name: e.data().name ?? "",
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 16),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Flexible(
                                child: Container(
                                  height: 100,
                                  child: Image.network(
                                    e.data().imageURL ?? "",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                flex: 1,
                              ),
                              SizedBox(width: 8.0),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e.data().name ?? "",
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      '${e.data().price ?? ""}',
                                      style: TextStyle(fontSize: 12, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                flex: 1,
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
