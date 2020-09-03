import 'dart:convert';

import 'package:clean_arch/app/modules/home/domain/entities/item.dart';

class ItemModel extends Item {

  ItemModel({
    String id,
    String name,
    int price
  }):super(id: id, name: name, price: price,);

  Item copyWith({
    String id,
    String name,
    int price,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return ItemModel(
      id: map['id'],
      name: map['name'],
      price: map['price'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) => ItemModel.fromMap(json.decode(source));

  @override
  String toString() => 'Item(id: $id, name: $name, price: $price)';
}