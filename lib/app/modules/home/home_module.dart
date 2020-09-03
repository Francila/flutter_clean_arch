import 'package:clean_arch/app/modules/home/data/datasources/item_local_data_source.dart';
import 'package:clean_arch/app/modules/home/data/repositories/item_repository_impl.dart';
import 'package:clean_arch/app/modules/home/domain/usecases/get_items.dart';
import 'package:clean_arch/app/modules/home/presentation/pages/home/home_bloc.dart';
import 'package:clean_arch/app/modules/home/presentation/pages/home/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends ChildModule {
  List<Bind> get _useCases => [
        $GetItemsImpl,
      ];

  @override
  List<Bind> get binds => [
        $ItemRepositoryImpl,
        $ItemLocalDataSourceImpl,
        $HomeBloc,
        ..._useCases,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, __) => HomePage()),
      ];
}
