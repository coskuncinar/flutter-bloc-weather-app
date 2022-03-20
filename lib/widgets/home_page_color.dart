import 'package:flutter/material.dart';

class HomePageColorWidget extends StatelessWidget {
  final Widget childWidget;
  final MaterialColor childColor;

  const HomePageColorWidget(
      {Key? key, required this.childWidget, required this.childColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: childWidget,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [childColor[700]!, childColor[500]!, childColor[200]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.6, 0.8, 1]),
      ),
    );
  }
}
