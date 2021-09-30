// import 'package:flutter/material.dart';

// class MyTextField extends StatefulWidget {
//   MyTextField({
//     Key? key,
//     required this.title,
//     required this.hideInformation,
//   }) : super(key: key);
//   final String title;
//   final bool hideInformation;
//   @override
//   _MyTextFieldState createState() => _MyTextFieldState(hideInformation);
// }

// class _MyTextFieldState extends State<MyTextField> {
//   final bool _hideInfo;
 

//   _MyTextFieldState(this._hideInfo);
//   final userInformationEntered = TextEditingController();
//   // void _submitData() {
//   //   if (userInformationEntered.text.isEmpty) {
//   //     return;
//   //   } else {}
//   // }

//   String data = '';
//   String getData() {
//     return data;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _hideInfo
//         ? TextField(
//             style: TextStyle(fontSize: 13),
//             // controller: userInformationEntered,
//             obscureText: _hide,
//             onSubmitted: (value) => data,
//             decoration: InputDecoration(
//               suffixIcon: IconButton(
//                 onPressed: () {
//                   setState(() {
//                     _hide = !_hide;
//                   });
//                 },
//                 icon: _hide
//                     ? Icon(Icons.remove_red_eye)
//                     : Icon(
//                         Icons.remove_red_eye,
//                         color: Colors.red,
//                       ),
//               ),
//               labelText: widget.title,
//               enabledBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(
//                   color: Colors.grey,
//                 ),
//               ),
//               focusedBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(color: Colors.black),
//               ),
//             ),
//           )
//         : TextField(
//             style: TextStyle(fontSize: 13),
//          

//             decoration: InputDecoration(
//               labelText: '',
//              
//               focusedBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(color: Colors.black),
//               ),
//             ),
//           );
//   }

// }
