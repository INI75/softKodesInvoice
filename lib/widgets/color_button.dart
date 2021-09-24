import 'package:flutter/material.dart';

class ColoredButtons extends StatelessWidget {
  ColoredButtons({
    Key? key,
    required this.funtion,
    required this.title,
  }) : super(key: key);
  final VoidCallback funtion;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: Color.fromRGBO(30, 115, 159, 1),
        height: 48,
        minWidth: 318,
        onPressed: funtion,
        child: Text(
          title,
          style:
              TextStyle(fontSize: 16, color: Color.fromRGBO(255, 255, 255, 1)),
        ),
      ),
    );
  }
}

class AccentColoredButtons extends StatelessWidget {
  AccentColoredButtons({
    Key? key,
    required this.funtion,
    required this.title,
  }) : super(key: key);
  final VoidCallback funtion;
  final String title;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: Color.fromRGBO(221, 234, 241, 1),
      height: 32,
      minWidth: 96,
      onPressed: funtion,
      child: Text(
        title,
        style: TextStyle(fontSize: 16, color: Color.fromRGBO(30, 115, 159, 1)),
      ),
    );
  }
}
