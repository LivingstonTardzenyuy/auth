// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import '../main.dart';
// import 'email_verification_screen.dart';
// import 'login.dart';
//
// class OTPScreen extends StatefulWidget {
//   final String verificationId;
//   final String email;
//   final String phone;
//   final String password;
//
//   const OTPScreen({Key? key, required this.verificationId, required this.email, required this.phone, required this.password}) : super(key: key);
//
//   @override
//   _OTPScreenState createState() => _OTPScreenState();
// }
//
// class _OTPScreenState extends State<OTPScreen> {
//   final TextEditingController _otpController = TextEditingController();
//   bool _isLoading = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('OTP Verification'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _otpController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 hintText: 'Enter OTP',
//               ),
//             ),
//             SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: () {
//                 _verifyOTP();
//               },
//               child: Text('Verify OTP'),
//             ),
//             SizedBox(height: 20.0),
//             _isLoading ? CircularProgressIndicator() : SizedBox(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _verifyOTP() async {
//     setState(() {
//       _isLoading = true;
//     });
//
//     try {
//       final AuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: widget.verificationId,
//         smsCode: _otpController.text,
//       );
//
//       final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
//
//       // If email is verified, proceed with account creation
//       if (userCredential.user?.emailVerified ?? false) {
//         await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: widget.email,
//           password: widget.password,
//         );
//
//         // Display toast message
//         Fluttertoast.showToast(
//           msg: 'Account created successfully!',
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//         );
//
//         // Navigate to home screen or any other screen
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => HomeScreen()),
//         );
//       } else {
//         // Email not verified, navigate back to email verification screen
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => HomeScreen(
//               // email: widget.email,
//               // phone: widget.phone,
//               // password: widget.password,
//             ),
//           ),
//         );
//       }
//     } catch (error) {
//       // Handle verification failure
//       print('Error verifying OTP: $error');
//       Fluttertoast.showToast(
//         msg: 'Failed to verify OTP. Please try again.',
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//       );
//     }
//
//     setState(() {
//       _isLoading = false;
//     });
//   }
// }


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../main.dart';

class OTPScreen extends StatefulWidget {
  final String verificationId;
  final String email;
  final String phone;
  final String password;

  const OTPScreen({Key? key, required this.verificationId, required this.email, required this.phone, required this.password}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}
//
// class _OTPScreenState extends State<OTPScreen> {
//   final TextEditingController _otpController = TextEditingController();
//   bool _isLoading = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('OTP Verification'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _otpController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 hintText: 'Enter OTP',
//               ),
//             ),
//             SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: () {
//                 _verifyOTP();
//               },
//               child: Text('Verify OTP'),
//             ),
//             SizedBox(height: 20.0),
//             _isLoading ? CircularProgressIndicator() : SizedBox(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _verifyOTP() async {
//     setState(() {
//       _isLoading = true;
//     });
//
//     try {
//       final AuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: widget.verificationId,
//         smsCode: _otpController.text,
//       );
//
//       final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
//
//       // Account creation after successful phone verification
//       await _createUserWithEmailAndPassword(userCredential.user!.uid);
//
//       // Display toast message
//       Fluttertoast.showToast(
//         msg: 'Account created successfully!',
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//       );
//
//       // Navigate to home screen or any other screen
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => HomeScreen()),
//       );
//     } catch (error) {
//       // Handle verification failure
//       print('Error verifying OTP: $error');
//       Fluttertoast.showToast(
//         msg: 'Failed to verify OTP. Please try again.',
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//       );
//     }
//
//     setState(() {
//       _isLoading = false;
//     });
//   }
//
//   Future<void> _createUserWithEmailAndPassword(String uid) async {
//     try {
//       await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: widget.email,
//         password: widget.password,
//       );
//
//       // Additional logic to store user data (phone number) in a separate database like Firestore can be added here
//     } catch (error) {
//       print('Error creating user with email and password: $error');
//       // Handle errors appropriately
//     }
//   }
// }


class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController _otpController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter OTP',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _verifyOTP();
              },
              child: Text('Verify OTP'),
            ),
            SizedBox(height: 20.0),
            _isLoading ? CircularProgressIndicator() : SizedBox(),
          ],
        ),
      ),
    );
  }

  void _verifyOTP() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: _otpController.text,
      );

      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      // Account creation after successful phone verification
      await _createUserWithEmailAndPassword(userCredential.user!.uid);

      // Display toast message
      Fluttertoast.showToast(
        msg: 'Account created successfully!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );

      // Navigate to home screen or any other screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } catch (error) {
      // Handle verification failure
      print('Error verifying OTP: $error');
      Fluttertoast.showToast(
        msg: 'Failed to verify OTP. Please try again.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _createUserWithEmailAndPassword(String uid) async {
    try {
      // Create Firebase account using email, phone, and password
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: widget.email,
        password: widget.password,
      );

      // Additional logic to store user data (phone number) in a separate database like Firestore can be added here
    } catch (error) {
      print('Error creating user with email and password: $error');
      // Handle errors appropriately
    }
  }
}
