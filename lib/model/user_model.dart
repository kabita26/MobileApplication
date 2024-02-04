import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  String? email;
  String? password;
  String? userId;
  String? username;
  int totalItems = 0;

  UserModel({
    this.email,
    this.password,
    this.userId,
    this.username,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    email: json["email"],
    password: json["password"],
    userId: json["userId"],
    username: json["username"],
  );

  factory UserModel.fromFirebaseSnapshot(
      DocumentSnapshot<Map<String, dynamic>> json) =>
      UserModel(
        email: json["email"],
        password: json["password"],
        userId: json["userId"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "userId": userId,
    "username": username,
  };

  // Method to update total items
  void updateItems(int items) {
    totalItems = items;
    notifyListeners();
  }
}
