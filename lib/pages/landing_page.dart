import 'dart:async';

import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
   
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushNamedAndRemoveUntil(
            context, '/onboarding', (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
             backgroundColor: Colors.white,

      body: Center(
        child: Container(
           height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Image.asset('assets/softkodes1.png'),
              Text(
                'Invoice Management System',
                style: TextStyle(
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
