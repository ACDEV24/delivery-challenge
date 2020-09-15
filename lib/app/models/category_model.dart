import 'package:flutter/material.dart';

class Category {

  final String image;
  final String name;
  final Color color;

  Category({
    this.image,
    this.name,
    this.color,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    image: json['image'] == null ? null : json['image'],
    name: json['name'] == null ? null : json['name'],
    color: json['color'] == null ? null : json['color'],
  );

  Map<String, dynamic> toJson() => {
    'image': image == null ? null : image,
    'name': name == null ? null : name,
    'color': color == null ? null : color
  };
}
