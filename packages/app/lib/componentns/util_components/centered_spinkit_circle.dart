import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CenteredSpinkitCircle extends StatelessWidget {
  const CenteredSpinkitCircle({this.size = 24});
  final double size;
  @override
  Widget build(BuildContext context) => Center(
        child: SpinKitCircle(
          size: size,
          color: Theme.of(context).colorScheme.secondary,
        ),
      );
}
