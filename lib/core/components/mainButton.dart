import 'package:case_study/core/components/mainText.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const MainButton(this.title,this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      color: Colors.amber,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      child: MainText(title),
    );
  }
}
