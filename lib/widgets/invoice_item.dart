import 'package:flutter/material.dart';
import 'package:invoice/widgets/line.dart';

class InvoiceItem extends StatelessWidget {
  InvoiceItem({
    Key? key,
    required this.title,
    required this.price,
    required this.qty,
  }) : super(key: key);
  final String title;
  final double price;
  final int qty;
  

  double getAmount() {
    return price * qty;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(title),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(qty.toString()), Text(getAmount().toString())],
          ),
          DashLine()
        ],
      ),
    );
  }
}
