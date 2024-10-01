import 'package:flutter/material.dart';

class MainText extends StatelessWidget {
  const MainText(
    this.text, {
    this.size = 18,
    this.weight = FontWeight.w500,
    super.key,
  });

  final String text;
  final double size;
  final FontWeight weight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: weight,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
