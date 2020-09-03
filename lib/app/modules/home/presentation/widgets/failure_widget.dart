import 'package:clean_arch/app/core/domain/entities/failure.dart';
import 'package:flutter/material.dart';

class FailureWidget extends StatelessWidget {
  final Failure failure;
  const FailureWidget({
    Key key,
    @required this.failure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(failure.message));
  }
}
