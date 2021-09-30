import 'package:flutter/material.dart';
import 'package:invoice/models/invoice_data.dart';
import 'package:invoice/pages/new_invoice.dart';
import 'package:invoice/widgets/invoice_bills.dart';
import 'package:invoice/widgets/line.dart';

class InvoiceProfile extends StatefulWidget {
  const InvoiceProfile({Key? key}) : super(key: key);

  @override
  _InvoiceProfileState createState() => _InvoiceProfileState();
}

class _InvoiceProfileState extends State<InvoiceProfile> {
  @override
  Widget build(BuildContext context) {
    var person = ModalRoute.of(context)!.settings.arguments as InvoiceData;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(person.getClientData(),
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
              onPressed: () {
                // show model bottom sheet
                setState(() {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 350,
                        // margin:
                        //     EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                        // width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AlertRow(
                                iconData: Icons.visibility_outlined,
                                rowText: 'View Invoice',
                                addressNav: () {}),
                            AlertRow(
                                iconData: Icons.replay,
                                rowText: 'Recurring',
                                addressNav: () {}),
                            AlertRow(
                                iconData: Icons.logout,
                                rowText: 'Export',
                                addressNav: () {}),
                            AlertRow(
                                iconData: Icons.delete_outline,
                                rowText: 'Delete',
                                addressNav: () {}),
                            AlertRow(
                                iconData: Icons.logout,
                                rowText: 'Export as PDF',
                                addressNav: () {}),
                            AlertRow(
                                iconData: Icons.mail_outline,
                                rowText: 'Send as Email',
                                addressNav: () {}),
                            AlertRow(
                                iconData: Icons.save,
                                rowText: 'Save Invoice',
                                addressNav: () {}),
                          ],
                        ),
                      );
                    },
                  );
                });
              },
              icon: Icon(Icons.more_horiz))
        ],
        iconTheme: IconThemeData(color: Colors.black, size: 23.33),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 64,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Invoice No.',
                        style: TextStyle(
                            color: Color.fromRGBO(108, 108, 108, 1),
                            fontSize: 12),
                      ),
                      Text(
                        person.getInvoiceNo(),
                        style: TextStyle(fontSize: 14),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Due Date',
                        style: TextStyle(
                            color: Color.fromRGBO(108, 108, 108, 1),
                            fontSize: 12),
                      ),
                      Text(person.getInvoiceDate(),
                          style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          DashLine(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Invoice To.',
                  style: TextStyle(
                      color: Color.fromRGBO(108, 108, 108, 1), fontSize: 12),
                ),
                SizedBox(height: 20),
                Text(
                  person.getClientData(),
                  //'helo',
                  style: TextStyle(
                      color: Color.fromRGBO(108, 108, 108, 1), fontSize: 14),
                ),
              ],
            ),
          ),
          DashLine(),
          Container(
            margin: EdgeInsets.only(top: 24, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Invoice Items',
                  style: TextStyle(
                    color: Color.fromRGBO(30, 115, 159, 1),
                    fontSize: 16,
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 5, right: 5),
                    height: 120,
                    child: ListView.builder(
                      itemCount: person.getItemsList().length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  person.getItemsList()[index].getDiscription(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(vertical: 7),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        'Qty: ${person.getItemsList()[index].getQuantity()}'),
                                    Text(
                                        'NGN${person.getItemsList()[index].getTotal()}')
                                  ],
                                ),
                              ),
                              DashLine()
                            ],
                          ),
                        );
                      },
                    )),
              ],
            ),
          ),
          DashLine(),
          Container(
            child: Column(
              children: [
                Bills(
                    title: 'Sub Total',
                    amount: double.parse(person.getSubTotal())),
                Bills(
                    title: 'Discount',
                    amount: double.parse(person.getDiscount())),
                Bills(title: 'Tax', amount: double.parse(person.getTax())),
                Container(
                  width: double.infinity,
                  margin:
                      EdgeInsets.only(top: 28, left: 16, right: 16, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Grand Total',
                        style: TextStyle(
                            color: Color.fromRGBO(30, 115, 159, 1),
                            fontSize: 16),
                      ),
                      Text(
                        person.getGrandTotal(),
                        style: TextStyle(
                            color: Color.fromRGBO(30, 115, 159, 1),
                            fontSize: 16),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          DashLine(),
        ],
      ),
    );
  }
}
