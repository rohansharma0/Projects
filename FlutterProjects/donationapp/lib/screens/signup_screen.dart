// import 'package:bewakoof/models/http_exception.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../providers/auth.dart';
// import '../screens/home_screen.dart';
// import './login_screen.dart';

// class SignupScreen extends StatefulWidget {
//   const SignupScreen({
//     Key key,
//   }) : super(key: key);
//   static const routeName = '/signup';
//   @override
//   _SignupScreenState createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   final GlobalKey<FormState> _formKey = GlobalKey();
//   Map<String, String> _authData = {
//     // 'firstname': '',keytool -list -v
//     // 'lastname': '',
//     // 'phNumber': '',
//     'email': '',
//     'password': '',
//   };
//   var _isLoading = false;
//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (ctx) => AlertDialog(
//         title: Text('An Error Occurred!'),
//         content: Text(message),
//         actions: <Widget>[
//           FlatButton(
//             child: Text('Okey'),
//             onPressed: () {
//               Navigator.of(ctx).pop();
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> _submit() async {
//     print(_authData);
//     if (!_formKey.currentState.validate()) {
//       //invalid
//       return;
//     }
//     _formKey.currentState.save();
//     setState(() {
//       _isLoading = true;
//     });
//     //signup----
//     //error Should be handle...........
//     try {
//       await Provider.of<Auth>(context, listen: false).signup(
//         _authData['email'],
//         _authData['password'],
//       );
//     } on HttpException catch (error) {
//       var errorMessage = 'Authentication failed';
//       if (error.toString().contains('EMAIL_EXISTS')) {
//         errorMessage = 'This email address is already in use.';
//       }
//       _showErrorDialog(errorMessage);
//     } catch (error) {
//       var errorMessage = 'Could not authenticate you. Please try again later';
//       _showErrorDialog(errorMessage);
//     }

//     Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
//     setState(() {
//       _isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: Colors.black),
//         title: Text(
//           'Bewakoof',
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
//         ),
//         backgroundColor: Colors.white,
//       ),
//       backgroundColor: Colors.white,
//       body: Container(
//         padding: EdgeInsets.all(25),
//         child: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               Form(
//                 key: _formKey,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: <Widget>[
//                       // TextFormField(
//                       //   decoration: InputDecoration(
//                       //     hintText: 'First Name',
//                       //     hintStyle: TextStyle(
//                       //       fontWeight: FontWeight.w500,
//                       //       color: Colors.grey,
//                       //     ),
//                       //   ),
//                       //   cursorColor: Color.fromRGBO(0, 150, 136, 1),
//                       //   keyboardType: TextInputType.text,
//                       //   validator: (value) {
//                       //     if (value.isEmpty) {
//                       //       return 'Please enter first name';
//                       //     }
//                       //     return null;
//                       //   },
//                       //   onSaved: (value) {
//                       //     _authData['firstname'] = value;
//                       //   },
//                       // ),
//                       // SizedBox(height: 15),
//                       // TextFormField(
//                       //   decoration: InputDecoration(
//                       //     hintText: 'Last Name',
//                       //     hintStyle: TextStyle(
//                       //       fontWeight: FontWeight.w500,
//                       //       color: Colors.grey,
//                       //     ),
//                       //   ),
//                       //   cursorColor: Color.fromRGBO(0, 150, 136, 1),
//                       //   keyboardType: TextInputType.text,
//                       //   validator: (value) {
//                       //     if (value.isEmpty) {
//                       //       return 'Please enter last name';
//                       //     }
//                       //     return null;
//                       //   },
//                       //   onSaved: (value) {
//                       //     _authData['lastname'] = value;
//                       //   },
//                       // ),
//                       // SizedBox(height: 15),
//                       // TextFormField(
//                       //   decoration: InputDecoration(
//                       //     hintText: 'Mobile Number',
//                       //     hintStyle: TextStyle(
//                       //       fontWeight: FontWeight.w500,
//                       //       color: Colors.grey,
//                       //     ),
//                       //   ),
//                       //   cursorColor: Color.fromRGBO(0, 150, 136, 1),
//                       //   keyboardType: TextInputType.number,
//                       //   onSaved: (value) {
//                       //     _authData['phNumber'] = value;
//                       //   },
//                       // ),
//                       // SizedBox(height: 15),
//                       TextFormField(
//                         decoration: InputDecoration(
//                           hintText: 'Email Id',
//                           hintStyle: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             color: Colors.grey,
//                           ),
//                         ),
//                         cursorColor: Color.fromRGBO(0, 150, 136, 1),
//                         keyboardType: TextInputType.emailAddress,
//                         validator: (value) {
//                           if (value.isEmpty || !value.contains('@')) {
//                             return 'Invalid email!';
//                           }
//                           return null;
//                         },
//                         onSaved: (value) {
//                           _authData['email'] = value;
//                         },
//                       ),
//                       SizedBox(height: 15),
//                       TextFormField(
//                         decoration: InputDecoration(
//                           hintText: 'Password',
//                           hintStyle: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             color: Colors.grey,
//                           ),
//                         ),
//                         cursorColor: Color.fromRGBO(0, 150, 136, 1),
//                         keyboardType: TextInputType.text,
//                         obscureText: true,
//                         validator: (value) {
//                           if (value.isEmpty || value.length < 5) {
//                             return 'Password is too short!';
//                           }
//                         },
//                         onSaved: (value) {
//                           _authData['password'] = value;
//                         },
//                       ),
//                       SizedBox(height: 30),
//                       if (_isLoading)
//                         CircularProgressIndicator()
//                       else
//                         Container(
//                           height: 50,
//                           width: double.infinity,
//                           child: RaisedButton(
//                             elevation: 0,
//                             highlightElevation: 0,
//                             color: Color.fromRGBO(0, 150, 136, 1),
//                             onPressed: _submit,
//                             child: Text(
//                               'SIGN UP',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             colorBrightness: Brightness.dark,
//                           ),
//                         ),
//                       SizedBox(height: 25),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           Text(
//                             'Have an account ?',
//                             style: TextStyle(color: Colors.grey),
//                           ),
//                           SizedBox(width: 10),
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.of(context).pop();
//                               Navigator.of(context)
//                                   .popAndPushNamed(LoginScreen.routeName);
//                             },
//                             child: Text(
//                               'LOG IN',
//                               style: TextStyle(
//                                 color: Color.fromRGBO(0, 150, 136, 1),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
