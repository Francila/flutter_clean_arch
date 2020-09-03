import 'package:clean_arch/app/core/domain/entities/failure.dart';
import 'package:clean_arch/app/modules/home/data/datasources/item_local_data_source.dart';
import 'package:clean_arch/app/modules/home/domain/entities/item.dart';
import 'package:clean_arch/app/modules/home/domain/repositories/item_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
part 'item_repository_impl.g.dart';

@Injectable()
class ItemRepositoryImpl implements ItemRepository {
  final ItemLocalDataSource localDataSource;

  ItemRepositoryImpl({@required this.localDataSource});
  @override
  Future<Either<Failure, List<Item>>> getItems() async {
    try {
      final response = await localDataSource.getItems();
      return right(response);
    } catch (e) {
      return left(Failure(
          code: 0, message: "Nao foi possivel carregar os items", error: e));
    }
  }
}
