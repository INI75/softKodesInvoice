import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/pages/client.dart';

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
          AnimatedContainer(
            width: double.infinity,
            margin: EdgeInsets.only(top: 50),
            height: 70,
            duration: Duration(seconds: 2),
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

                  //
                ),
                //
                SizedBox(width: MediaQuery.of(context).size.width * .2),
                IconButton(onPressed: () {}, icon: Icon(Icons.search))
              ],
            ),
          ),
          AnimatedContainer(
            height: 400,
            duration: Duration(seconds: 1),
            child: ListView.builder(
              itemCount: clientsList.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 70,
                  margin: EdgeInsets.only(top: 10, left: 16),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
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
