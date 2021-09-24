import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:invoice/models/user.dart';

TextEditingController _companyName = new TextEditingController();
TextEditingController _fullName = new TextEditingController();
TextEditingController _email = new TextEditingController();
TextEditingController _phoneNumber = new TextEditingController();

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool edit = false;

  @override
  Widget build(BuildContext context) {
    var user = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Profile',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/homepage',
                arguments: user);
          },
        ),
        iconTheme: IconThemeData(color: Colors.black, size: 23.33),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  edit = !edit;
                });
                if (_fullName.text.isNotEmpty) {
                  user.fullName = _fullName.text;
                }
                if (_companyName.text.isNotEmpty) {
                  user.companyName = _companyName.text;
                }
                if (_email.text.isNotEmpty) {
                  user.email = _email.text;
                }
                if (_phoneNumber.text.isNotEmpty) {
                  user.phoneNumber = _phoneNumber.text;
                }
              },
              icon: FaIcon(FontAwesomeIcons.pen,
                  size: 17, color: edit ? Colors.red : Colors.black))
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(height: 32),
          CircleAvatar(child: Image.asset('assets/Ellipse 8.png'), radius: 56),
          SizedBox(height: 35),
          edit ? Edits() : Saved(userData: user),
        ],
      ),
    );
  }
}

class Saved extends StatefulWidget {
  final User userData;
  Saved({Key? key, required this.userData}) : super(key: key);

  @override
  _SavedState createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView(
        children: [
          SavedData(data: widget.userData.fullName, title: 'Full Name'),
          SavedData(data: widget.userData.companyName, title: 'Company Name'),
          SavedData(data: widget.userData.email, title: 'E-mail'),
          SavedData(data: widget.userData.phoneNumber, title: 'Phone Number'),
        ],
      ),
    );
  }
}

class SavedData extends StatefulWidget {
  SavedData({Key? key, required this.data, required this.title})
      : super(key: key);

  final String data;
  final String title;

  @override
  _SavedDataState createState() => _SavedDataState();
}

class _SavedDataState extends State<SavedData> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
        height: 80,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title,
                style: TextStyle(color: Colors.grey, fontSize: 13)),
            SizedBox(height: 5),
            Text(widget.data,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 2),
            Container(width: double.infinity, height: .5, color: Colors.black),
          ],
        ),
      ),
    );
  }
}

//
class Edits extends StatefulWidget {
  const Edits({Key? key}) : super(key: key);

  @override
  _EditsState createState() => _EditsState();
}

class _EditsState extends State<Edits> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: ListView(
          children: [
            TextField(
                style: TextStyle(fontSize: 13),
                controller: _fullName,
                decoration: InputDecoration(
                    labelText: 'Full Name',
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.grey,
                    )),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ))),
            SizedBox(height: 10),

            TextField(
              style: TextStyle(fontSize: 13),
              controller: _companyName,
              decoration: InputDecoration(
                labelText: 'Company Name',
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),

            SizedBox(height: 10),

            TextField(
                style: TextStyle(fontSize: 13),
                controller: _email,
                decoration: InputDecoration(
                    labelText: 'Email',
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.grey,
                    )),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ))),
            //      signUpPhoneNumber,
            SizedBox(height: 10),

            TextField(
                style: TextStyle(fontSize: 13),
                controller: _phoneNumber,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Phone number',
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.grey,
                    )),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ))),
          ],
        ),
      ),
    );
  }
}
