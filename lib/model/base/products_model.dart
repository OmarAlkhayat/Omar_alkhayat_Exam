// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ProductsModel {
  int id;
  String title;
  String description;
  int price;
  num discountPercentage;
  num rating;
  int stock;
  String brand;
  String category;
  String thumbnail;
  List<String> images;
  ProductsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  ProductsModel copyWith({
    int? id,
    String? title,
    String? description,
    int? price,
    num? discountPercentage,
    num? rating,
    int? stock,
    String? brand,
    String? category,
    String? thumbnail,
    List<String>? images,
  }) {
    return ProductsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      rating: rating ?? this.rating,
      stock: stock ?? this.stock,
      brand: brand ?? this.brand,
      category: category ?? this.category,
      thumbnail: thumbnail ?? this.thumbnail,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'brand': brand,
      'category': category,
      'thumbnail': thumbnail,
      'images': images,
    };
  }

  factory ProductsModel.fromMap(Map<String, dynamic> map) {
    return ProductsModel(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      price: map['price'] as int,
      discountPercentage: map['discountPercentage'] as num,
      rating: map['rating'] as num,
      stock: map['stock'] as int,
      brand: map['brand'] as String,
      category: map['category'] as String,
      thumbnail: map['thumbnail'] as String,
      images: List<String>.from((map['images'] as List<String>),
    ));
  }

  String toJson() => json.encode(toMap());

  factory ProductsModel.fromJson(String source) => ProductsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductsModel(id: $id, title: $title, description: $description, price: $price, discountPercentage: $discountPercentage, rating: $rating, stock: $stock, brand: $brand, category: $category, thumbnail: $thumbnail, images: $images)';
  }

  @override
  bool operator ==(covariant ProductsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.description == description &&
      other.price == price &&
      other.discountPercentage == discountPercentage &&
      other.rating == rating &&
      other.stock == stock &&
      other.brand == brand &&
      other.category == category &&
      other.thumbnail == thumbnail &&
      listEquals(other.images, images);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      price.hashCode ^
      discountPercentage.hashCode ^
      rating.hashCode ^
      stock.hashCode ^
      brand.hashCode ^
      category.hashCode ^
      thumbnail.hashCode ^
      images.hashCode;
  }
}
