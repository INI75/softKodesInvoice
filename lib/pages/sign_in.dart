import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:invoice/models/user.dart';
import 'package:invoice/widgets/color_button.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _username = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  TextEditingController _companyName = new TextEditingController();
  TextEditingController _fullName = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _phoneNumber = new TextEditingController();

  bool signUp = false;
  bool _hide = true;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(height: 10 ),
          // !signUp
          //?
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: AnimatedContainer(
              duration: Duration(seconds: 2),
              curve: Curves.bounceInOut,
              height: !signUp ? mediaQuery.size.height : 0,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  SizedBox(height: 10),

                  IconButton(
                      padding: EdgeInsets.only(right: 10),
                      alignment: Alignment.centerLeft,
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back)),
                  SizedBox(height: 10),
                  Text(
                    'Hello there!',
                    style: TextStyle(fontSize: 32),
                  ),
                  Text(
                    'Sign in to continue',
                    style: TextStyle(fontSize: 16, height: 2),
                  ),
                  Container(
                    child: Image.asset(
                      'assets/SignIn.png',
                    ),
                    width: mediaQuery.size.width,
                  ),
                  TextField(
                    style: TextStyle(fontSize: 13),
                    controller: _username,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  // password,

                  TextField(
                    style: TextStyle(fontSize: 13),
                    controller: _password,
                    obscureText: _hide,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _hide = !_hide;
                          });
                        },
                        icon: _hide
                            ? Icon(Icons.remove_red_eye)
                            : Icon(
                                Icons.remove_red_eye,
                                color: Colors.red,
                              ),
                      ),
                      labelText: 'Password',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),

                  SizedBox(height: mediaQuery.size.height * .07),
                  ColoredButtons(
                      funtion: () {
                        if (_username.text.isEmpty ||
                            _password.text.isEmpty ||
                            _companyName.text.isEmpty ||
                            _email.text.isEmpty ||
                            _phoneNumber.text.isEmpty) {
                          setState(() {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Invalid Login'),
                                    content: Text(
                                        'Please sign in to create account'),
                                  );
                                });
                          });
                          return;
                        } else {
                          setState(() {
                            User profile = new User(
                              _username.text,
                              _password.text,
                              _fullName.text,
                              _companyName.text,
                              _email.text,
                              _phoneNumber.text,
                            );
                            print('hello');
                            print(_username.text);

                            Navigator.pushNamed(
                              context,
                              '/homepage',
                              arguments: profile,
                            );
                          });
                        }
                      },
                      title: 'Sign in'),
                  SizedBox(height: mediaQuery.size.height * .02),
                  RichText(
                    text: TextSpan(
                      text: 'Sign up',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          setState(() {
                            signUp = !signUp;
                          });
                        },
                      style: TextStyle(
                        color: Color.fromRGBO(30, 115, 159, 1),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          // :
          AnimatedContainer(
            duration: Duration(seconds: 2),
            curve: Curves.bounceInOut,
            height: signUp ? mediaQuery.size.height : 0,
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Positioned(
                  top: 80,
                  child: Container(
                    width: mediaQuery.size.width,
                    height: .4,
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.black)]),
                  ),
                ),
                Positioned(
                  top: 180,
                  child: Container(
                    width: mediaQuery.size.width,
                    height: .4,
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.black)]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: ListView(
                    children: [
                      SizedBox(height: mediaQuery.size.height * .03),
                      Row(
                        children: [
                          IconButton(
                              padding: EdgeInsets.only(right: 10),
                              alignment: Alignment.centerLeft,
                              onPressed: () {
                                setState(() {
                                  signUp = !signUp;
                                });
                              },
                              icon: Icon(Icons.arrow_back)),
                          Text(
                            'Create a Profile',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      SizedBox(height: mediaQuery.size.height * .035),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // add camera  ,
                              //take pic and save to display picture
                            },
                            child: Container(
                              height: 64,
                              width: 64,
                              child: Image.asset(
                                'assets/camera.png',
                                height: 40,
                                width: 36,
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(221, 234, 241, 1),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 24,
                          ),
                          Text(
                            'Add Image',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(30, 115, 159, 1),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: mediaQuery.size.height * .060),
                      Text(
                        'Personal Details',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(30, 115, 159, 1),
                        ),
                      ),

                      TextField(
                        style: TextStyle(fontSize: 13),
                        controller: _fullName,
                        // keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),

                      //         signUpCompanyName,
                      TextField(
                        style: TextStyle(fontSize: 13),
                        controller: _companyName,
                        //  keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: 'Company Name',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      //        signUpEmail,
                      TextField(
                        style: TextStyle(fontSize: 13),
                        controller: _email,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      //      signUpPhoneNumber,
                      TextField(
                        style: TextStyle(fontSize: 13),
                        controller: _phoneNumber,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Phone number',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(height: mediaQuery.size.height * .2),

                      ColoredButtons(
                          funtion: () {
                            setState(() {
                              signUp = !signUp;
                            });
                          },
                          title: 'Next')
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
