import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:invoice/models/clients.dart';
import 'package:invoice/widgets/client_figs.dart';
import 'package:invoice/widgets/color_button.dart';
import 'package:invoice/widgets/line.dart';

final List<Clients> clientsList = [];

// clients
TextEditingController _clientName = new TextEditingController();
TextEditingController _clientEmail = new TextEditingController();
TextEditingController _clientPhone = new TextEditingController();
TextEditingController _clientAddress = new TextEditingController();
TextEditingController _clientCity = new TextEditingController();
TextEditingController _clientState = new TextEditingController();
TextEditingController _clientCountry = new TextEditingController();
//client edit controllers

// use to make new client  object for client list
bool change = true;

class ClientsList extends StatefulWidget {
  ClientsList({Key? key}) : super(key: key);

  @override
  _ClientsListState createState() => _ClientsListState();
}

class _ClientsListState extends State<ClientsList> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black, size: 23.33),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              if (change) {
                Navigator.pop(context);
              } else {
                setState(() {
                  change = !change;
                });
              }
            },
          ),
          title: Text(change ? 'Clients' : 'Add New Client',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          actions: [
            if (change) IconButton(onPressed: () {}, icon: Icon(Icons.search))
          ],
        ),
        backgroundColor: Colors.white,
        body: ListView(children: [
          AnimatedContainer(
            duration: Duration(seconds: 2),
            curve: Curves.bounceInOut,
            height: change ? media.size.height : 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: ListView.builder(
                itemCount: clientsList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/clientProfile',
                          arguments: clientsList[index]);
                    },
                    child: Container(
                      height: 70,
                      margin: EdgeInsets.only(top: 15),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.amber,
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
                                  Text(clientsList[index].phone,
                                      style: TextStyle(fontSize: 12)),
                                ],
                              ),
                            ),
                          ]),
                    ),
                  );
                },
              ),
            ),
          ),

          ///

          AnimatedContainer(
              duration: Duration(seconds: 2),
              height: change ? 0 : 650,
              curve: Curves.bounceInOut,
              child: ListView(children: [
                Container(
                  height: 210,
                  margin: EdgeInsets.only(left: 16, right: 16, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Client Details',
                          style: TextStyle(
                            color: Color.fromRGBO(30, 115, 159, 1),
                            fontSize: 16,
                          )),
                      TextField(
                        style: TextStyle(fontSize: 13),
                        controller: _clientName,
                        decoration: InputDecoration(
                          labelText: 'Client Name',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      TextField(
                        style: TextStyle(fontSize: 13),
                        controller: _clientEmail,
                        decoration: InputDecoration(
                          labelText: 'E-mail',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      TextField(
                        style: TextStyle(fontSize: 13),
                        controller: _clientPhone,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                DashLine(),
                Container(
                    height: 280,
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Address Details',
                            style: TextStyle(
                              color: Color.fromRGBO(30, 115, 159, 1),
                              fontSize: 16,
                            ),
                          ),
                          TextField(
                            style: TextStyle(fontSize: 13),
                            controller: _clientAddress,
                            decoration: InputDecoration(
                              labelText: 'Address',
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                          TextField(
                            style: TextStyle(fontSize: 13),
                            controller: _clientCity,
                            decoration: InputDecoration(
                              labelText: 'City',
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                          TextField(
                            style: TextStyle(fontSize: 13),
                            controller: _clientState,
                            decoration: InputDecoration(
                              labelText: 'State',
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                          TextField(
                              style: TextStyle(fontSize: 13),
                              controller: _clientCountry,
                              decoration: InputDecoration(
                                labelText: 'Country',
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                              ))
                        ])),
                ColoredButtons(
                    funtion: () {
                    // Add more if checks for validation when testing
                      if (_clientAddress.text.isNotEmpty &&
                          _clientCity.text.isNotEmpty &&
                          _clientCountry.text.isNotEmpty &&
                          _clientEmail.text.isNotEmpty &&
                          _clientName.text.isNotEmpty &&
                          _clientPhone.text.isNotEmpty &&
                          _clientState.text.isNotEmpty) {
                        final _newClient = Clients(
                            name: _clientName.text,
                            address: _clientAddress.text,
                            city: _clientCity.text,
                            country: _clientCountry.text,
                            email: _clientEmail.text,
                            phone: _clientPhone.text,
                            state: _clientState.text);
                        clientsList.add(_newClient);
                        _clientName.text = '';
                        _clientAddress.text = '';
                        _clientCity.text = '';
                        _clientCountry.text = '';
                        _clientEmail.text = '';
                        _clientPhone.text = '';
                        _clientState.text = '';

                        setState(() {
                          change = !change;
                        });
                      } else {
                        setState(() {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Unable to create Client'),
                                  content: Text('Please fill in all details'),
                                );
                              });
                        });
                      }
                    },
                    title: 'Add Client.'),
              ]))
        ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: change
            ? FloatingActionButton(
                onPressed: () {
                  setState(() {
                    change = !change;
                  });
                },
                backgroundColor: Color.fromRGBO(30, 115, 159, 1),
                child: Icon(Icons.add),
              )
            : Container());
  }
}

class ClientProfile extends StatefulWidget {
  ClientProfile({
    Key? key,
  }) : super(key: key);

  @override
  _ClientProfileState createState() => _ClientProfileState();
}

class _ClientProfileState extends State<ClientProfile> {
  bool edit = false;

  @override
  Widget build(BuildContext context) {
    var person = ModalRoute.of(context)!.settings.arguments as Clients;
    return Scaffold(
        body: ListView(children: [
      Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          width: double.infinity,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    edit = !edit;
                  });
                },
                icon: FaIcon(FontAwesomeIcons.pen, size: 17))
          ])),
      SizedBox(height: 20),
      Container(
          height: 170,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                    backgroundColor: Colors.amber,
                    radius: 60,
                    child: Text(
                      '${person.name.characters.first.toUpperCase()}' +
                          '${person.name.characters.last.toUpperCase()}',
                      style: TextStyle(color: Colors.black, fontSize: 64),
                    )),
                Text(person.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
              ])),
      edit ? Edits() : Saved(clients: person),
      Container(
        margin: EdgeInsets.only(top: 20),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Figs(number: '10', word: 'invoice sent'),
              Figs(number: '7', word: 'Paid invoice'),
              Figs(number: '3', word: 'Unpaid invoice')
            ]),
        height: 100,
        width: double.infinity,
        color: Color.fromRGBO(30, 115, 159, 1),
      )
    ]));
  }
}

class Edits extends StatefulWidget {
  const Edits({Key? key}) : super(key: key);

  @override
  _EditsState createState() => _EditsState();
}

class _EditsState extends State<Edits> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      ClientEdit(icon: Icons.mail_outline, title: 'Email', text: _clientEmail),
      ClientEdit(
          icon: Icons.phone_outlined,
          title: 'Phone Number',
          text: _clientPhone),
      ClientEdit(
          icon: Icons.location_on, title: 'Address', text: _clientAddress),
    ]));
  }
}

class Saved extends StatelessWidget {
  const Saved({Key? key, required this.clients}) : super(key: key);
  final Clients clients;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      ClientSaved(
          icon: Icons.mail_outline, title: clients.email, header: 'Email'),
      ClientSaved(
          icon: Icons.phone_outlined,
          title: clients.phone,
          header: 'Phone Number'),
      ClientSaved(
          icon: Icons.location_on, title: clients.address, header: 'Address'),
    ]));
  }
}

class ClientEdit extends StatelessWidget {
  ClientEdit({
    Key? key,
    required this.icon,
    required this.title,
    required this.text,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final TextEditingController text;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              color: Color.fromRGBO(30, 115, 159, 1),
            ),
            Container(
                width: 250,
                child: TextField(
                  controller: text,
                  style: TextStyle(fontSize: 13),
                  decoration: InputDecoration(
                    labelText: title,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ))
          ],
        ));
  }
}

class ClientSaved extends StatelessWidget {
  ClientSaved({
    Key? key,
    required this.icon,
    required this.title,
    required this.header,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final String header;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, color: Color.fromRGBO(30, 115, 159, 1)),
            Container(
                margin: EdgeInsets.only(bottom: 15),
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(header,
                        style: TextStyle(
                            color: Color.fromRGBO(108, 108, 108, 1),
                            fontSize: 12)),
                    SizedBox(height: 5),
                    Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                    DashLine()
                  ],
                ))
          ],
        ));
  }
}
