import 'package:flutter/material.dart';
import 'package:invoice/models/user.dart';
import 'package:invoice/widgets/blocks.dart';
import 'package:invoice/widgets/color_button.dart';
import 'package:invoice/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);
  final String value = '500,000.0';
  @override
  Widget build(BuildContext context) {
    var user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black, size: 23.33),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        ),
        drawer: Container(
            width: 240,
            child: Drawer(
                child: ListView(
              children: [
                SizedBox(height: 5),
                Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close))),
                CircleAvatar(
                    child: Image.asset('assets/Ellipse 7.png'), radius: 40),
                SizedBox(height: 5),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    user.fullName,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                    alignment: Alignment.center,
                    child: Text(user.companyName,
                        style: TextStyle(
                          fontSize: 12,
                        ))),
                SizedBox(height: 10),
                DrawerContent(
                    iconData: Icons.person_outline,
                    label: 'Profile',
                    function: () {
                      Navigator.pushNamed(context, '/profile', arguments: user);
                    }),
                DrawerContent(
                    iconData: Icons.contacts_outlined,
                    label: 'Clients',
                    function: () {
                      Navigator.pushNamed(context, '/clientsList',
                          arguments: user);
                    }),
                DrawerContent(
                    iconData: Icons.collections_bookmark_outlined,
                    label: 'All Invoice',
                    function: () {
                      Navigator.pushNamed(context, '/invoiceList');
                    }),
                DrawerContent(
                    iconData: Icons.settings_outlined,
                    label: 'Settings',
                    function: () {
                      Navigator.pushNamed(context, '/settings',
                          arguments: user);
                    }),
                DrawerContent(
                    iconData: Icons.logout_outlined,
                    label: 'Logout',
                    function: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/onboarding', (route) => false);
                      //pushNamed(context, )
                    })
              ],
            ))),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, top: 24, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello,',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(user.username,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 40),
                  Text('Overview',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // recive title and  counts from api model
                Block(title: 'Paid Invoices', count: '35', function: () {}),
                Block(title: 'Unpaid Invoices', count: '10', function: () {})
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 40),
              width: MediaQuery.of(context).size.width,
              child: Column(children: [
                Text(
                  'Revenue',
                  style: TextStyle(
                      fontSize: 16, color: Color.fromRGBO(30, 115, 159, 1)),
                ),
                Text(
                  'NGN$value',
                  style: TextStyle(
                      fontSize: 36, color: Color.fromRGBO(30, 115, 159, 1)),
                ),
              ]),
            ),
            ColoredButtons(
                funtion: () {
                  Navigator.pushNamed(context, '/newinvoice');
                },
                title: 'New Invoice')
          ],
        ));
  }
}
