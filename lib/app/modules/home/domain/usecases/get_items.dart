import 'package:clean_arch/app/core/domain/entities/failure.dart';
import 'package:clean_arch/app/modules/home/domain/entities/item.dart';
import 'package:clean_arch/app/modules/home/domain/repositories/item_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
part 'get_items.g.dart';

abstract class GetItems {
  Future<Either<Failure, List<Item>>> call();
}

@Injectable()
class GetItemsImpl implements GetItems {
  final ItemRepository repository;

  GetItemsImpl({@required this.repository});
  @override
  Future<Either<Failure, List<Item>>> call() async {
    return await repository.getItems();
  }
}
