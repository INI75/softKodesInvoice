import 'package:flutter/material.dart';
import 'package:invoice/widgets/color_button.dart';

import 'package:invoice/widgets/line.dart';

class Recurring extends StatefulWidget {
  const Recurring({Key? key}) : super(key: key);

  @override
  _RecurringState createState() => _RecurringState();
}

class _RecurringState extends State<Recurring> {
  bool _automatic = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black, size: 23.33),
        backgroundColor: Colors.white,
        title: Text('Mark as Recurring',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Reminder',
                    style: TextStyle(
                        color: Color.fromRGBO(30, 115, 159, 1), fontSize: 16)),
                ReminderLine(title: 'Date', detail: '8/04/2021'),
                ReminderLine(title: 'Time', detail: '02:00 PM')
              ],
            ),
          ),
          DashLine(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Repeat',
                    style: TextStyle(
                        color: Color.fromRGBO(30, 115, 159, 1), fontSize: 16)),
                TickField(occurance: 'Every Week'),
                TickField(occurance: 'Every Month'),
                TickField(occurance: 'Every Year'),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _automatic = !_automatic;
                    });
                  },
                  child: Container(
                      margin: EdgeInsets.only(right: 20, top: 7),
                      child: _automatic
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : Container(),
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(30, 115, 159, 1),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 1,
                                spreadRadius: 2,
                                color: Colors.grey,
                                offset: Offset(1, 1))
                          ])),
                ),
                Container(
                  width: 270,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Send Invoice Automatically',
                          style: TextStyle(
                              color: Color.fromRGBO(30, 115, 159, 1),
                              fontSize: 16)),
                      Text(
                        'Send this  invoice at a specific' +
                            ' time to this client unless ' +
                            'stopped manually.',
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(108, 108, 108, 1)),
                        overflow: TextOverflow.clip,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 120, vertical: 30),
              child: AccentColoredButtons(funtion: () {}, title: 'Done'))
        ],
      ),
    );
  }
}

class ReminderLine extends StatelessWidget {
  ReminderLine({Key? key, required this.title, required this.detail})
      : super(key: key);

  final String title;
  final String detail;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Color.fromRGBO(108, 108, 108, 1), fontSize: 12),
          ),
          Container(
            child: Row(
              children: [
                Text(detail),
                SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 13,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TickField extends StatefulWidget {
  TickField({Key? key, required this.occurance}) : super(key: key);
  final String occurance;

  @override
  _TickFieldState createState() => _TickFieldState();
}

class _TickFieldState extends State<TickField> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _checked = !_checked;
              });
            },
            child: Container(
                margin: EdgeInsets.only(right: 20),
                child: _checked
                    ? Icon(
                        Icons.done,
                        color: Color.fromRGBO(30, 115, 159, 1),
                      )
                    : Container(),
                height: 25,
                width: 25,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      blurRadius: 1,
                      spreadRadius: 2,
                      color: Colors.grey,
                      offset: Offset(1, 1))
                ])),
          ),
          Text(widget.occurance),
        ],
      ),
    );
  }
}
