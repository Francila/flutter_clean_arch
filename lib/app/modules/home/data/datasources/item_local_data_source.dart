import 'package:clean_arch/app/modules/home/domain/entities/item.dart';
import 'package:flutter_modular/flutter_modular.dart';
part 'item_local_data_source.g.dart';

abstract class ItemLocalDataSource {
  Future<List<Item>> getItems();
}

@Injectable()
class ItemLocalDataSourceImpl implements ItemLocalDataSource {
  @override
  Future<List<Item>> getItems() async {
    await Future.delayed(Duration(seconds: 1));
    return List.generate(
        10,
        (index) =>
            Item(id: "$index", name: "Name $index", price: (index + 1) * 100));
  }
}
