import 'package:clean_arch/app/modules/home/domain/entities/item.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  const ItemWidget({
    Key key,
    @required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name),
      leading: CircleAvatar(child: Text(item.id)),
      trailing: Text(item.price.toString()),
    );
  }
}
