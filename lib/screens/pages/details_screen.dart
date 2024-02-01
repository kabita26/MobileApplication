import 'package:flutter/material.dart';
import 'package:skincare_android/screens/pages/CartPage.dart';
import '../../constants.dart';
import '../../model/productModel.dart';
import '../components/cart_counter.dart';
import '../components/fav_btn.dart';
import '../components/price.dart';

class DetailsScreen extends StatefulWidget {
  final String imageURL;
  final String description;
  final String price;
  final String name;

  const DetailsScreen({Key? key,
    required this.imageURL,
    required this.description,
    required this.price,
    required this.name,
  }) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String _cartTag = '';
  String buyTag= '';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Consider updating a CartModel here or navigating with product data
                    // For example: Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage(product: widget)));
                    print("Add to Cart pressed");
                  },
                  child: Text("Add to Cart"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      buyTag = '_buyTag';
                    });
                    print("Buy Now pressed");
                  },
                  child: Text("Buy Now"),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.37,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: 20,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(widget.imageURL),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          CartCounter(quantity: '1', onIncrement: () {  },),

          SizedBox(height: defaultPadding * 1.5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Row(
              children: [
                Price(amount: widget.price),
              ],
            ),
          ),

          SizedBox(height: defaultPadding),
          Text(
            widget.description,
            style: TextStyle(
              fontSize: 14,
              color: Colors.blueGrey,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.left,
          ),

          if (buyTag.isNotEmpty)
            Text(
              buyTag,
              style: TextStyle(
                fontSize: 16,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: BackButton(
        color: Colors.black,
      ),
      backgroundColor: Color(0xFFF8F8F8),
      elevation: 0,
      centerTitle: true,
      title: Text(
        widget.name,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
