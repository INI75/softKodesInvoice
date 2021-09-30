import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoice/pages/add_items.dart';
import 'package:invoice/pages/home_page.dart';
import 'package:invoice/pages/invoice_list.dart';
import 'package:invoice/pages/invoice_profile.dart';
import 'package:invoice/pages/new_invoice.dart';
import 'package:invoice/pages/onboarding_page.dart';
import 'package:invoice/pages/profile.dart';
import 'package:invoice/pages/recurring_page.dart';
import 'package:invoice/pages/sign_in.dart';
import '/pages/client.dart';
import 'pages/landing_page.dart';
import 'pages/settings.dart';

void main() => runApp(Start());

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Invoice App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: LandingPage(),
      routes: {
        // app pages
        '/onboarding': (context) => OnboardingPage(),
        '/sign_in': (context) => SignIn(),
        '/homepage': (context) => HomePage(),
        '/profile': (context) => Profile(),
        '/newinvoice': (context) => NewInvoice(),
        '/settings': (context) => Settings(),
        '/clientsList': (context) => ClientsList(),
        '/invoiceList': (context) => InvoiceList(),
        '/clientProfile': (context) => ClientProfile(),
        '/recurring': (context) => Recurring(),
        '/additem':(context)=>AddItems(),
        '/invoiceprofile':(context)=>InvoiceProfile(),
      },
    );
  }
}
