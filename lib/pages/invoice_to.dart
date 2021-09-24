import 'package:flutter/material.dart';


class InvoiceTo extends StatelessWidget {
  const InvoiceTo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black, size: 23.33),
        elevation: 0,
      ),
      // body: ,flutter packages get
      // body: ListView(
      //   children: [
      //     FloatingSearchBar(
      //       builder: (context, transition) {
      //         return AnimatedContainer(
      //           duration: Duration(seconds: 1),
      //           height: 100,
      //           color: Colors.black,
      //         );
      //       },
      //     ),
      //     Text('hdjdjdjdkd')
      //   ],
      // ),
    );
  }
}
