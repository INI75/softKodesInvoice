import 'package:flutter/material.dart';

class Figs extends StatelessWidget {
  const Figs({Key? key, required this.number, required this.word})
      : super(key: key);
  final String number;
  final String word;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      child: Column(
        children: [
          Text(
            number,
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1), fontSize: 36),
          ),
          Text(
            word,
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1), fontSize: 12),
          )
        ],
      ),
    );
  }
}
