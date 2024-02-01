import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:skincare_android/repository/product_repository.dart';
import '../model/productModel.dart';

class ProductProvider extends ChangeNotifier {

  List<QueryDocumentSnapshot<ProductModel>> _productsList = [];

  List<QueryDocumentSnapshot<ProductModel>> get productsList => _productsList;
  late ProductModel productModel;

  Future<void> fetchProducts() async {
    final res = await ProductRepository().getData(productsList);
    _productsList = res;
    notifyListeners();
  }

}
