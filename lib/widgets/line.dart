import 'package:flutter/material.dart';

class DashLine extends StatelessWidget {
  const DashLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey.shade400, boxShadow: [
        BoxShadow(
          blurRadius: 1
        )
      ]),
      width: double.infinity,
      height: .5,
    );
  }
}
