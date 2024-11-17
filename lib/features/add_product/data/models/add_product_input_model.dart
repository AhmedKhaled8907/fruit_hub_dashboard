import 'dart:io';

import 'package:fruit_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

class AddProductInputModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final bool isFeatured;
  final File image;
  String? imageUrl;

  AddProductInputModel({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.isFeatured,
    required this.image,
    this.imageUrl,
  });

  factory AddProductInputModel.fromEntity(AddProductInputEntity entity) {
    return AddProductInputModel(
      name: entity.name,
      code: entity.code,
      description: entity.description,
      price: entity.price,
      isFeatured: entity.isFeatured,
      image: entity.image,
      imageUrl: entity.imageUrl,
    );
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'image': image,
      'imageUrl': imageUrl,
    };
  }
}
