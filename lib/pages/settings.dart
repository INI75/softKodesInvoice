import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:invoice/models/user.dart';
import 'package:invoice/widgets/line.dart';
import 'package:invoice/widgets/small_blocks.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _user = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black, size: 23.33),
        backgroundColor: Colors.white,
        title: Text(
          'Settings',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            child: Row(
              //  mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  child: Image.asset(
                    'assets/Ellipse 8.png',
                  ),
                  radius: 56,
                ),
                Container(
                  width: 170,
                  margin: EdgeInsets.only(left: 15, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _user.fullName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        _user.companyName,
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ),
                Expanded(child: Icon(Icons.arrow_forward_ios))
              ],
            ),
          ),
          SizedBox(height: 20),
          DashLine(),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: [
                SmallBlocks(
                    icon: FontAwesomeIcons.questionCircle, title: 'FAQ\'s'),
                DashLine(),
                SmallBlocks(icon: Icons.repeat, title: 'Change Currency'),
                DashLine(),
                SmallBlocks(
                    icon: FontAwesomeIcons.userLock,
                    title: 'Change user password'),
                DashLine()
              ],
            ),
          )
        ],
      ),
    );
  }
}
