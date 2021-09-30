import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import '/pages/new_invoice.dart';

class InvoiceList extends StatefulWidget {
  InvoiceList({Key? key}) : super(key: key);

  @override
  _InvoiceListState createState() => _InvoiceListState();
}

class _InvoiceListState extends State<InvoiceList> {
  final List<String> _invoiceType = [
    'Recurring Invoice',
    'All Invoice',
    'Saved Invoice'
  ];
  String _selectedItem = 'All Invoice';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 50),
            height: 50,
            child: Row(
              children: [
                IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                //
                SizedBox(width: MediaQuery.of(context).size.width * .03),

                DropdownButton<String>(
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: GoogleFonts.poppins().fontFamily),
                  underline: Container(),
                  items: _invoiceType
                      .map((String dropDownItems) => DropdownMenuItem(
                            child: Text(dropDownItems),
                            value: dropDownItems,
                          ))
                      .toList(),
                  value: _selectedItem,
                  onChanged: (dropDownItems) {
                    setState(() {
                      this._selectedItem = dropDownItems!;
                    });
                  },
                ),

                SizedBox(width: MediaQuery.of(context).size.width * .2),
                IconButton(onPressed: () {}, icon: Icon(Icons.search))
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 100,
            child: ListView.builder(
              itemCount: invoiceList.length,
              itemBuilder: (context, index) {
                return Slidable(
                  actionExtentRatio: .2,
                  secondaryActions: [
                    IconSlideAction(
                      caption: 'More',
                      color: Colors.green,
                      icon: Icons.more_horiz,
                      onTap: () {
                        Navigator.pushNamed(context, '/invoiceprofile',arguments: invoiceList[index]);
                      },
                    ),
                    IconSlideAction(
                      caption: 'Delete',
                      color: Colors.red,
                      icon: Icons.delete_outline,
                    ),
                  ],
                  direction: Axis.horizontal,
                  // actions: [
                  //   IconSlideAction(
                  //     color: Colors.amber,
                  //     icon: Icons.ac_unit,
                  //   )
                  // ],
                  actionPane: SlidableDrawerActionPane(),
                  child: Container(
                    height: 80,
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                invoiceList[index].getClientData(),
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                'Date: ${invoiceList[index].getInvoiceDate()}',
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                'Invoice No:${invoiceList[index].getInvoiceNo()}',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'NGN${invoiceList[index].getGrandTotal()}',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromRGBO(30, 115, 159, 1)),
                              ),
                              Text('tax ${invoiceList[index].getTax()}')
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/newinvoice');
        },
        backgroundColor: Color.fromRGBO(30, 115, 159, 1),
        child: Icon(Icons.add),
      ),
    );
  }
}
