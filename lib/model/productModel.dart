// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));
//
// String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  String ? name;
  String ? imageURL;
  String ? price;
  String ? description;

  ProductModel({
     this.name,
     this.imageURL,
     this.price,
    this.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    name: json["name"],
    imageURL: json["imageURL"],
    price: json["price"]?.toString(),
    description: json["description"],
  );


  factory ProductModel.fromFirebaseSnapshot(DocumentSnapshot<Map<String, dynamic>> json) => ProductModel(
    name: json["name"],
    imageURL: json["imageURL"],
    price: json["price"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "imageURL": imageURL,
    "price": price,
    "description":description,
  };

}
