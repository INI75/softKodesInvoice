import 'package:flutter/material.dart';

class Block extends StatelessWidget {
  Block(
      {Key? key,
      required this.title,
      required this.count,
      required this.function})
      : super(key: key);
  final String title;
  final String count;
  final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Color.fromRGBO(30, 115, 159, 1),
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            count,
            style:
                TextStyle(color: Color.fromRGBO(30, 115, 159, 1), fontSize: 64),
          ),
          TextButton(
            onPressed: function,
            child: Text(
              'view all',
              style: TextStyle(
                  color: Color.fromRGBO(30, 115, 159, 1), fontSize: 12),
            ),
          )
        ],
      ),
      height: 208,
      width: 160,
      decoration: BoxDecoration(
          color: Color.fromRGBO(221, 234, 241, 1),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400,
                spreadRadius: 2,
                offset: Offset(0, 3),
                blurRadius: 2),
          ],
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
