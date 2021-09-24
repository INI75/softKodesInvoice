import 'package:flutter/material.dart';
import 'package:invoice/widgets/color_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [

          SizedBox(height: mediaQuery.size.height * .25),
          Center(
            heightFactor: 1,
            child: Column(
              children: [
                Image.asset('assets/bro.png'),
                Text(
                  'Create and share invoices \nwith clients.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                
              ],
            ),
          ),
          SizedBox(
            height: mediaQuery.size.height * .15,
          ),
          ColoredButtons(
            funtion: () => Navigator.pushNamed(context, '/sign_in'),
            title: 'Get Started',
          )
        ],
      ),
    );
  }
}
