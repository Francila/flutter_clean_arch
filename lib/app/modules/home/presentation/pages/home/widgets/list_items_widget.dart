import 'package:clean_arch/app/modules/home/domain/entities/item.dart';
import 'package:flutter/material.dart';

import 'item_widget.dart';

class ListItemsWidget extends StatelessWidget {
  final List<Item> items;
  const ListItemsWidget({
    Key key,
    @required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (_, index) => ItemWidget(item: items[index]));
  }
}
