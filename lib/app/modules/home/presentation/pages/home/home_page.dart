import 'package:clean_arch/app/modules/home/presentation/pages/home/home_bloc.dart';
import 'package:clean_arch/app/modules/home/presentation/widgets/failure_widget.dart';
import 'package:clean_arch/app/modules/home/presentation/pages/home/widgets/list_items_widget.dart';
import 'package:clean_arch/app/modules/home/presentation/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<HomeBloc, HomeState>(
          cubit: controller,
          builder: (_, state) => state.when(
              loading: () => LoadingWidget(),
              success: (items) => ListItemsWidget(
                    items: items,
                  ),
              failure: (failure) => FailureWidget(failure: failure))),
    );
  }
}
