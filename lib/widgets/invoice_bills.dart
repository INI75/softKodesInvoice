import 'package:flutter/material.dart';

class Bills extends StatelessWidget {
  Bills({
    Key? key,
    required this.title,
    required this.amount,
  }) : super(key: key);
  final String title;
  final double amount;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 26, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Color.fromRGBO(108, 108, 108, 1), fontSize: 12),
          ),
          amount <= 0 ? Text('') : Text('NGN$amount'),
        ],
      ),
    );
  }
}
