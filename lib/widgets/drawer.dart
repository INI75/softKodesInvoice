import 'package:flutter/material.dart';

class DrawerContent extends StatelessWidget {
  DrawerContent({
    Key? key,
    required this.iconData,
    required this.label,
    required this.function,
  }) : super(key: key);
  final IconData iconData;
  final String label;
  final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Color.fromRGBO(30, 115, 159, 1),
      // focusColor: Color.fromRGBO(30, 115, 159, 1),
      onTap: function,
      child: Container(
        margin: EdgeInsets.only(left: 34, bottom: 20, top: 20),
        child: Row(
          children: [
            Icon(
              iconData,
              color: Color.fromRGBO(30, 115, 159, 1),
            ),
            SizedBox(
              width: 26,
            ),
            Text(
              label,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
