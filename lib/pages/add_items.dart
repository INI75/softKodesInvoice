import 'package:flutter/material.dart';
import 'package:invoice/models/add_item_model.dart';
import 'package:invoice/widgets/color_button.dart';
import 'package:invoice/widgets/line.dart';

class AddItems extends StatefulWidget {
  AddItems({Key? key}) : super(key: key);

  @override
  _AddItemsState createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  static int no = 1;
  final List<String> _discountsMethod = [
    'Tax',
    'Percentage',
    'Coupons',
    'Gift Card'
  ];
  String _selectedItem = 'Percentage';

  var _discription = TextEditingController();

  var _quantity = TextEditingController();

  var _rate = TextEditingController();

  var _percentage = TextEditingController();

  var _tax = TextEditingController();

  var _total;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Add Item',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        iconTheme: IconThemeData(color: Colors.black, size: 23.33),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Invoice Items',
                  style: TextStyle(
                    color: Color.fromRGBO(30, 115, 159, 1),
                    fontSize: 16,
                  ),
                ),
                TextField(
                  style: TextStyle(fontSize: 13),
                  controller: _discription,
                  decoration: InputDecoration(
                    labelText: 'Item Description',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Quantity',
                              style: TextStyle(
                                  color: Color.fromRGBO(108, 108, 108, 1),
                                  fontSize: 12),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              color: Color.fromRGBO(233, 233, 233, 1),
                              height: 30,
                              width: 70,
                              child: TextField(
                                style: TextStyle(fontSize: 13),
                                controller: _quantity,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Rate',
                              style: TextStyle(
                                  color: Color.fromRGBO(108, 108, 108, 1),
                                  fontSize: 12),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              color: Color.fromRGBO(233, 233, 233, 1),
                              height: 30,
                              width: 70,
                              child: TextField(
                                style: TextStyle(fontSize: 13),
                                controller: _rate,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

          //

          //

          //
          DashLine(),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add Discount',
                  style: TextStyle(
                    color: Color.fromRGBO(30, 115, 159, 1),
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Select Discount Method',
                  style: TextStyle(
                      color: Color.fromRGBO(108, 108, 108, 1), fontSize: 12),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 15),
                  padding: EdgeInsets.all(2.5),
                  color: Color.fromRGBO(233, 233, 233, 1),
                  height: 30,
                  width: 200,
                  child: DropdownButton<String>(
                    underline: Container(),

                    items: _discountsMethod
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
                ),
                Text(
                  'Enter Discount in percentage',
                  style: TextStyle(
                      color: Color.fromRGBO(108, 108, 108, 1), fontSize: 12),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 15),
                  padding: EdgeInsets.all(2.5),
                  color: Color.fromRGBO(233, 233, 233, 1),
                  height: 30,
                  width: 200,
                  child: TextField(
                    style: TextStyle(fontSize: 13),
                    controller: _percentage,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          DashLine(),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add Tax',
                  style: TextStyle(
                    color: Color.fromRGBO(30, 115, 159, 1),
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 9),
                Text(
                  'Select Tax Method',
                  style: TextStyle(
                      color: Color.fromRGBO(108, 108, 108, 1), fontSize: 12),
                ),
                Text(
                  'Amount',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 9),
                Text(
                  'Enter tax in NGN',
                  style: TextStyle(
                      color: Color.fromRGBO(108, 108, 108, 1), fontSize: 12),
                ),
                TextField(
                  style: TextStyle(fontSize: 13),
                  controller: _tax,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'enter here'),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 16, left: 16, top: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total Amount',
                          style: TextStyle(
                              color: Color.fromRGBO(108, 108, 108, 1),
                              fontSize: 12)),
                      Text(
                        'NGN $_total',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 200,
                  child: ColoredButtons(
                      funtion: () {
                        final a = AddItemDetails(
                            _discription.text,
                            _quantity.text,
                            _rate.text,
                            _percentage.text,
                            _tax.text,
                            _total,
                            no.toString());
                        no++;
                      },
                      title: 'Add Item'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
