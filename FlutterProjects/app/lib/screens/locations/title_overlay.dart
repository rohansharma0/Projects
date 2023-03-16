import 'package:flutter/material.dart';
import '../../models/location.dart';

class TitleOverlay extends StatelessWidget {
  final Location location;
  TitleOverlay(this.location);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children:  [
      ],
    );
  }
}