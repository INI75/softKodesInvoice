import 'package:flutter/material.dart';

class InvoiceList extends StatefulWidget {
  InvoiceList({Key? key}) : super(key: key);

  @override
  _InvoiceListState createState() => _InvoiceListState();
}

class _InvoiceListState extends State<InvoiceList> {
  List invoices = ['Hello', 'How', 'Ok'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //
      //
      //   title:

      //   // title: Text(
      //   //   'A',
      //   //   style: TextStyle(
      //   //       color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      //   // ),
      //   actions: [
      //
      //   ],
      // ),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            flexibleSpace: DropdownButton(
                items: invoices
                    .map(
                      (e) => DropdownMenuItem(
                        child: Text(e),
                        value: e,
                      ),
                    )
                    .toList()),
            backgroundColor: Colors.green,
            iconTheme: IconThemeData(color: Colors.black, size: 23.33),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              )
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color.fromRGBO(30, 115, 159, 1),
        child: Icon(Icons.add),
      ),
    );
  }
}
