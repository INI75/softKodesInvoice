import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:invoice/widgets/color_button.dart';
import 'package:invoice/widgets/invoice_bills.dart';
import 'package:invoice/widgets/invoice_item.dart';
import 'package:invoice/widgets/line.dart';
// import 'package:invoice/pages/client.dart';

bool _addClient = true;
String invoiceTo = '';

//bool _addItems = true;

List<InvoiceItem> items = [];
String date = '';

double total = 0;

double subTotal = 0;

double discount = 0;

double tax = 0;

class NewInvoice extends StatefulWidget {
  NewInvoice({Key? key}) : super(key: key);

  @override
  _NewInvoiceState createState() => _NewInvoiceState();
}

class _NewInvoiceState extends State<NewInvoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            InvoiceBody(),
            // GestureDetector(
            //     onDoubleTap: () {
            //       setState(() {
            //         _addClient = !_addClient;
            //       });
            //     },
            //     child: ClientsList())
          ],
        ));
  }
}

class InvoiceBody extends StatefulWidget {
  const InvoiceBody({Key? key}) : super(key: key);

  @override
  _InvoiceBodyState createState() => _InvoiceBodyState();
}

class _InvoiceBodyState extends State<InvoiceBody> {
  static double invoiceNo = 1;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: MediaQuery.of(context).size.height,
      duration: Duration(seconds: 1),
      curve: Curves.bounceInOut,
      child: ListView(
        children: [
          Container(
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    if (_addClient) {
                      Navigator.pop(context);
                    } else {
                      setState(() {
                        _addClient = !_addClient;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
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
                        invoiceNo.toString(),
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
                      InkWell(
                          splashColor: Color.fromRGBO(30, 115, 159, 1),
                          onTap: () {
                            showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(9999))
                                .then((value) {
                              if (value == null) {
                                return;
                              } else {
                                setState(() {
                                  date = DateFormat.yMd().format(value);
                                });
                              }
                            });
                          },
                          child: Text(date == '' ? 'Select Due Date' : date,
                              style: TextStyle(fontSize: 14))),
                    ],
                  ),
                ),
              ],
            ),
          ),
          DashLine(),
          Container(
            margin: EdgeInsets.all(16),
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
                InkWell(
                  onTap: () {
                    setState(() {
                      _addClient = !_addClient;
                    });
                  },
                  child: Text(
                    'Client',
                    style: TextStyle(
                        color: Color.fromRGBO(108, 108, 108, 1), fontSize: 14),
                  ),
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
                SizedBox(height: 3),
                items.isEmpty
                    ? Text(
                        'You have 0 items',
                        style: TextStyle(
                            color: Color.fromRGBO(108, 108, 108, 1),
                            fontSize: 12),
                      )
                    : Container(
                        child: Column(
                            //  children: items.map((e){}).toList(),
                            ),
                      ),
                SizedBox(height: 16),
                AccentColoredButtons(
                    funtion: () {
                      //  to create item and add to item list
                    },
                    title: 'Add Item'),
                SizedBox(height: 17)
              ],
            ),
          ),
          DashLine(),
          Container(
            child: Column(
              children: [
                Bills(title: 'Sub Total', amount: subTotal),
                Bills(title: 'Discount', amount: discount),
                Bills(title: 'Tax', amount: tax),
                Container(
                  width: double.infinity,
                  margin:
                      EdgeInsets.only(top: 38, left: 16, right: 16, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Grand Total',
                        style: TextStyle(
                            color: Color.fromRGBO(30, 115, 159, 1),
                            fontSize: 16),
                      ),
                      total <= 0
                          ? Text('')
                          : Text(
                              'NGN$total',
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
          SizedBox(height: 40),
          ColoredButtons(
              funtion: () {
                setState(() {
                  invoiceNo++;
                  _showD();
                });
              },
              title: 'Create Invoice'),
        ],
      ),
    );
  }

  _showD() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            height: 400,
            width: 360,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    //padding: EdgeInsets.only(left: 240),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(bottom: 12),
                    child: Icon(
                      Icons.done,
                      color: Colors.white,
                      size: 50,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green.shade800,
                    )),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Invoice Successfully Created!',
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ),
                AlertRow(
                    iconData: Icons.visibility_outlined,
                    rowText: 'View Invoice',
                    addressNav: () {}),
                AlertRow(
                    iconData: Icons.replay,
                    rowText: 'Recurring',
                    addressNav: () {
                      Navigator.popAndPushNamed(context, '/recurring');
                    }),
                AlertRow(
                    iconData: Icons.logout,
                    rowText: 'Export',
                    addressNav: () {
                      setState(() {
                        Navigator.pop(context);
                        _modelSheet(context);
                      });
                    }),
                AlertRow(
                    iconData: Icons.delete_outline,
                    rowText: 'Delete',
                    addressNav: () {
                      setState(() {
                        Navigator.pop(context);
                        _showDuplicate();
                      });
                    }),
              ],
            ),
          ),
        ); 
      },
    );
  }

  void _showDuplicate() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          height: 270,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  //padding: EdgeInsets.only(left: 240),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                ),
              ),
              Text('Duplicate Invoice',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text('Would you like to duplicate Invoice #31245?',
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(108, 108, 108, 1), fontSize: 14)),
              SizedBox(height: 50),
              ColoredButtons(funtion: () {}, title: 'Create Duplicate')
            ],
          ),
        ),
      ),
    );
  }
}

class Invoice {
  final String invoiceTo;
  final DateTime date;

  Invoice(this.invoiceTo, this.date);

// learn sqflite
// convert model to widget
  // includes invoice item
}

class AlertRow extends StatelessWidget {
  AlertRow({
    Key? key,
    required this.iconData,
    required this.rowText,
    required this.addressNav,
  }) : super(key: key);
  final IconData iconData;
  final String rowText;
  final VoidCallback addressNav;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: addressNav,
      child: Container(
        margin: EdgeInsets.only(left: 16, top: 20),
        child: Row(
          children: [
            Icon(
              iconData,
              color: Color.fromRGBO(30, 115, 159, 1),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              rowText,
              style: TextStyle(
                  color: Color.fromRGBO(30, 115, 159, 1), fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}

void _modelSheet(context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        height: 180,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ABC Transport Company'),
                        Text(
                          'Invoice #31245',
                          style: TextStyle(
                              color: Color.fromRGBO(108, 108, 108, 1),
                              fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'NGN59,125.00',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Unpaid',
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
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
}
