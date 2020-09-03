import 'package:clean_arch/app/core/domain/entities/failure.dart';
import 'package:clean_arch/app/modules/home/domain/entities/item.dart';
import 'package:clean_arch/app/modules/home/domain/repositories/item_repository.dart';
import 'package:clean_arch/app/modules/home/domain/usecases/get_items.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:freezed_annotation/freezed_annotation.dart' hide Default;
part 'home_bloc.freezed.dart';
part 'home_bloc.g.dart';

@freezed
abstract class HomeEvent with _$HomeEvent {
  const factory HomeEvent.start() = _Start;
}

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState.loading() = _Loading;
  const factory HomeState.success({List<Item> items}) = _Success;
  const factory HomeState.failure({Failure failure}) = _Failure;
}

@Injectable()
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetItems getItems;
  HomeBloc({@Default(GetItems) this.getItems}) : super(HomeState.loading()) {
    add(HomeEvent.start());
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    yield* event.when(start: () => _start());
  }

  Stream<HomeState> _start() async* {
    final response = await getItems();
    yield response.fold(
      (l) => HomeState.failure(failure: l),
      (r) => HomeState.success(items: r),
    );
  }
}
