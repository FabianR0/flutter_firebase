// import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final productListProvider = FutureProvider<List<Product>>((ref) async {
  final response = await http.get(Uri.parse('http://localhost:3000/products'));//https://api.escuelajs.co/api/v1/products
  // if (kDebugMode) {
  //   print('API response: ${response.body}');
  // }
  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => Product.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load products');
  }
});

class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id']?.toString() ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: json['price']?.toDouble() ?? 0.0,
      // ignore: prefer_if_null_operators
      imageUrl: json['images'] != null ? json['images'] : null, 
    );
  }
}