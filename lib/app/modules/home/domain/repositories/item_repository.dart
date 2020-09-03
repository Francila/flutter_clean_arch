

import 'package:clean_arch/app/core/domain/entities/failure.dart';
import 'package:clean_arch/app/modules/home/domain/entities/item.dart';
import 'package:dartz/dartz.dart';

abstract class ItemRepository{
  Future<Either<Failure,List<Item>>> getItems();
}