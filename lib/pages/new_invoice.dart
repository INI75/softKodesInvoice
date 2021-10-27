import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:invoice/models/invoice_data.dart';
import '/widgets/color_button.dart';
import '/widgets/invoice_bills.dart';
import '/widgets/line.dart';
import '/pages/client.dart';
import '/pages/add_items.dart';
import 'package:invoice/models/clients.dart';

//bool _addItems = true;
List<InvoiceData> invoiceList = [];
String _invoiceTo = 'Client';

String _invoiceToUpdate = '';
void setInvoiceTo(String name) {
  _invoiceToUpdate = name;
}

String _date = '';

double _total = 0;

double _subTotal = 0;

double _discount = 0;

double _tax = 0;
bool hope = true;

class NewInvoice extends StatefulWidget {
  NewInvoice({Key? key}) : super(key: key);

  @override
  _NewInvoiceState createState() => _NewInvoiceState();
}

class _NewInvoiceState extends State<NewInvoice> {
  static double invoiceNo = 1;
  var _searchview = TextEditingController();
  bool _firstSearch = true;
  String _query = '';

  //List<Clients> _items = [];
  List<Clients> _filteredList = [];

  // @override
  // void initState() {
  //   super.initState();

  //   // if (clientsList.isNotEmpty) {
  //   //   _items.addAll(clientsList);

  //   //   _items.sort();
  //   // }
  //    if (_items.isEmpty) {
  //     _items.addAll(clientsList);
  //   }
  //   if (clientsList.isNotEmpty) {
  //     for (int i = 0; i >= clientsList.length; i++) {
  //       if (!_items.contains(clientsList[i])) {
  //         _items.add(clientsList[i]);
  //       }
  //     }
  //     _items.sort();
  //   }
  // }

  // _InvoiceToState() {
  //   _searchview.addListener(() {
  //     if (_searchview.text.isEmpty) {
  //       setState(() {
  //         _firstSearch = true;
  //         _query = '';
  //       });
  //     } else {
  //       setState(() {
  //         _firstSearch = false;
  //         _query = _searchview.text;
  //       });
  //     }

  //     //  continue with the video on search    ,,,,,,   find a way to return and up date client
  //   });
  // }
  String _subTotalCal() {
    double subT = 0;
    for (int i = 0; i < addItemsList.length; i++) {
      subT = subT + double.parse(addItemsList[i].getTotal());
      print('subT =$subT');
    }
    print('subT =$subT');
    return subT.toString();
  }

  String _totalDiscountCal() {
    double disT = 0;
    for (int i = 0; i < addItemsList.length; i++) {
      disT = disT + double.parse(addItemsList[i].getPercentage());
    }
    disT = disT * 0.2;
    print('disT =$disT');
    return disT.toString();
  }

  String _taxCal() {
    double taxT = 0;
    for (int i = 0; i < addItemsList.length; i++) {
      taxT = taxT + double.parse(addItemsList[i].getTax());
    }
    print('taxT =$taxT');
    return taxT.toString();
  }
///  Prevent body form getting above appbar
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: media.size.height,
          child: ListView(
            children: [
              AnimatedContainer(
                height: hope ? media.size.height : 0,
                //  height: MediaQuery.of(context).size.height,
                duration: Duration(seconds: 2),
                curve: Curves.bounceInOut,
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          SizedBox(width: 20),
                          Text('Create Invoice',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold))
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
                                    splashColor:
                                        Color.fromRGBO(30, 115, 159, 1),
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
                                            _date =
                                                DateFormat.yMd().format(value);
                                          });
                                        }
                                      });
                                    },
                                    child: Text(
                                        _date == '' ? 'Select Due Date' : _date,
                                        style: TextStyle(fontSize: 14))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    DashLine(),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Invoice To.',
                            style: TextStyle(
                                color: Color.fromRGBO(108, 108, 108, 1),
                                fontSize: 12),
                          ),
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              //_invoiceTo=
                              setState(() {
                                //  Navigator.pushNamed(context, '/invoiceTo');
                                hope = !hope;
                                // to ensure that _invoiceTo gets updated
                              });
                            },
                            child: Text(
                              _invoiceToUpdate == ''
                                  ? _invoiceTo
                                  : _invoiceToUpdate,
                              //'helo',
                              style: TextStyle(
                                  color: Color.fromRGBO(108, 108, 108, 1),
                                  fontSize: 14),
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

                          addItemsList.isEmpty
                              ? Text(
                                  'You have 0 items',
                                  style: TextStyle(
                                      color: Color.fromRGBO(108, 108, 108, 1),
                                      fontSize: 12),
                                )
                              : Container(
                                  height: 120,
                                  child: ListView.builder(
                                    itemCount: addItemsList.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                addItemsList[index]
                                                    .getDiscription(),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                            Container(
                                              width: double.infinity,
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 5),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      'Qty: ${addItemsList[index].getQuantity()}'),
                                                  Text(
                                                      'NGN${addItemsList[index].getTotal()}')
                                                ],
                                              ),
                                            ),
                                            DashLine()
                                          ],
                                        ),
                                      );
                                    },
                                  )),
                          //  if (_addItems.isEmpty)
                          //  Column(children: [

                          if (addItemsList.isEmpty) (SizedBox(height: 16)),
                          AccentColoredButtons(
                              funtion: () {
                                Navigator.pushNamed(context, '/additem');

                              },
                              title: 'Add Item'),
                          addItemsList.isEmpty
                              ? SizedBox(height: 17)
                              : SizedBox(height: 3),
                          //   ]),
                        ],
                      ),
                    ),
                    DashLine(),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _subTotal = double.parse(_subTotalCal());
                          _discount = double.parse(_totalDiscountCal());
                          _tax = double.parse(_taxCal());
                          _total = _tax + _discount + _subTotal;
                        });
                      },
                      child: Container(
                        child: Column(
                          children: [
                            Bills(title: 'Sub Total', amount: _subTotal),
          /// Show percentage and not number 
                            Bills(title: 'Discount', amount: _discount),
                            Bills(title: 'Tax', amount: _tax),
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(
                                  top: 28, left: 16, right: 16, bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Grand Total',
                                    style: TextStyle(
                                        color: Color.fromRGBO(30, 115, 159, 1),
                                        fontSize: 16),
                                  ),
                                  Text(
                                    'NGN$_total',
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
                    ),
                    DashLine(),
                    SizedBox(height: 40),
                    ColoredButtons(
                        funtion: () {
                          setState(() {
                            if (_date.isNotEmpty &&
                                _invoiceToUpdate.isNotEmpty) {
                              final a = InvoiceData(
                                  invoiceNo.toString(),
                                  _date,
                                  _invoiceToUpdate,
                                  addItemsList,
                                  _subTotal.toString(),
                                  _discount.toString(),
                                  _tax.toString(),
                                  _total.toString());
                              invoiceList.add(a);
                              _invoiceToUpdate = '';
                              _invoiceTo = 'Client';
                              addItemsList = [];
                              _date = '';
                              _total = 0;
                              _subTotal = 0;
                              _discount = 0;
                              _tax = 0;
                              invoiceNo++;
                              _showD();
                              Navigator.pop(context);
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Invalid'),
                                    content: Text(
                                        'Please enter the required details'),
                                  );
                                },
                              );
                            }
                          });
                        },
                        title: 'Create Invoice'),
                  ],
                ),
              ),

              ///
              ///
              ///
              // InvoiceTo()
              AnimatedContainer(
                margin: EdgeInsets.only(top: 30),
                height: hope ? 0 : 800,
                duration: Duration(seconds: 2),
                curve: Curves.bounceInOut,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              icon: Icon(Icons.arrow_back),
                              onPressed: () {
                                setState(() {
                                  hope = !hope;
                                });
                              },
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/clientsList');
                              },
                              icon: Icon(Icons.add))
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    _createSearchView(),
                    DashLine(),
                    clientsList.isEmpty
                        ? _createClient()
                        : _firstSearch
                            ? _createListView()
                            : _performSearchView(),
                  ],
                ),

                //
              ),
            ],
          ),
        ));
  }

  Widget _createSearchView() {
    return Container(
      margin: EdgeInsets.only(bottom: 20, right: 16, left: 16),
      child: TextField(
        style: TextStyle(fontSize: 13),
        controller: _searchview,
        decoration: InputDecoration(
          labelText: 'Client',
          suffixIcon: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                setState(() {
                  _searchview.text = '';
                });
              }),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }

  //
  //
  Widget _createListView() {
    return Flexible(
        child: ListView.builder(
      itemCount: clientsList.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            setState(() {
              setInvoiceTo(clientsList[index].name);
              hope = !hope;
            });
          },
          child: Container(
            height: 70,
            margin: EdgeInsets.only(top: 10, left: 16),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CircleAvatar(
                backgroundColor: Color.fromRGBO(30, 115, 159, 1),
                radius: 26,
                child: Text(
                  '${clientsList[index].name.characters.first.toUpperCase()}' +
                      '${clientsList[index].name.characters.last.toUpperCase()}',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Container(
                height: 70,
                margin: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(clientsList[index].name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 3),
                    Text(clientsList[index].email,
                        style: TextStyle(fontSize: 12)),
                    SizedBox(height: 3),
                    Text(clientsList[index].address,
                        style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ]),
          ),
        );
      },
    ));
  }

//
//
  Widget _performSearchView() {
    for (int i = 0; i < clientsList.length; i++) {
      var _itemName = clientsList[i].name;
      if (_itemName.toLowerCase().contains(_query.toLowerCase())) {
        _filteredList.add(clientsList[i]);
      }
    }
    return _filteredListView();
  }

  Widget _filteredListView() {
    return Flexible(
        child: ListView.builder(
      itemCount: _filteredList.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            setState(() {
              setInvoiceTo(clientsList[index].name);
              hope = !hope;
            });
          },
          child: Container(
            height: 70,
            margin: EdgeInsets.only(top: 10, left: 16),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CircleAvatar(
                backgroundColor: Color.fromRGBO(30, 115, 159, 1),
                radius: 26,
                child: Text(
                  '${_filteredList[index].name.characters.first.toUpperCase()}' +
                      '${_filteredList[index].name.characters.last.toUpperCase()}',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Container(
                height: 70,
                margin: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_filteredList[index].name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 3),
                    Text(_filteredList[index].email,
                        style: TextStyle(fontSize: 12)),
                    SizedBox(height: 3),
                    Text(_filteredList[index].address,
                        style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ]),
          ),
        );
      },
    ));
  }

// ui empty
  Widget _createClient() {
    return Container(
      height: 500,
      width: double.infinity,
      child: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 30, top: 150),
              child: GestureDetector(
                  onTap: () {
                    setState(() {});
                  },
                  child: Image.asset('assets/boxsearch.png')),
              height: 60,
              width: 60,
            ),
            Text(
              'There are no items matching\n your search.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(108, 108, 108, 1), fontSize: 12),
            ),
            SizedBox(
              height: 30,
            ),
            AccentColoredButtons(
                funtion: () {
                  Navigator.pushNamed(context, '/clientsList');
                },
                title: 'Add New Client')
          ],
        ),
      ),
    );
  }

  //////
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///.  Make this reponsive to different screen size, shows yellow and black 
/// When minimized 

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

// class Invoice {
//   final String invoiceTo;
//   final DateTime date;

//   Invoice(this.invoiceTo, this.date);

// // learn sqflite
// // convert model to widget
//   // includes invoice item
// }

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
