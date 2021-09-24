import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SmallBlocks extends StatelessWidget {
  SmallBlocks({Key? key, required this.icon, required this.title})
      : super(key: key);
  
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(8),
      title: Text(
        title,
        style: TextStyle(fontSize: 14),
      ),
      leading: FaIcon(icon,color:Color.fromRGBO(30, 115, 159, 1) ,
        // icon,
        // color: ,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
      ),
    );
  }
}
