

class Item {
  final String id;
  final String name;
  final int price;
  Item({
    this.id,
    this.name,
    this.price,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Item &&
      o.id == id &&
      o.name == name &&
      o.price == price;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ price.hashCode;


}
